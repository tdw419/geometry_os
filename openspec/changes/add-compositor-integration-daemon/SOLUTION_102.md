# Solution for Task: Create daemon README

[Task]

As an expert systems engineer working on Geometry OS, you are tasked with providing a concise implementation plan or code solution for the OpenSpec task of creating a daemon README file that integrates the Geometry OS Compositor application. This will be used to automate the installation and configuration of Geometry OS for users who require specialized features, such as 3D printing, with precision measurement capabilities.

1. File paths: The daemon README should create a new directory called "geometry" under the user's home folder. This will contain all necessary files for the Compositor application to function properly. These include:
    - geo_settings.json (optional): Contains configurations specific to the user, such as 3D printer settings or measurement options.
    - geometry_settings.py (required): A Python script that monitors the Compositor process and updates the geometry.settings file automatically.

2. Code snippet: The code snippet required for this task is as follows:

```python
import subprocess
import os
import sys

# Create directory with user's home folder
def create_geometry(user_home):
    if not os.path.exists(user_home + "/geometry"):
        os.makedirs(user_home + "/geometry")

# Set up subprocess for Compositor process
subprocess.run(['compositor', '--settings', '~/geometry/geo_settings.json'], check=True)

# Monitor Compositor process and update geometry settings
def monitor():
    while True:
        if os.path.exists('./geometry/geometry_settings.json'):
            with open('./geometry/geometry_settings.json', 'r') as f:
                json_data = json.load(f)
                print("Geometry settings updated!")
                break
        else:
            time.sleep(10)

# Start monitoring and update geometry settings every 10 seconds
monitor()
```

3. Next steps: The task includes creating a new file, updating the "geometry" directory within the user's home folder using the created script, and running the script whenever the Compositor process starts or is stopped. It also suggests adding a command to create or update the geometry_settings.py file automatically by using the Python subprocess module.

Explanation:

The daemon README will be used to create a new directory called "geometry" under the user's home folder, which contains all necessary files for the Compositor application to function properly. The "create_geometry()" function is responsible for creating the directory and setting up the subprocess for starting the Compositor process.

The monitor() function continuously checks for changes in the geometry_settings.json file and prints an updated message if it detects a change. This will be used to ensure that the Compositor application always runs with the latest settings, even if the user manually modifies them.

The next steps section suggests updating the "geometry" directory using the created script, which is run whenever the Compositor process starts or stops. This is done by specifying the path and filename of the new geometry_settings.py file in the subprocess module.

Conclusion: By following this implementation plan, you can create a daemon README file that integrates the Geometry OS Compositor application with precise measurement capabilities.