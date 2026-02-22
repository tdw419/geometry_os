# Design: The Glass Drill

## 1. Mathematical Foundation: Inverse Hilbert
The core of this design is the `xy2h` function.
Given a coordinate $(x, y)$ on a Hilbert curve of order $N$ (width $2^N$), we must find the index $h$.

### Coordinate Space
*   **Texture Space**: $0..Width, 0..Width$
*   **Simulated Space**: The `TectonicSimulator` renders chunks at specific offsets.
    *   Currently, we inject a chunk at `(offset_x, offset_y)`.
    *   Mouse Input is in "Window Space" or "World Space".
    *   We must transform: Mouse $\to$ World $\to$ Texture Local $\to$ Hilbert Index.

## 2. Data Flow
1.  **Input**: `InputManager` detects mouse move over `TectonicWindow`.
2.  **Transform**: `InfiniteMapApp` calculates relative $(u, v)$ within the texture.
3.  **Decode**:
    *   $h = \text{fast_hilbert::xy2h}(u, v)$
    *   $Address = \text{ChunkBaseAddress} + h$
4.  **Query**:
    *   Value = `QemuBridge::read_phys(Address)` (or cached in textures).
    *   Symbol = (Optional) Phase 7 feature, look up boolean/kernel symbol.
5.  **Render**:
    *   Draw a "Reticle" at (u, v).
    *   Update `DiagnosticOverlay` or `IntrospectionWindow` with `0xADDR: VALUE`.

## 3. Visual Feedback
*   **The Drill Bit**: A small, high-contrast reticle (white/magenta) that snaps to the grid of the byte being inspected.
*   **The Readout**: A floating label or fixed status bar showing the hex address.

## 4. Component Updates
*   `TectonicSimulator`: Needs a helper `resolve_address(x, y) -> Option<u64>`.
*   `InfiniteMapApp`: Handle mouse logic and call the resolver.
*   `QemuBridge`: (Already exists, but utilized here).
