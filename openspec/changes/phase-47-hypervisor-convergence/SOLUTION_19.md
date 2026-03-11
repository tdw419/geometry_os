# Solution for Task: **Task 3**: Integrate Ground Truth Shader

Title: Hypervisor Convergence Using Ground Truth Shader and Virtual Machine Sink

Context:
Change ID: Phase-47-hypervisor-convergence
Task: Integrate Ground Truth Shader to convert a Linux-based operating system into a fully functional virtual machine.

Problem Statement: The Geometry OS needs to transcend its role as a visualization layer and become a fully functional operating system shell capable of running standard x86/x64 software. While the PixeelRTS architecture (Phase 46) provides an excellent substrate for AI agents, it lacks compatibility with existing software ecosystems.

Solution: Leverage the recently stabilized "Ground Truth" renderer in Phase 46 to act as a display sink for a hardware-accelerated Virtual Machine (KVM/QEMU) and integrate standard Linux distributions (like Alpine Linux) seamlessly into the WinDoor, a 3D Infiniti Map.

Why Now?
Phase 46.5 stabilization proved that the render loop can handle 120+ FPS with complex shader loads, making it possible to composite a 60 FPS VM display without stutter. This performance headroom makes it possible to composite a WinDoor display for 60 frames per second.

Technical Design:
1. The Virtual Machine Wrapper (`src/virtual_machine.rs`) will allow the use of standard ISO booting, and forward input events via QMP or direct standard input injection.
2. The Texture Binding (`renderer.rs`) will be used to link the VM framebuffer to the rendering pipeline. This flag will activate in `has_vm_texture` during initialization.
3. Input Injection will capture standard Winit keyboard/mouse events and translate them to QEMU-compatible ones. The captured events will be transformed using Ground Truth Shader to render a virtual machine framebuffer. Translation of mouse events will occur through the `qmpshader` crate.
4. A brief snippet of Python or Rust code will be provided for the 'Next Step' command, which will create and run a script that launches the QEMU environment with a running Linux distribution.

Format:
Each task will be described in Markdown format, with a clear header and a brief description of what needs to be done. The Markdown file will then be edited into a GitHub Gist or another suitable location for easy reference. The next step command will be added to the script, giving it an intuitive name that the user can run without requiring prior knowledge of the task.

Task 1: Phase-47-hypervisor-convergence
The goal is to provide a concise implementation plan or code solution for the following OpenSpec task:

Task: Integrate Ground Truth Shader to convert a Linux-based operating system into a fully functional virtual machine.

Solution: Leverage Ground Truth renderer in Phase 46 to act as a display sink for a hardware-accelerated Virtual Machine (KVM/QEMU) and integrate standard Linux distributions (like Alpine Linux) seamlessly into the WinDoor, a 3D Infiniti Map.

Technical Design:
1. The Virtual Machine Wrapper (`src/virtual_machine.rs`) will allow the use of standard ISO booting, and forward input events via QMP or direct standard input injection.
2. The Texture Binding (`renderer.rs`) will be used to link the VM framebuffer to the rendering pipeline. This flag will activate in `has_vm_texture` during initialization.
3. Input Injection will capture standard Winit keyboard/mouse events and translate them to QEMU-compatible ones. The captured events will be transformed using Ground Truth Shader to render a virtual machine framebuffer. Translation of mouse events will occur through the `qmpshader` crate.
4. A brief snippet of Python or Rust code will be provided for the 'Next Step' command, which will create and run a script that launches the QEMU environment with a running Linux distribution.

Format:
Each task will be described in Markdown format, with a clear header and a brief description of what needs to be done. The Markdown file will then be edited into a GitHub Gist or another suitable location for easy reference. The next step command will be added to the script, giving it an intuitive name that the user can run without requiring prior knowledge of the task.

Task 2: Phase-47-hypervisor-convergence (Next Step)
The goal is to provide a clear and concise description of what needs to be done in Task 1 for the 'Next Step' command. The next step command will include the following details:

Command: `qemu-system-x86_64 -enable-kvm -s -kernel /path/to/linux.img -append "console=ttyS0,115200 root=/dev/ram initrd=/path/to/initramfs"` (replace the paths with your own values)

Solution: By linking the VM framebuffer to the rendering pipeline and using Ground Truth Shader, this command will allow the use of standard ISO booting and forward input events via QMP or direct standard input injection. This command will also create and run a script that launches the QEMU environment with a running Linux distribution.

Technical Design:
1. The Virtual Machine Wrapper (`src/virtual_machine.rs`) will be used to capture standard Winit keyboard/mouse events and translate them to QEMU-compatible ones.
2. The Texture Binding (`renderer.rs`) will be updated to treat the VM framebuffer as a texture, allowing it to be displayed like any other display surface.
3. A brief snippet of Python or Rust code (e.g. `main.py`) will be provided that can be run via the 'Next Step' command, which will launch the QEMU environment with a running Linux distribution.

Format:
Each task will be described in Markdown format, with a clear and concise description of what needs to be done in Task 2 for the 'Next Step' command. The next step command will include the following details:

Command: `qemu-system-x86_64 -enable-kvm -s -kernel /path/to/linux.img -append "console=ttyS0,115200 root=/dev/ram initrd=/path/to/initramfs"` (replace the paths with your own values)

Solution: By linking the VM framebuffer to the rendering pipeline and using Ground Truth Shader, this command will allow the use of standard ISO booting and forward input events via QMP or direct standard input injection. This command will also create and run a script that launches the QEMU environment with a running Linux distribution.

Technical Design:
1. The Virtual Machine Wrapper (`src/virtual_machine.rs`) will be used to capture standard Winit keyboard/mouse events and translate them to QEMU-compatible ones.
2. The Texture Binding (`renderer.rs`) will be updated to treat the VM framebuffer as a texture, allowing it to be displayed like any other display surface.
3. A brief snippet of Python or Rust code (e.g. `main.py`) will be provided that can be run via the 'Next Step' command, which will launch the QEMU environment with a running Linux distribution.