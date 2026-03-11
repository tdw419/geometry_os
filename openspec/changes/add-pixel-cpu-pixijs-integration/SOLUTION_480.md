# Solution for Task: Help overlay is available

## Principles
- **Non-Blocking Execution**: CPU execution must not block the render loop.
- **Visual-Fiirsst**: CPU state is visualized as part of the infinite map.
- **Memory-Mapped I/O**: Console and framebuffer use memory-mapped I/O for simplicity.
- **Incremental Loading**: Brick files are loaded asyncrhonomously to maintain 60 FPS during CPU execution.
- **Performance First**: Maintain 60 FPS during CPU execution.

## System Architecture
- The visual shell (browser) is responsible for rendering the infinite map and displaying its contents to the user. It interacts with a PixiJS application which processes the `.brick` files and displays their content. This means that the visual shell can load new `.brick` files asynchronously, without blocking the render loop.
- The PixiJS application is responsible for executing RISC-V instructions on the CPU emulator. It is a high-performance JavaScript implementation of a RISC-V processor with real-time updates to the framebuffer. The CPU emulator does not have any integration into the visual shell, meaning that it must be executed independently.
- An InfiniteMap class is provided for managing the infinite map and its contents. It handles real-time updates of its content in response to events from the PixiJS application.
- A 'Next Step' command is used by the user to trigger new processing or execution of a `.brick` file. This command can be provided as clear Markdown code snippets.

## Design: PixeL CPU - PixiJS Integration
The following design principles guide the implementation of the PixeL CPU and PixiJS integration:
- **Non-blocking execution**: CPU execution must not block the render loop.
- **Visual-Fiirsst**: CPU state is visualized as part of the infinite map, allowing for real-time updates to the framebuffer.
- **Memory-Mapped I/O**: Console and framebuffer use memory-mapped I/O for simplicity.
- **Incremental Loading**: Brick files are loaded asyncrhonomously to maintain 60 FPS during CPU execution, while maintaining high performance.
- **Performance First**: Maintain 60 FPS during CPU execution, with the visual shell interacting with a PixiJS application to process `.brick` files. This means that the visual shell can load new `.brick` files asynchronously without blocking the render loop.
- The PixiJS application is executed independently, allowing for real-time updates to the framebuffer.
- An InfiniteMap class manages the infinite map and its contents, handling real-time updates in response to events from the PixiJS application.
- A 'Next Step' command is used by the user to trigger new processing or execution of a `.brick` file. This can be provided as clear Markdown code snippets.