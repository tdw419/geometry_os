# Plan: Self-Spawning Organism

## Objective
Enhance the 18-pixel "self-replicating" loop so that after it finishes copying itself to a new Hilbert address, it executes `OP_SPATIAL_SPAWN` (opcode 225) to spawn a *new* VM at the new address. 

## Mechanism
1. The original program (VM 0) lives at address `0`.
2. It copies itself to address `100`.
3. It executes `OP_SPATIAL_SPAWN` to start VM 1 at address `100`.
4. It halts.
5. VM 1 (now living at address `100`) wakes up, calculates its next target (e.g., `200`), copies itself there, and spawns VM 2.

## Implementation Steps
1. Create `systems/infinite_map_rs/tests/self_spawning_test.rs`.
2. Copy the 18-pixel logic.
3. Modify the program to calculate the *next* spawn target dynamically (so VM 1 knows to copy to `200` instead of `100`).
4. Execute multiple frames (`execute_frame()` in a loop) and verify that multiple VMs are running and multiple copies exist in the texture.
