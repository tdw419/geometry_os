# Tasks: Operation Tectonic

## Phase 1: Proof of Concept (The Simulator)
- [x] Create `systems/tectonic_poc/tectonic_simulator.py` (Python + Numpy + Matplotlib/CV2).
- [x] Implement `KernelShader`: A python function simulating the WGSL logic.
- [x] Implement `TextureManager`: Manages the RGBA state grid.
- [x] Simulate 10,000 "processes" fighting for resources on the map.
- [x] Visualize the "Heatmap" of system activity.

## Phase 2: The Bridge (Python -> Texture)
- [x] Modify `UnifiedCognitiveDaemon` to write its "confidence" directly to a specific pixel region.
- [x] Create `SharedMemoryTexture` in `systems/infinite_map_rs`.
- [x] Map the `antigravity.pixelrts.png` to a live WGPU textue.

## Phase 3: The GPU Switch (WGSL Kernel)
- [x] Port `KernelShader` from Python to WGSL.
- [x] Implement "Compute Pass" in `InfiniteMapApp`.
- [x] The GPU now updates the process state 60 times a second.

## Phase 4: Integration
- [x] Map QEMU Memory (from Phase 14) to the "Outer Ring" of the texture.
- [x] Allow the user to "Click" a pixel to kill a process (write 0.0 to Alpha channel).
