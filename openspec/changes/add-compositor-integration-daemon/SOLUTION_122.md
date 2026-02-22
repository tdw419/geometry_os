# Solution for Task: Create daemon dashboard

**Context:**

This OpenSpec task requires you to provide a concise implementation plan or code solution for changing the Geometry OS dashboard using a daemon. The task involves creating and modifying file paths, as well as adding a Python/Rust code snippet to create a daemon dashboard. The user needs to be prompted with a "Next Step" command after providing these details.

**1. File Paths:**
- **Path 1:** A text file named "geometry_daemon.py" located in the Geometry OS root directory.
- **Path 2:** A symbolic link to this file called "/usr/local/bin/geometry_daemon" (note that this path may vary depending on your system).

**2. Python/Rust Code Snippet:**
Here's an example of the Python code snippet you can use to create a daemon dashboard:
```python
import os
from subprocess import call

# Define function for running Geometry OS daemon
def run_geometry_daemon():
    # Create symbolic link if one doesn't exist
    if not os.path.exists("/usr/local/bin/geometry_daemon"):
        os.symlink("geometry_daemon.py", "/usr/local/bin/geometry_daemon")
    
    call(["geometry_daemon.py"])

# Call function to run daemon when system starts up or stops
if __name__ == "__main__":
    run_geometry_daemon()
```
Replace "geometry_daemon.py" with the name of your Python/Rust code snippet, and add a comment explaining what it does.

**3. Next Step Command:**
The user needs to provide a command after providing these details in clear Markdown format that will run the Python/Rust code snippet to create the daemon dashboard.