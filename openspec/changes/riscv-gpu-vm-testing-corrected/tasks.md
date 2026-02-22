# Riscv Gpu Vm Testing Corrected - Tasks

## 1. Create .rts.png Loader Module

- [ ] Create ``systems/infinite_map_rs/src/riscv_native/program.rs``

## 2. Create GPU Memory Layout for VM Shader

- [ ] Create ``systems/infinite_map_rs/src/riscv_native/memory.rs``

## 3. Copy VM Shader and Create Pipeline

- [ ] Copy: `systems/riscv_gpu/shaders/riscv_linux_vm.wgsl` → `systems/infinite_map_rs/shaders/riscv_linux_vm.wgsl`

## 4. Create Native VM Executor

- [ ] Create ``systems/infinite_map_rs/src/riscv_native/executor.rs``

## 5. Create Test Runner Binary

- [ ] Create ``systems/infinite_map_rs/src/bin/run_riscv_native.rs``

## 6. Create Integration Tests

- [ ] Create ``systems/infinite_map_rs/tests/riscv_native_integration_test.rs``
