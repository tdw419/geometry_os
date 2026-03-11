# Proposal: Implement Tectonic GPU Kernel

## Why
The "Operation Tectonic" architecture requires the OS state (processes, resources) to be simulated on the GPU to achieve the "Infinite Map" vision. The current Python POC (`tectonic_simulator.py`) proves the logic but is limited to CPU speeds and small grids. To scale to 4k resolution and millions of "processes", we must move the simulation to a WGSL Compute Shader.

## What Changes
We will implement "Phase 3: The GPU Switch" by:
1. Creating a WGSL Compute Shader (`tectonic_kernel.wgsl`) that replicates the logic of `TectonicKernel`.
2. Integrating a Compute Pass into the `InfiniteMapApp` render loop.
3. Managing the "Ping-Pong" texture buffers needed for cellular automata simulation.

## Impacts
- **Performance**: Move from ~10FPS (Python) to 60FPS+ (GPU).
- **Visuals**: The "Ground" texture will become alive, evolving autonomously.
- **Architecture**: `InfiniteMapApp` becomes a hybrid Compute/Render engine.

## Risks
- **Complexity**: Managing WGPU Compute Pipelines and Bind Groups is complex in Rust.
- **Synchronization**: Ensuring the "Writer" (Daemon) and "Simulator" (GPU) don't conflict. We already have the Watcher, but the GPU simulation needs to merge the Daemon's input (External Writes) with its own internal simulation (Evolution).
