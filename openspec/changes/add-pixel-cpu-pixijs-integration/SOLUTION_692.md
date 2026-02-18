# Solution for Task: Limitations are documented

# Principles

1. **Non-Blocking Execution**: CPU execution must not block the render loop. This ensures that the infinite map is updated with real-time data as soon as possible, avoiding any delays due to waiting for a thread or process to finish.
2. **Visual-Fiirsst**: CPU state is visualized as part of the infinite map, allowing users to see what's happening in real time. This helps to clarify complex instructions and reduces confusion, ensuring that the user has an understanding of how the system works.
3. **Memory-Mapped I/O**: Console and framebuffer use memory-mapped I/O for simplicity. This allows for easy handling of input from a keyboard or mouse as well as sending output to the console.
4. **Incremental Loading**: Brick files are loaded asynchronously, allowing for smooth performance even with large numbers of CPU instructions. The loading process is incremental, so it doesn't slow down the render loop.
5. **Performance First**: Maintenance of 60 FPS during CPU execution is paramount, ensuring that the user has a smooth and seamless experience. This also means that memory-intensive tasks may be handled in parallel to improve performance.

## System Architecture

1. The visual shell (browser) acts as the main user interface for the system. It displays the infinite map and provides commands for manipulating data within it.
2. The PixiJS application is integrated into the visual shell, providing an API for running `.brick` files. It handles memory-mapped I/O for the console and framebuffer, ensuring smooth operation during high-CPU usage.
3. The InfiniteMap class provides a simple interface for interacting with PixiJS's infinite map. It loads and displays bricks within a user-specified area.
4. A "Next Step" command is provided to the user, allowing them to create or modify files in a specific directory. This can be used to build complex systems or to perform ongoing testing.
5. The system is designed to be incrementally loaded, allowing for smooth performance even with large numbers of CPU instructions. This means that bricks loaded asynchronously may not be immediately visible, but will appear as soon as they are ready to use.

## Design Overview

The following sections provide a high-level overview of the system components and design principles.

1. The visual shell (browser) provides a user interface for interacting with the system. It displays the infinite map, manages commands for manipulating data within it, and provides a way for users to create or modify files.
2. The PixiJS application is integrated into the visual shell using an API provided by the browser. This allows the application to handle memory-mapped I/O and run `.brick` files within the system.
3. The InfiniteMap class provides a simple interface for interacting with PixiJS's infinite map, allowing users to load and display bricks in a user-specified area.
4. A "Next Step" command is provided to users as an input for creating or modifying files within a specific directory. This allows the system to be incrementally loaded, ensuring that data can be updated quickly and smoothly.
5. The system is designed to be incrementally loaded, allowing for smooth performance even with large numbers of CPU instructions. Brick files are loaded asynchronously, allowing them to appear as soon as they are ready to use while minimizing delay caused by waiting for a thread or process to finish.

In summary, the system provides a clean and intuitive user interface for interacting with the PixiJS application, along with the ability to create and manipulate bricks within a user-specified area using InfiniteMap. The system is designed to be incrementally loaded, ensuring smooth performance even with large numbers of CPU instructions.