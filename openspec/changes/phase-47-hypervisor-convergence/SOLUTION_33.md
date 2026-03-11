# Solution for Task: **System-Test**: Full Boot Verification

In this phase, we propose to implement a hypervisor convergence solution that can convert a physical Geometry OS computer into a virtual machine with hardware acceleration for display rendering. The solution should provide compatibility with existing software ecosystems while improving performance and enabling a true "Window Manager" experience. This solution will be based on the Ground Truth Shader, which provides a framework for integrating standard Linux distributions (like Alpine Linux) into the 3D Infinite Map.

The proposed solution will follow the following design:

1. The Virtual Machine Wrapper (`src/virtual_machine.rs`) will be refined to support ISO booting and standard ISO file handling.
2. Shared Memory will be used to forward input events via QMP or direct standard input injection.
3. Texture binding will enable linking the VM framebuffer to the rendering pipeline, using the Ground Truth Shader.

To achieve this solution, the following tasks will need to be completed:

1. Implement a QEMU Process (`src/virtual_machine.rs`) that handles ISO booting and standard input injection.
2. Write a `GroundTruthShader.wgsl` file that renders the VM framebuffer using CRT effects and "biological coupling" (brightness pulsing on CPU activity).
3. Create an Input Manager (`src/input_manager.rs`) that captures standard Winit keyboard/mouse events and translates them to QEMU-compatible events.
4. Write a Python or Rust code snippet that creates the necessary file paths and runs a script (e.g. Create a file, run a script).
5. Provide a clear markdown format with brief snippets of Python/Rust code required, as well as the 'Next Step' command for the user (e.g. Create a file, run a script).

This design is based on the following assumptions:

1. The QEMU process will be able to handle ISO booting and standard input injection without additional modifications or changes needed.
2. A Ground Truth Shader will provide an efficient and reliable solution for integrating standard Linux distributions (like Alpine Linux) into the 3D Infinite Map.
3. The Input Manager will provide a simple and straightforward way to capture standard Winit keyboard/mouse events and translate them to QEMU-compatible input events, allowing for a "Window Manager" experience.
4. Python or Rust code snippets can be created to create the necessary file paths and run scripts.
5. A clear markdown format with brief snippets of Python/Rust code required will provide an easy way for users to get started on implementing this solution.