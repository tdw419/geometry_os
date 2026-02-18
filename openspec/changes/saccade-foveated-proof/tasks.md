# Saccade-Driven Foveated Rendering - Tasks

## 1. Foveated Infrastructure
- [ ] 1.1 Create `systems/visual_shell/web/foveated_renderer.js`
- [ ] 1.2 Update `systems/infinite_map_rs/shaders/infinite_map.wgsl` to support focus-based resolution scaling
- [ ] 1.3 Implement Focus Point uniform in the shader pipeline

## 2. Load Reduction Logic
- [ ] 2.1 Implement `PeripheralSubsampler`: Reduces sample rate for non-focus tiles
- [ ] 2.2 Implement `SaccadeController`: Smoothly interpolates focus point between targets
- [ ] 2.3 Add dynamic resolution scaling (quarter-res for far peripherals)

## 3. Telemetry & Measurement
- [ ] 3.1 Implement `GPULoadMonitor`: Measures execution time of the foveated vs. full-res passes
- [ ] 3.2 Add side-by-side comparison mode for verification

## 4. Verification & Documentation
- [ ] 4.1 Prove 50% load reduction in a scene with 50+ active tiles
- [ ] 4.2 Document Saccade Foveated Proof in `docs/proofs/SACCADE_FOVEATED_PROOF.md`
