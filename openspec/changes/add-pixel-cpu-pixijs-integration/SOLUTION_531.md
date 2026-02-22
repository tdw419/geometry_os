# Solution for Task: Integration tests are written

# Design: PixeL CPU - PiXiJS Integration

## Principles

1. Non-Blocking Execution: CPU execution must not block the render loop.
2. Visual-First: The pipeline should be designed in a manner that visualization of CPU state occurs first, and then the console and framebuffer I/O occur.
3. Memory-Mapped I/O: Console and framebuffer use memory-mapped I/O for simplicity.
4. Incremental Loading: Brick files are loaded asynchronrhonously to ensure 60 FPS during CPU execution.
5. Performance First: Maintenance of 60 FPS during CPU execution is the first priority, and additional optimization may be made later.

## System Architecture

1. The visual shell (browser) is responsible for rendering the infinite map using PixiJS v8.
2. A Python or Rust program that interacts with the virtual machine of the visual shell (e.g. `pixelexec`) generates instructions for running a `.brick` file.
3. The CPU emulator and the PiXiJS Infinites Map are connected through a network connection.

## Component Overview

1. Visual Shell: The visual shell is a web-based platform that renders a 2D infinite map using PixiJS v8. It interacts with the virtual machine of the shell (e.g. `pixelexec`) to execute `.brick` files.
2. Python or Rust program: This program uses the `pixelexec` command to generate instructions for running a `.brick` file, which is then executed by the virtual machine of the shell.
3. PiXiJS Infinites Map: The PiXiJS Infinites Map is a web-based infinite map that displays visual tiles and handles real-time updates. It communicates with the PiXiJS Virtual Machine (VM) using a network connection.
4. Python or Rust program: This program interacts with the virtual machine of the visual shell to load `.brick` files, handle console I/O, and visualize CPU state on the infinite map.

## Design Scope and Limitations

1. **Non-Blocking Execution**: The system must ensure non-blocking execution of CPU instructions during the infinite loop. This means that the system should not block the render loop or any other critical operation for too long.
2. **Visual-First**: As mentioned earlier, visualization of CPU state occurs first and then console and framebuffer I/O occur. The system must prioritize performance over other considerations, such as user interaction.
3. **Memory-Mapped I/O**: This technique allows the PiXiJS Infinites Map to interact directly with the PiXiJS Virtual Machine (VM), without having to make any API calls to the underlying operating system. This saves resources and provides a more efficient way of handling real-time updates.
4. **Incremental Loading**: As mentioned earlier, console and framebuffer I/O occur asynchronrhonously with the CPU execution. Therefore, it is not possible to perform incremental loading in this system architecture.
5. **Performance First**: The priority for performance is given topmost priority over other considerations, such as user interaction. As a result, the rendering of the infinite map may take longer than desired due to high CPU utilization, leading to a perceived slowdown or visual glitches.

Overall, this system architecture provides a flexible and efficient solution for integrating PiXiJS with Geometry OS. However, it does have limitations in terms of non-blocking execution, memory-mapped I/O, and incremental loading.