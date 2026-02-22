# Sbi Support - Tasks

## 1. Create SBI Handler Module

- [ ] Create ``systems/visual_shell/web/sbi_handler.js``

## 2. Update RISC-V Shader for SBI Detection

- [ ] Modify ``systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl:477-532``

## 3. Integrate SBI Handler into Hypervisor

- [ ] Modify ``systems/visual_shell/web/wgpu_linux_hypervisor.js:1-30``

## 4. Update Index.html to Load SBI Module

- [ ] Modify ``systems/visual_shell/web/index.html:241-244``

## 5. Add Timer Interrupt Injection

- [ ] Modify ``systems/visual_shell/web/wgpu_linux_hypervisor.js``

## 6. Update Monitor Tile HUD for SBI

- [ ] Modify ``systems/visual_shell/web/vm_monitor_tile.js``

## 7. Add Integration Test

- [ ] Create ``systems/visual_shell/web/test_sbi_handler.js``

## 8. End-to-End Verification

- [ ] None (manual verification)
