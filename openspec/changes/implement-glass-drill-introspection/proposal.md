# Proposal: The Glass Drill (Memory Introspection)

## 1. Summary
This proposal introduces **"The Glass Drill"**, a mechanism to perform Inverse Hilbert Mapping on the visual memory structures. It allows the user to perform "Hover-to-Query" actions on the Tectonic Memory Map, converting visual geometric locations back into linear physical addresses for inspection.

## 2. Background
We have successfully implemented the "Hilbert Injection" (Phase 5), transforming QEMU RAM into a 2D Fractal Curve. However, this map is currently "Read Only" in the visual sense; we see the patterns, but cannot identify them.

## 3. The Solution
We will implement an **Inverse Hilbert Mapper (`xy2h`)** in the Visual Shell.
When the user hovers over a pixel $(x, y)$ in the Memory Map:
1.  **Inverse Map**: Calculate Hilbert Index $h = \text{xy2h}(x, y)$.
2.  **Address Resolve**: $Addr = \text{BaseOffset} + h$.
3.  **Introspect**: Query the `QemuBridge` (or internal cache) for metadata about that address.
4.  **Display**: Show a "Neural Tooltip" with the address and value.

## 4. Impact
*   **Visual**: Adds interactive UI elements (cursors, tooltips).
*   **Functional**: Transforms the map from "Art" to "Debugger".
*   **Geometric**: Validates the bi-directional nature of the Hilbert transform.

## 5. Risks
*   **Performance**: Inverse mapping must be fast (per frame).
*   **Accuracy**: Must ensure the offsets match exactly with the `inject_hilbert_chunk` offsets.
