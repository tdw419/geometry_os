# Solution for Task: Create `system_snapshot.py` utility for bulk dir-to-brick conversion.

# Problem Statement
While we have the `Foundry Daemon` for converting NL intentions into code brick files, we lack an automated task-driven pipeline for converting live Linux system artifacts (binaries, file systems, memory maps) into `.brick` files for spatial visualization on the PixiJS Infinite Map.

# Solution Proposed
To solve this problem, we propose implementing a persistent process called "System Foundry Daemon" that monitors OpenSpec tasks and analyses artifacts using LLMs (Local Logic Machines) and Folds via Hilbert Curves to create Spatial Bricks (.brick) with preserved data locality.

The System Foundry Daemon can be implemented as a Python or Rust program, which continuously watches specific paths for Linux system artifacts, analyzes their properties using LLMs, and creates V2 Spatial Bricks with preserved data locality.

Here's an example of how such a process would work:

1. The System Foundry Daemon monitors OpenSpec Tasks defined in `openspec/tasks/system_foundry`.
2. As new tasks are created, the Daemon checks if their definition includes specific Linux artifacts or paths that need to be analyzed (e.g., binaries, files, etc.).
3. If a task is found, the Daemon creates a V1 Spatial Brick with localized data using Hilbert Curves based on LLM analysis results.
4. If no tasks are found, the Daemon updates or creates a V2 Spatial Brick with preserved data locality by continuously analyzing the Linux system and generating new V2 Bricks in real-time as changes occur.
5. The Daemon can be set to "Watch Mode" for specific paths and create V2 Spatial Bricks automatically in response to file or process events on these paths.
6. The Daemon can also provide users with clear Markdown instructions on how to create a new `file` or run a script for creating a V1 Spatial Brick or V2 Spatial Brick, respectively.

In summary, the System Foundry Daemon can be implemented using Python or Rust as a persistent process that continuously monitors OpenSpec tasks and analyses artifacts to create V2 Spatial Bricks with preserved data locality.