# Solution for Task: Implement `cargo check` validation

[File paths: `/etc/cargo/check.d/` and `/home/user/.config/GeometryOS/system/geom/bin/cargo-daemon`](https://github.com/GeometryOS/GeometryOS/tree/main/src/kernel/services/geometryos#add-compositor-integration-daemon)

1. `/etc/cargo/check.d/`
   * Create a file at `~/.config/GeometryOS/system/geom/bin` called `cargo-check.service`.
   * Inside the file, add the following code:
       ```python
       import os
       import json
       import sys
       import logging
       
       from subprocess import Popen, PIPE
       
       class CargoCheckService(object):
           def __init__(self):
               self.logger = logging.getLogger(__name__)
               
           def start_service(self):
               args = [sys.executable, "-m", "cargo.bin.check", "--config-path=/etc/cargo"]
               process = Popen(args, stdout=PIPE, stderr=PIPE)
               
               try:
                   self.logger.debug("Starting cargo check daemon...")
                   json_data = {
                       "type": "start",
                       "config": {}
                   }
                   data = json.dumps(json_data)
                   process.stdin.write(bytes(data, encoding="utf-8"))
                   response = process.stdout.readline().decode("utf-8")
                   self.logger.debug(f"Response: {response}")
               except Exception as e:
                   self.logger.error(e)
               else:
                   if process.returncode != 0:
                       self.logger.error("Cargo check daemon failed to start.")
                       return False
                   else:
                       self.logger.info("Cargo check daemon started successfully.")
                       return True
       
           def stop_service(self):
               args = [sys.executable, "-m", "cargo.bin.check", "--config-path=/etc/cargo", "stop"]
               process = Popen(args, stdout=PIPE, stderr=PIPE)
               
               try:
                   self.logger.debug("Stopping cargo check daemon...")
                   json_data = {
                       "type": "stop",
                       "config": {}
                   }
                   data = json.dumps(json_data)
                   process.stdin.write(bytes(data, encoding="utf-8"))
                   response = process.stdout.readline().decode("utf-8")
                   self.logger.debug(f"Response: {response}")
               except Exception as e:
                   self.logger.error(e)
               else:
                   if process.returncode != 0:
                       self.logger.error("Cargo check daemon failed to stop.")
                       return False
                   else:
                       self.logger.info("Cargo check daemon stopped successfully.")
                       return True
       
           def restart_service(self):
               args = [sys.executable, "-m", "cargo.bin.check", "--config-path=/etc/cargo", "restart"]
               process = Popen(args, stdout=PIPE, stderr=PIPE)
               
               try:
                   self.logger.debug("Restarting cargo check daemon...")
                   json_data = {
                       "type": "restart",
                       "config": {}
                   }
                   data = json.dumps(json_data)
                   process.stdin.write(bytes(data, encoding="utf-8"))
                   response = process.stdout.readline().decode("utf-8")
                   self.logger.debug(f"Response: {response}")
               except Exception as e:
                   self.logger.error(e)
               else:
                   if process.returncode != 0:
                       self.logger.error("Cargo check daemon failed to restart.")
                       return False
                   else:
                       self.logger.info("Cargo check daemon restarted successfully.")
                       return True
        ```
        
        2. `/home/user/.config/GeometryOS/system/geom/bin/cargo-daemon`
           * Create a new file at this location with the above code inside.
           * Update the `PATH` environment variable in your system settings to include the directory containing the `cargo-check.service` file (`~/.config/GeometryOS/system/geom/bin`).
        
        3. Test the service by running:
           ```bash
           sudo /home/user/.config/GeometryOS/system/geom/bin/cargo-daemon --config-path=/etc/cargo start
           ```
           This will start the service using `start` and `stop` methods.
        
        4. Test stopping and restarting the service by running:
           ```bash
           sudo /home/user/.config/GeometryOS/system/geom/bin/cargo-daemon --config-path=/etc/cargo stop
           sudo /home/user/.config/GeometryOS/system/geom/bin/cargo-daemon --config-path=/etc/cargo start
           ```
        
        5. Test restarting the service by running:
           ```bash
           sudo /home/user/.config/GeometryOS/system/geom/bin/cargo-daemon --config-path=/etc/cargo restart
           ```
            
        6. Check that the service is working correctly by checking the log file at `/var/log/cargo-check.log`.