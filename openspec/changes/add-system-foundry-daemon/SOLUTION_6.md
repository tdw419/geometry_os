# Solution for Task: Implement `TaskMonitor` to watch `openspec/tasks/system_foundry/*.task.json`.

Proposal: Implement a System Foundry Daemon (SFD) that monitors OpenSpec Tasks and performs the following tasks:

1. Monitors OpenSpec Tasks in `openspec/tasks/system_foundry` for new or updated definitions of Foundry Tasks.
2. Analyzes artifacts using local LLMs (e.g., QWen2.5-CodeR) to generate "Semantic MetaData".
3. Folds via Hilbert Curves to create V2 Spatial Bricks (.brick) with preserved data locality.
4. Continuously syncs the SFD to specific Linux paths using Watch Mode for real-time updates as system state changes.
5. Provides a brief snippet of Python or Rust code required for the user (e.g., creating a file, running a script).

Proposed Solution:
1. Monitor OpenSpec Tasks: SFD monitors `openspec/tasks/system_foundry` for new or updated Foundry Task definitions.
    - Use watches in Python to monitor changes to directories and files associated with Foundry Tasks (e.g., `/usr/bin/qwen2.5-coder`).
    - The SFD should be able to handle a wide range of Foundry Task definitions and automatically detect which ones are available for execution.

2. Analyze Artifacts: SFD uses local LLMs (e.g., `qwen2.5-coder`) to analyze binaries, headers or logs and generate "Semantic MetaData".
    - The SFD should be able to extract data from the input artifacts, such as system information, kernel modules, or device drivers.

3. Fold via Hilbert Curves: SFD generates V2 Spatial Bricks (.brick) with preserved data locality by using a Hilbert curve, which is a mathematical function that maps a point in space to its distance from other points. This allows for efficient storage and retrieval of metadata without losing precision.
    - The SFD should be able to generate V2 Spatial Bricks for different types of artifacts (e.g., binaries, headers, logs).

4. Continuously Sync: SFD continuously syncs the SFD to specific Linux paths using Watch Mode.
    - The SFD should be able to handle multiple Linux paths and provide an easy way for users to specify which path they want to sync.

5. Provide Code Snippet: SFD provides a brief snippet of Python or Rust code required for the user (e.g., creating a file, running a script).
    - The SFD should be able to handle common tasks such as creating files, copying files or directories, and running shell commands.

Overview:
The SFD is an open-source tool that automates the process of converting live Linux system artifacts (binaries, headers, logs) into `.brick` files for spatial visualization on the PixiJS Infinite Map. The SFD monitors OpenSpec Tasks and performs tasks such as analyzing artifacts via local LLMs, folding V2 Spatial Bricks, and continuously syncing to specific Linux paths. The proposed solution is easy to use and can handle a wide range of Foundry Task definitions and artifact types. The SFD provides a clear and concise Markdown format for users to provide instructions and code snippets.