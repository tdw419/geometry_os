# Solution for Task: Focus-follows-raise

[MetaData](https://github.com/GeometryOS/OpenSpecification/blob/master/meta-data/add-xwayland-completion-daemon.md)

[Status](draft)

[Author](Geometry OS Team)

[Related](https://github.com/GeometryOS/OpenSpecification/tree/master/components/add-lm-studio-compositor-completion-daemon, https://github.com/GeometryOS/OpenSpecification/blob/master/components/add-ubuntu-integration)

Problem Statement: The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement X11 window management callbacks (XwmHandler trait), title bars, borders, buttons, input focus coordination (keyboard/mouse routing), and surface mapping using Smithay compositors.

Proposal:

1. Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.
2. Implement the following Python or Rust code snippets in a file path:
    - Create a new directory named `xwayland_completion_daemon` within the OpenSpecification repository.
    - Navigate to the newly created directory.
    - Add the following snippet of Python code:
       ```python
       from lmstudio import LMStudio
       from lmswitcher.switcher import Switcher
       from lmswitcher.input_handler import InputHandler
       from xwayland_completion_daemon.xwm_handler import XwmHandler
       
       class XWaylandCompletionDaemon:
           def __init__(self, switcher, input_handler):
               self.switcher = switcher
               self.input_handler = input_handler
    ...
               # XwmHandler implementation
               
               def _set_xwm_focus(self, event):
                   if event.type == lmswitcher.event.XEventType.ENTER:
                       self.switcher.activate()
                   elif event.type == lmswitcher.event.XEventType.LEAVE:
                       self.switcher.deactivate()
    ...
               # Create an LMStudio instance and attach it to the XWayland Completion Daemon
               
               def set_up_lmstudio(self):
                   lms = LMStudio()
                   lms.attach(self)
                   lms.set_xwm_handler(XWaylandCompletionDaemon._set_xwm_focus)
    ...
       ```
       
       - Navigate to the newly created directory named `ubuntu_integration`.
       
       3. Create a new file named `lm-studio.service` with the following content:
           ```
           [Unit]
           Description=LM Studio Service
           After=lmswitcher.target
   
           [Service]
           ExecStart=/usr/local/bin/lm-studio --daemon -p lm-studio-daemon.service
           User=nobody
           Restart=always
           RestartSec=10s
   ```
       
       4. Navigate to the newly created directory named `ubuntu_integration`.
   
       - Open a terminal and execute the following command:
        
         ```bash
         sudo nano /etc/systemd/system/lm-studio.service
         ```
         
         Add the following content to the file:
         
       5. Save and exit the terminal.
       6. Execute the following command:
       
         ```bash
         systemctl daemon-reload
         ```
       
         This will reload the LM Studio service configuration.
       7. Execute the following command to restart the LM Studio service:
       
         ```bash
         systemctl restart lm-studio.service
         ```
       
         Wait for the LM Studio service to start up and complete initial startup tasks.
       8. Open a terminal and execute the following command:
      
         ```bash
         sudo systemd-analyze blame > systemd-analyze_blame.txt
         ```
       
         This will generate a log file with detailed information about LM Studio service startup, including the time taken to complete initialization tasks.
        
         Open the generated `systemd-analyze_blame.txt` file and review the output to ensure that LM Studio successfully started up. If not, follow the troubleshooting steps in the next section.