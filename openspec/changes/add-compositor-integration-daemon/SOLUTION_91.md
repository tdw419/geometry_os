# Solution for Task: Configure daemon priority (HIGH)

[**Context: Geometry OS Implementation Agent**]

Your goal is to provide a concise implementation plan or code solution for the OpenSpec task of adding an integration daemon, which is necessary for the following change ID, "add-compositor-integration-daemon". The task requires you to modify file paths and create or modify Python or Rust code. Please follow the format provided below with a clear Markdown markup.

1. File Paths Required:
   - /etc/default/compositor (to set priority of compositor daemon)
   - /lib/systemd/system/composite-daemon.service (to start and enable the compositor daemon)
   - /usr/bin/xserver_cmd (to run Xorg commands in the background)

2. Python or Rust Code Required:
   ```python
   #!/usr/bin/env python3

   import subprocess  # for running systemd commands

   def main():
       priority = 'HIGH'  # change to match priority of compositor daemon
       # set priority of compositor daemon
       subprocess.run(["systemctl", "set-priority", "--noquery", "composite-daemon.service", priority])
       # start compositor daemon
       subprocess.run(["xserver_cmd", "-h"])
   ```

3. Next Step Command:
   ```bash
   bash $0
   ```

Please format your code as clear and concise Markdown, following the style guide provided in the given text.