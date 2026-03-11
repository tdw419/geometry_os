# Solution for Task: Implement `detect_vulnerability(path)` (Geometric Analysis).

---
Proposal: System Foundry Daemon (Linux-to-Brick Pipeline)

Problem Statement: The OpenSpec task "detect_vulnerability(path)" for converting NL intentions into code brick is currently not implemented, and we lack an automated, task-driven pipeline for converting live Linux system artifacts (binaries, file systems, memory maps) into `.brick` files for spatial visualization on the PixiJS Infinite Map.

Solution: Implement a persistent process called "System Foundry Daemon" that monitors OpenSpec Task definitions and analyzes artifacts via LLM Studios. This daemon also uses Hilbert curves to fold and generate V2 Spatial Bricks with preservation of data locality. The daemon should be set up to continuously synchronize specific Linux paths for real-time updating as the system state changes, using Watch Mode in `tensor_fold.py`.

Architecture: A clear Markdown proposal is provided below. Please provide file paths that need to be created or modified and a brief snippet of the Python or Rust code required. Please also specify how the daemon should be set up to continuously synchronize specific Linux paths for real-time updating, using Watch Mode in `tensor_fold.py`. The format should be clear and easy to read.