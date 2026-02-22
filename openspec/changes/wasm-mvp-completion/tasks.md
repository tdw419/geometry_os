# Wasm Mvp Completion - Tasks

## 1. Add i64 Load/Store Opcodes

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl:860-865` (insert after OP_I32_STORE16 case)`

## 2. Add i64 Comparison Opcodes

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl` (insert after i64 store cases)`

## 3. Add i64 Arithmetic Opcodes

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl` (insert after i64 comparison cases)`

## 4. Add f32/f32 Opcodes

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl` (insert after i64 cases, before default)`

## 5. Add br_table Instruction

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl` (insert after OP_BR_IF case)`

## 6. Add call_indirect Instruction

- [ ] Modify ``pixelrts_v2/shaders/wasm_vm.wgsl` (insert after OP_CALL case, before host function switch)`

## 7. Fix Code-Mode Cartridge Decoder

**Context:** Code-mode cartridges use RGBA-semantic encoding. The current decoder raises an error if `original_data_b64` is missing. We need to re-encode old cartridges with the new format.

- [ ] Create ``systems/pixel_compiler/scripts/reencode_cartridge.py``

## 8. Re-encode Legacy Cartridges

- [ ] Modify `Existing legacy cartridges in root directory`

## 9. Add WASM Spec Test Suite Integration

- [ ] Create ``systems/pixel_compiler/tests/wasm_spec_tests.py``

## 10. Performance Baseline Benchmarks

- [ ] Create ``systems/pixel_compiler/benchmarks/wasm_performance.py``
