# Implement Hilbert Injection (Phase 5)

## Why
Currently, the QEMU RAM is injected into the Tectonic Map as a linear linear strip. This fails to visualize the structural locality of the memory. By using a Hilbert Curve mapping, we can "fold" the 1D memory into 2D space, preserving locality (bytes near each other in address space remain near each other in the texture), revealing the "Shape of Data".

## What Changes
1.  **Tectonic Simulator**: Implement `inject_hilbert_chunk` which takes a linear byte slice, folds it into a 2D patch using `fast_hilbert`, and uploads it to the GPU.
2.  **Visualization**:
    -   Green Channel = Byte Value (The Data).
    -   Blue Channel = High (Indicates Foreign Memory/Entropy).
    -   Red Channel = Low (No intrinsic health, it is "dead" matter until processed).
3.  **App Integration**: Update `app.rs` to use this new injection method for the QEMU bridge.

## Impact
-   **Visual**: The "Outer Ring" will transform from noise/scanlines into intricate geometric patterns (Hilbert curves) representing the actual OS memory structure.
-   **Functional**: No change to logic, but significantly better visualization for the user/operator.
