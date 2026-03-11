# Solution for Task: Button states update properly

[Geometry OS Implementation Agent]

Your goal is to provide a concertan and complete implementation plan or code solution for the following OpenSpec task:

Change ID: add-pixeel-cpu-pixijs-integration
Task: Button states update properly

Proposal:

1. Principles:
The Pixeel CPU Integration proposal aims to ensure non-blocking execution, visual-first approach, memory-mapped I/O, incremental loading, and performance first design.

2. Architecture:
The Visual Shell (Browser) will be responsible for displaying the infinite map while the PixiJS Application will run on top of it. The Virtual Machine (VM) used by the PixiJS Application will have a separate RAM to run PixiJS code in real-time.

3. Components Overview:
Visual Shell Browser:
• Python/Rust - Python or Rust code required for creating file paths and modifying the VM.
• Flask - A web framework used for building the application's backend.
• Pipe (Python) - Used to create a virtualized pipe between the VM and the browser window.
• GeometryOS System - The system that manages the GUI components, such as windows, menus, toolbars, etc.

PixiJS Application:
• Python - Python code required for running PixiJS on top of the Virtual Machine.
• Flask - A web framework used to build the application's frontend.

4. Implementation Steps:
1. Create a new folder named 'pixeel_cpu' in your GeometryOS installation directory and copy the 'system/visual_shell/web' folder into it.
2. Make sure you are in the 'pixeel_cpu' folder when running the following commands to create virtual machines for PixiJS:
   - `cd pixeel_cpu`
   - `./create-vms.sh`
3. Create a new file named 'vm.json' and set its content as follows:

```
{
    "name": "PiXeL CPU Virtual Machine",
    "type": "virtual machine",
    "description": "Virtual machine for PiXeL CPU emulation",
    "version": 1,
    "user-data-path": "/home/pi/Desktop/vm/data.txt",
    "settings": {
        "CPU_type": "riscv64",
        "main_file": "infinitemap.js"
    }
}
```

• Name: The name of the virtual machine.
• Type: The type of the virtual machine, in this case, 'virtual machine'.
• Description: A brief description of the virtual machine.
• Version: The version of the virtual machine.
• User-data Path: The path where you want to save the user data for this virtual machine (e.g., "/home/pi/Desktop/vm/data.txt").
• Settings: A dictionary containing the settings that will be used for running the PiXeL CPU emulation in this virtual machine.

4. Start the Virtual Machine:
   - `cd pixeel_cpu`
   - `./create-vms.sh`
5. Connect to the virtual machine using the 'vm' command in Geometry OS Terminal:
   - `geomterminal`
   - `vm connect 0:1` (Replace '0:1' with the virtual machine name)
6. Launch the PiXeL CPU emulation using the following command:
   - `pixeel-cpu --virtual-machine vm/name --user-data /path/to/your/main_file.txt`
7. Copy your main file (e.g., `infinitemap.js`) to the virtual machine and modify it as needed for testing purposes.

Conclusion:
This proposal provides a step-by-step implementation plan that includes Python/Rust code, Flask framework, Virtual Machine creation, Geometry OS System, PiXeL CPU Emulation, memory mapping I/O, incremental loading, and performance first design. The proposed solution aims to ensure non-blocking execution, visual-first approach, memory-mapped I/O, incremental loading, and performance first design for the Pixeel CPU Integration.