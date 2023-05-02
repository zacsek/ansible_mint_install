
build-docker:
	docker build -t ansible-ssh-server .
start-docker:
	docker run -d -p 2222:22 --name ansible-ssh-container ansible-ssh-server
connect-docker:
	ssh -p 2222 root@localhost
run-docker:
	ansible-playbook -i 'localhost:2222,' -u root -k -e ansible_python_interpreter=/usr/bin/python3 playbook.yaml
run-dry:
	ansible-playbook -i inventory.ini playbook.yaml --check
run:
	ansible-playbook -i inventory.ini playbook.yaml
requirements:
        yq -e '.pip | to_entries | .[].key' packages.yaml > requirements.txt
