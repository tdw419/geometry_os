# Solution for Task: Implement texture memory limits

[Context: Geometry OS Implementation Agent]

Your goal is to provide a concretely-implemented plan or code solution for the OpenSpec task of changing the texture memory limits in Geometry OS. The following context will guide your approach:

Change ID: add-pixi-improvement-daemon
Task: Implement texture memory limits

To achieve this goal, you will need to create or modify file paths and provide a brief snippet of Python or Rust code required for the task. Additionally, there are several steps that you will need to follow in order to implement this solution:

1. File Paths:
- Create a new directory named `texture_memory_limits` within the Geometry OS installation folder (`/opt/geometryos`) and move all of the texture memory files inside that directory to this new location. This will ensure that any future updates to the Geometry OS software will not affect your modified implementation.
- Create a file called `texture_memory_limits.json` within this new `texture_memory_limits` directory, which will contain information about the texture memory limits for each texture set in Geometry OS. This file should be named in accordance with the Geometry OS naming conventions (e.g., `textures/<set name>/texture_memory_limits.json`).
- Copy all existing `texture_memory_limits.json` files from the Geometry OS installation folder to this new location, ensuring that they have the same names and format as the ones in the original directory.

2. Python Code:
- Modify the `geom_os_setup()` function in the Geometry OS setup script (`/opt/geometryos/geom_os_setup`) to create or modify the new texture memory limits file. This function should take a single argument representing the current set of texture sets that are available for use by the Geometry OS software, and should then call the `add_texture_memory_limits()` function from the `geom_os_utils` module to create or update the appropriate texture memory limits JSON file.
- Modify the `geom_os_utilities()` function in the same script to read in any new texture memory limits JSON files and use them to populate the existing texture memory limits JSON file.
- If you are using Rust, you may need to modify your code to reflect the Rust syntax for creating a JSON file.

3. Next Steps:
- Run the updated Geometry OS setup script (`/opt/geometryos/geom_os_setup`) as normal, and ensure that any updates or changes to the texture memory limits file have been reflected in the Geometry OS software.
- If you are using Rust, you may need to create a new Rust project that includes your modified code, run `cargo build` from within the project directory to compile the Rust code, and then copy the resulting binary file to the appropriate location for installation by the user.

Conclusion:
By following these steps, you will be able to provide a concertely-implemented plan or code solution for changing the texture memory limits in Geometry OS. This approach should make it easier to keep future updates to the software up to date and ensure that any changes made to the texture memory limits JSON file do not affect the functionality of the software.