# Wgsl Shader I64 Compatibility Fix - Tasks

## 1. Add Helper Functions for 64-bit Multiplication

- [ ] Modify ``systems/riscv_gpu/shaders/riscv_linux_vm.wgsl``

## 2. Replace MULH Instruction (Signed High Multiplication)

- [ ] Modify ``systems/riscv_gpu/shaders/riscv_linux_vm.wgsl:1149``

## 3. Replace MULHSU Instruction (Mixed Signed-Unsigned High Multiplication)

- [ ] Modify ``systems/riscv_gpu/shaders/riscv_linux_vm.wgsl:1150``

## 4. Replace MULHU Instruction (Unsigned High Multiplication)

- [ ] Modify ``systems/riscv_gpu/shaders/riscv_linux_vm.wgsl:1151``

## 5. Copy Fixed Shader to infinite_map_rs

- [ ] Copy: `systems/riscv_gpu/shaders/riscv_linux_vm.wgsl` → `systems/infinite_map_rs/shaders/riscv_linux_vm.wgsl`

## 6. Build and Test Shader Compilation

- [ ] Build: `systems/infinite_map_rs/`

## 7. Add Unit Tests for Multiplication Helpers

- [ ] Create ``systems/infinite_map_rs/tests/wgsl_mulh_test.rs``

## 8. Documentation and Final Verification

- [ ] Create ``docs/plans/2026-02-08-wgsl-shader-i64-compatibility-fix-summary.md``
