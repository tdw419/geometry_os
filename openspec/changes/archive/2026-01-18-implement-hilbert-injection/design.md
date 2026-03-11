# Design: The Folded Memory

## Hilbert Folding
We map a linear chunk of memory $M$ of size $N$ (where $N = W \times W$) to a texture region $T$ of dimensions $W \times W$.

For each byte $b_i$ at index $i$:
$$ (x, y) = \text{Hilbert}_{2D}(i) $$
$$ T[x, y] = \text{Color}(b_i) $$

## Color Mapping
-   **R (Health)**: 0.0 (Inert matter).
-   **G (Resource)**: $b_i / 255.0$ (The raw value).
-   **B (Entropy)**: 1.0 (Marked as "Foreign/IO" type matter).
-   **A (Life)**: 1.0 (Visible).

## Performance
-   **CPU-Side Folding**: We iterate 1MB - 4MB of data per frame.
-   `fast_hilbert` is optimized (lookup tables/bit logic).
-   Looping 1M times in Rust is trivial (<1ms).
-   Upload via `write_texture` is efficient for contiguous chunks.
