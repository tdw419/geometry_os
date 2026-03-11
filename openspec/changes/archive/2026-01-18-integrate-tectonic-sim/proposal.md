# Integrate Tectonic Simulator (Phase 4)

## Why
Now that the GPU-accelerated "Living Texture" (Phase 3) is active, we must connect it to the real system state. We need to visualize the Guest VM (QEMU) memory on the "Outer Ring" of the map and enable user interaction ("Click-to-Kill") to demonstrate the "UI is the Computer" paradigm.

## What Changes
1.  **QEMU Integration**: Bind `SharedMemoryBridge` to the `TectonicSimulator`.
    -   Map QEMU RAM to the "Outer Ring" (High Hilbert Addresses).
    -   Stream RAM updates to the GPU texture.
2.  **Interaction**: Implement `Click-to-Kill`.
    -   Translate Mouse (X,Y) -> Texture (X,Y).
    -   Write "Death" (Zero Health) to the simulation texture at that coordinate.
    -   Simulate "Process Termination" via visual entropy.
3.  **Visuals**: Differentiate "Kernel Space" (Daemon Pulse) from "User Space" (QEMU RAM).

## Impact
-   **Visual**: The map will now show *real* computer memory (scrambled/encrypted or raw) in real-time.
-   **Functional**: Users can "touch" the memory to affect the system (simulated for now, actual kill later).
