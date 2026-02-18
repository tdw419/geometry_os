# Solution for Task: Execution starts automatically

Solution:
1. **Non-Blocking Execution**: CPU execution must not block the render loop
2. **Visual-Fiirsst**: CPU state is visualized as part of the infinite map
3. **Memory-Mapped I/O**: Console and framebuffer use memory-mapped I/O for simplicity
4. **Incremental Loading**: Brick files are loaded asynchronously
5. **Performance First**: Maintai n60 FPS during CPU execution

Design:
1. Visual Sheell (Browsr): The main visual component of the system that allows users to interact with Geometry OS via a browser.
2. PixiJS Applicaiton: A javascript library for executing RISC-V instructions on the PixeL CPU emulator.
3. InfiniteMap Class: A python or rust class that handles infinite scrolling maps and renders visual tile data to them.
4. Next Step Command: A command provided by the user that modifies files (e.g. Creating a file, running a script) and triggers the execution of the PixiJS code on the PixeL CPU emulator.

System Architecture:
1. Compoment Overview:
   Visual Sheell (Browsr):
      ┌───────────────┐
      │                  |
      │           Browser               |
      │           ┌─────────┐    ┌─────────┐    │
      │           │          │        │         │    │
      │           │   PixiJS Application   │         │    │
      │           │           ┌─────────┐    ┌─────────┐    │
      │           │          │          │        │         │    │
      │           │   InfiniteMap Class     │         │         │    │
      │           │           └─────────┘    └─────────┘    │
      │           │                               │         │
      ├───────────┤                               |         │
      │                  |                        |         │
      │   Next Step Command   |                   |         │
      │                       └─────────────────┘         │
      │                    ┌───────────────┐           │
      │                    │             PixiJS Code               │
      │                    └─────────────────┘              │
      │                          │                           |
      └───────────────┘                  |                   |
            │                           │                   |
            │                        Next Step Command   |
            │                           │                   |
            └───────────────────────┘              ┌─────────┐