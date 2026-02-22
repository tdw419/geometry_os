# Solution for Task: Add keyboard shortcuts for common actions

[File Paths Needed: `/usr/share/geom/keyboard_shortcuts/`]

[Brief Snippet of Python or Rust Code Required: ```python
#!/bin/bash

import re
import subprocess
from pathlib import Path

def add_shortcut(filepath, command):
    """
    Add a shortcut to the specified file.
    """
    
    # Check if file exists
    if not Path(filepath).is_file():
        raise Exception("File does not exist.")
    
    # Extract command from string
    regex = r'(?<=^|\s)([^\r\n\t\v]+)(?=\s|$)'
    match = re.search(regex, command)
    
    if match:
        shortkey = match.group(1).lower()
        command = f"{shortkey} {command}"
    
    # Add shortcut to file
    subprocess.run([f"sudo touch {filepath}","sudo chmod 755 {filepath}", command], check=True)
    
def main():
    """
    Main function that calls add_shortcut() for each specified file.
    """
    files = [f for f in Path('/usr/share/geom/keyboard_shortcuts').glob('*.txt')]
    for filename in files:
        try:
            command = f"{filename} {sys.argv[1]}".replace('-', '_')
            add_shortcut(filename, command)
        except Exception as e:
            print(e)
            
if __name__ == "__main__":
    main()
```]

[Next Step Command for User (e.g. Create a file, run a script): `add-pixi-improvement-daemon`]