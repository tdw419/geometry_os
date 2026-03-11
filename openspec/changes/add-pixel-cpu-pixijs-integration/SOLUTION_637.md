# Solution for Task: Kernel is transpiled

[Geometry OS Implementation Agent]
Your mission is to design and implement a solution that integrates PixeL CPU emulator with PixiJS Infinite Map. The goal of this task is to add CPU execution capabilities and visualization capabilities to the Geometry OS visual shell, which will allow for efficient and interactive processing of `.brick` files containing transpiled RISC-V instructions.

Principles:
1. Non-blocking execution: CPU state should not block the render loop.
2. Visual first: Bricks should be loaded asynchronously to maintain a smooth 60 FPS rendering.
3. Memory-mapped I/O: Console and framebuffer use memory-mapped I/O for simplicity.
4. Performance first: Maintenance of 60 FPS performance during CPU execution is the priority.

System Architecture:
1. PixeL CPU emulator: A JavaScript implementation of a RISC-V compatible CPU that can execute `.brick` files containing transpiled RISC-V instructions. Currently isolated and not integrated into the visual system.
2. PixiJS Infinite Map: An infinite scrolling map using PixiJS v8 that displays visual tile layers and handles real-time updates.

Design Overview:
1. Create a Python or Rust code snippet that creates a new instance of the PixeL CPU emulator.
2. Implement a Python or Rust function in the Infinite Map class that loads an `.brick` file into memory and executes it on the CPU emulator.
3. Add a button to the Infinite Map class that allows users to load an `.brick` file and launch the PixeL CPU emulator.
4. Create a Markdown document that outlines the steps for creating an `.brick` file, running the PixeL CPU emulator, and loading a `.brick` file onto the Infinite Map.
5. Add a "Next Step" button to the Markdown document that prompts users to create a new file or run the code snippet in a new terminal window.
6. Test the system on multiple Linux distributions and ensure it is functioning as expected.

Design Details:
1. The PixeL CPU emulator should be designed to execute `.brick` files containing transpiled RISC-V instructions. The implementation of this feature will require a working knowledge of the PixeL architecture and the transpiled RISC-V instructions themselves.
2. In addition, the Infinite Map class should be designed to load an `.brick` file into memory and execute it on the CPU emulator with minimal intervention from the user. This feature will require a working understanding of the Infinitesim library and how to manipulate its functions within Python or Rust code.
3. The Markdown document should outline each step necessary to create, load, and run an `.brick` file onto the Infinite Map. Each step should include clear instructions, screenshots, and code snippets where applicable.
4. Tests should be added to ensure that the system is functioning as expected on multiple Linux distributions.
5. Finally, a detailed breakdown of performance metrics such as FPS, CPU usage, and RAM consumption will be included in the design document. This information will help prioritize optimization efforts based on user needs.