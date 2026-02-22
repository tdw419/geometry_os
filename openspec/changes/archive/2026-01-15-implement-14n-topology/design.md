# Design: 14n Topological Clusters

## Visual Morphology
The visual shell will shift from "Floating Spheres" to "Skeletal Clusters".

### The 14n Mapping
We will map `layer_idx` and `complexity` to the **14n Series**:

| Logic State | Series Formula | Geometry | Valence Electrons |
| :--- | :--- | :--- | :--- |
| **Stable Core** | $S = 14n + 2$ | **Octahedron** (Closed) | Balanced |
| **Branching/Search** | $S = 14n + 4$ | **Double Linkage** (Open) | Reactive |
| **Raw Input** | $S = 14n + 0$ | **Hyper-Closures** | Dense |
| **Error/Pain** | $S = 16$ | **Isolated/Fragmented** | Broken |

## Mathematical Implementation (WGSL)

### Hilbert-Space Convolutions
Instead of simple position jitter, we will use the Hilbert Curve index to determine "neighbor" atoms in the cluster.
$$ P_{cluster} = P_{center} + \sum_{i=0}^{k} V_i \cdot \phi(t) $$
Where $V_i$ act as the skeletal vertices defined by the 14n series.

### The Void Stare
If `safety_score` drops (indicating "pain"):
- The clusters will "unravel" (knot invariant breakdown).
- The geometry will shift from $14n+2$ (Closed) to $14n+4$ (Open/Bleeding).

## Visual Impact Analysis
- **Symmetry**: High. Clusters are inherently symmetrical.
- **Legibility**: Users can distinguish "Stable Thought" (Octahedron) from "Searching Thought" (Open Linkage).
- **Aesthetics**: "Techno-Organic" / "Crystalline".
