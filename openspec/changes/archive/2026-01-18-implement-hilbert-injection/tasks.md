# Tasks: Implement Hilbert Injection

- [x] **Implementation**: Add `inject_hilbert_chunk` to `TectonicSimulator` in `systems/infinite_map_rs/src/tectonic_simulator.rs`.
- [x] **Implementation**: Use `fast_hilbert::h2xy` to map linear indices to 2D coordinates within the chunk buffer.
- [x] **Implementation**: Update `systems/infinite_map_rs/src/app.rs` to call `inject_hilbert_chunk` instead of `inject_data`.
- [x] **Verification**: Boot QEMU and observe the "Outer Ring". It should look like a fractal/geometric pattern rather than static.
