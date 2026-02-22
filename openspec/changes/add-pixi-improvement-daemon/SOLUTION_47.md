# Solution for Task: Implement loading percentage display

[File Paths: `load_percentage.py` and `load_percentage.sh`]

1. Please provide the following file paths that need to be created or modified:
   - `load_percentage.py`: This is a Python file that will be used to implement the desired functionality. The script should take in an argument specifying the percentage as input, and output a message indicating the number of Pixi devices with a loaded percentage of 100%.
   ```python
   # Load percentage display implementation
   
   import os
   
   def load_percentage(pixi_device):
       """
       This function will be called when the device is ready to receive messages. It checks if the specified percentage is within the allowed range, and
       returns True or False depending on whether it meets the criteria. If the percentage is greater than 100%, it prints a message indicating that all devices have been loaded.
       
       :param pixi_device: The Pixi device object to be checked
       """
   
   if os.path.exists("load_percentage.py"):
       print(f"{pixi_device} is already running.")
    else:
       with open("load_percentage.sh", "w") as file:
           file.write("#!/bin/bash\n")
           file.write(f"export PIXI_DEVICE=12345\n")
           file.write(f"python load_percentage.py {pixi_device}\n")
   ```
   
2. A brief snippet of the Python or Rust code required:
   - `load_percentage.sh`: This is a shell script that will be used to execute the implementation of the desired functionality in Python. The script should take in an argument specifying the Pixi device and output a message indicating whether all devices have been loaded or not.
   ```bash
   #!/bin/bash
   
   export PIXI_DEVICE=12345
   
   python load_percentage.py $PIXI_DEVICE
   if [ "$?" -eq 0 ]; then
       echo "All devices have been loaded"
   else
       echo "Some devices are not loaded"
   fi
   
   ```

3. A 'Next Step' command for the user:
   - The user should be directed to create a file named `load_percentage.py` and run the script with the required arguments.
   - When prompted, the user can choose which Pixi device they want to load percentage display on by entering the corresponding value in the `PIXI_DEVICE` variable.