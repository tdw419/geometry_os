# Solution for Task: **Core Daemon**

Title: System Foundry Daemon (Linux-to-Brick Pipeline)

Problem Statement: The Geometry OS platform currently lacks an automated, task-drive pipeline to convert live Linux system artifacts into `.brick` files for spatial visualization on the PixiJS Infinite Map.

Solution: Implement a persistent process that monitors OpenSpec Task definitions and analyzes artifacts using local LLMs (e.g., `qwen2.5-coder`) to generate "Semantic Metadata". Fold via Hilbert Curves to create V2 Spatial Bricks with preserved data locality.

Architecture: The system would be implemented as a Python or Rust program that creates the `.brick` file when needed. A brief snippet of code is provided for the user to create and/or modify file paths. It should be clear and formatted in Markdown for easy readability.

Steps:
1. Monitor OpenSpec Tasks for `FoundryTask` definitions.
2. Analyze artifacts using local LLMs (e.g., `qwen2.5-coder`) to generate "Semantic Metadata".
3. Fold via Hilbert Curves to create V2 Spatial Bricks with preserved data locality.
4. Continuous synchronization can be set to "Watch Mode" for specific Linux paths, updating the brick in real-time as the system state changes.

Next Steps: Provide a brief snippet of the Python or Rust code required and instructions on how to create/modify file paths.