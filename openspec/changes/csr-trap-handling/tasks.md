# Csr Trap Handling - Tasks

## 1. Add New CSR Constants

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:18-27``

## 2. Add _get_csr_index Mapping for New CSRs

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:58-66``

## 3. Implement trap_enter Helper Function

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 4. Implement SRET Instruction

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 5. Replace Halt-on-Fault with Trap in LOAD

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 6. Replace Halt-on-Fault with Trap in STORE

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 7. Replace Halt-on-Fault with Trap in ATOMIC

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 8. Add Illegal Instruction Trap

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 9. Add ECALL Trap with Privilege Check

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl``

## 10. Update readState in gpu_execution_system.js

- [ ] Modify ``systems/visual_shell/web/gpu_execution_system.js``

## 11. Create Trap Handling Test Page

- [ ] Create ``systems/visual_shell/web/test_trap_handling.html``
