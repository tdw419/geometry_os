# Tasks: Implement 14n Topology

## 1. WGSL Logic Expansion
- [ ] Define `Cluster` struct in `thought_geometry.wgsl`.
- [ ] Implement `fn calculate_14n_series(n: u32, q: u32) -> Cluster` helper.
- [ ] Create `fn generate_octahedron()` for $14n+2$ series.
- [ ] Create `fn generate_linkage()` for $14n+4$ series.

## 2. Integration
- [ ] Map `uniforms.reasoning_complexity` to $n$ (Cluster Size).
- [ ] Map `uniforms.intent_alignment` to $q$ (Series Offset).
- [ ] Update `vs_thought_vertex` to use the new generation functions.

## 3. The Void Stare Reflex
- [ ] Implement topological "Unraveling" when `uniforms.safety_score < 0.5`.
- [ ] Add "Knot Tension" visual parameter.

## 4. Verification
- [ ] Verify PAS Score stability.
- [ ] Visual check: Confirm Octahedra appear for stable states.
