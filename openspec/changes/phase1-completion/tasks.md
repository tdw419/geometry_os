# Phase1 Completion - Tasks

## 1. Add decode_rgba() Method to WASMCodeVisualizer

- [ ] Modify ``pixelrts_v2/tools/lib/pixelrts_v2_wasm.py``

## 2. Integrate decode_rgba() into PixelRTSDecoder

- [ ] Modify ``systems/pixel_compiler/pixelrts_v2_core.py``

## 3. Implement memory.size Opcode in WGSL Shader

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl``

## 4. Implement memory.grow Opcode in WGSL Shader

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl``

## 5. Add Bounds Checking to All Memory Load Functions

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl``

## 6. Add Bounds Checking to All Memory Store Functions

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl``

## 7. Add Memory Usage Tracking to Runtime

- [ ] Modify ``systems/pixel_compiler/wasm_runtime.py``

## 8. Add Memory Snapshot and Restore

- [ ] Modify ``systems/pixel_compiler/wasm_runtime.py``

## 9. Update PixelRTSDecoder with Automatic Mode Detection

- [ ] Modify ``systems/pixel_compiler/pixelrts_v2_core.py``

## 10. Integration Test - Full Code-Mode Round-Trip

- [ ] Create ``systems/pixel_compiler/tests/integration/test_phase1_complete.py``
