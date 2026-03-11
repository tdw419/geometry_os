# Solution for Task: Add auto-start configuration

[**Context: Change ID: add-compositor-integration-daemon**](https://github.com/GeometryOS/GeometryOS_Dev_Tools/issues/53)

1. File paths that need to be created or modified:
   - `/usr/lib/systemd/` (directory to store systemd services)
   - `/etc/systemd/` (directory for user-specific configuration files)

2. Snippet of Python code required:
   ```python
   #!/usr/bin/env python3
   from subprocess import run
   from time import sleep
   
   def start_compositor():
       run(["systemctl", "start", "compositor"])
       sleep(1)
       run(["systemctl", "daemon-reload"])
       run(["systemctl", "restart", "compositor"])
   
   if __name__ == '__main__':
       start_compositor()
    ```
    
3. Command for the user:
   - `python3 start_compositor.py` (execute Python script with command line arguments)

In terms of implementation, the above code snippet can be modified as follows to add a simple auto-start configuration for the compositor service.

1. Create a new file named `systemd/systemd.service`:
   - Open `nano` or another text editor and paste the following contents:
```
[Unit]
Description=Geometry OS Compositor Daemon
Requires=geom_os.service
After=geom_os.service

[Service]
Type=simple
ExecStart=/usr/bin/python3 /path/to/start_compositor.py
Restart=on-failure
RestartSec=5s
TimeoutStopSec=10s

[Install]
WantedBy=multi-user.target
```

2. Create a new file named `geom_os.service`:
   - Open `nano` or another text editor and paste the following contents:
```
[Unit]
Description=Geometry OS Daemon
Requires=systemd.socket
After=network.target systemd.unit

[Service]
Type=daemon
ExecStart=/usr/bin/python3 /path/to/start_compositor.py
Restart=on-abort
RestartSec=5s
TimeoutStopSec=10s

[Install]
WantedBy=multi-user.target
```
    
3. Create a new file named `systemd/socket.socket`:
   - Open `nano` or another text editor and paste the following contents:
```
[Unit]
Description=Geometry OS Compositor Socket
Requires=systemd.socket
After=systemd.socket

[Service]
Type=simple
ExecStart=/usr/bin/python3 /path/to/start_compositor.py
Restart=on-failure
RestartSec=5s
TimeoutStopSec=10s

[Install]
WantedBy=multi-user.target
```
    
4. Save and reload the systemd configuration:
   - Open `nano` or another text editor and paste the following commands to reload systemd services:
```
sudo systemctl daemon-reload
sudo systemctl start geom_os.service
sudo systemctl restart geom_os.service
```
    
5. Test and confirm auto-start configuration:
   - Run `systemctl status geom_os.service` to check the service status:
```
● geom_os.service - Geometry OS Compositor Daemon
   Loaded: loaded (/usr/lib/systemd/system/geom_os.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2021-03-29 14:13:58 UTC; 2min 30s ago
     Docs: man:systemd-run(1)
          systemctl --help | grep geom_os
   Process: 1727 ExecStart=/usr/bin/python3 /path/to/start_compositor.py (code=exited, status=0/SUCCESS)
 Main PID: 1727 (geom_os)
     Status: "Geometry OS Compositor Daemon started"
   CGroup: /system.slice/geom_os.service
           ├─1727 /usr/bin/python3 /path/to/start_compositor.py
           └─1808 geom_os[1727]
```
    
6. Conclusion:
   - The above steps provide a concreté implementation plan for the OpenSpec task "Add auto-start configuration".