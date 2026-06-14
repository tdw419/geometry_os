// Phase 87: Multi-Hypervisor tests
// Tests for VM_SPAWN, VM_KILL, VM_STATUS, VM_PAUSE, VM_RESUME, VM_SET_BUDGET, VM_LIST

#[cfg(test)]
mod phase87_multi_hypervisor {
    use crate::assembler::assemble;
    use crate::vm::types::geos_errno;
    use crate::vm::types::GEOS_EINVAL;
    use crate::vm::{HypervisorMode, Vm};

    /// Helper: assemble source, load into VM, run until halt.
    fn compile_run(source: &str) -> Vm {
        let asm = assemble(source, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &pixel) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = pixel;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..100_000 {
            if !vm.step() {
                break;
            }
        }
        vm
    }

    #[test]
    fn test_vm_spawn_basic() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 kernel=Image ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 1, "should have 1 background VM");
        assert_eq!(vm.regs[0], 1, "r0 should be VM ID 1");
        assert!(vm.background_vms[0].config.contains("arch=riscv64"));
        assert_eq!(vm.background_vms[0].window_id, 0);
    }

    #[test]
    fn test_vm_spawn_multiple() {
        let vm = compile_run(
            r#"
            ; First VM
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 kernel=Image ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            ; Second VM
            LDI r10, 0x2200
            STRO r10, "arch=x86_64 kernel=bzImage ram=512M mode=qemu"
            VM_SPAWN r10, r11
            MOV r13, r0
            ; Third VM
            LDI r10, 0x2400
            STRO r10, "arch=riscv32 kernel=vmlinux ram=128M mode=native"
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 3, "should have 3 background VMs");
        assert_eq!(vm.regs[0], 3, "r0 should be VM ID 3 (last spawned)");
        // First VM: riscv64
        assert_eq!(vm.background_vms[0].id, 1);
        assert!(vm.background_vms[0].config.contains("riscv64"));
        // Second VM: x86_64
        assert_eq!(vm.background_vms[1].id, 2);
        assert!(vm.background_vms[1].config.contains("x86_64"));
        // Third VM: riscv32, native mode
        assert_eq!(vm.background_vms[2].id, 3);
        assert_eq!(vm.background_vms[2].mode, HypervisorMode::Native);
    }

    #[test]
    fn test_vm_spawn_max_four() {
        let vm = compile_run(
            r#"
            LDI r11, 0
            ; Spawn 4 VMs
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            LDI r10, 0x2100
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            LDI r10, 0x2200
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            LDI r10, 0x2300
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            ; 5th should fail
            LDI r10, 0x2400
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            ; r0 should be 0xFFFFFFFE (max reached)
            MOV r15, r0
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 4, "should have exactly 4 VMs");
        assert_eq!(
            vm.regs[15], 0xFFFFFFFD,
            "5th spawn should return max-reached error"
        );
    }

    #[test]
    fn test_vm_spawn_missing_arch() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "kernel=Image ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            HALT
        "#,
        );
        assert_eq!(
            vm.background_vms.len(),
            0,
            "should have 0 VMs (missing arch=)"
        );
        assert_eq!(
            vm.regs[12],
            geos_errno(GEOS_EINVAL),
            "should return missing-arch error"
        );
    }

    #[test]
    fn test_vm_kill_basic() {
        let vm = compile_run(
            r#"
            ; Spawn VM
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            ; Kill it
            VM_KILL r12
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 0, "VM should be killed");
        assert_eq!(vm.regs[0], 0, "r0 should be 0 (success)");
    }

    #[test]
    fn test_vm_kill_not_found() {
        let vm = compile_run(
            r#"
            LDI r10, 99
            VM_KILL r10
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 0xFFFFFFF9, "should return not-found error");
    }

    #[test]
    fn test_vm_status_states() {
        let vm = compile_run(
            r#"
            ; Spawn VM (starts Paused)
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            ; Check status (should be Paused=2)
            VM_STATUS r12
            MOV r13, r0
            ; Resume it
            VM_RESUME r12
            ; Check status (should be Running=1)
            VM_STATUS r12
            MOV r14, r0
            ; Pause it
            VM_PAUSE r12
            ; Check status (should be Paused=2)
            VM_STATUS r12
            MOV r15, r0
            HALT
        "#,
        );
        assert_eq!(vm.regs[13], 2, "initially Paused");
        assert_eq!(vm.regs[14], 1, "after Resume: Running");
        assert_eq!(vm.regs[15], 2, "after Pause: Paused");
    }

    #[test]
    fn test_vm_resume_already_running() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            VM_RESUME r12
            ; Try to resume again (already running)
            VM_RESUME r12
            HALT
        "#,
        );
        assert_eq!(
            vm.regs[0], 0xFFFFFFFD,
            "should return already-running error"
        );
    }

    #[test]
    fn test_vm_pause_already_paused() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            ; Already paused, try to pause again
            VM_PAUSE r12
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 0xFFFFFFFD, "should return wrong-state error");
    }

    #[test]
    fn test_vm_set_budget() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            ; Set budget to 5000 instructions/frame
            LDI r13, 5000
            VM_SET_BUDGET r12, r13
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 0, "should succeed");
        assert_eq!(vm.background_vms[0].instructions_per_frame, 5000);
    }

    #[test]
    fn test_vm_set_budget_zero_fails() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            MOV r12, r0
            LDI r13, 0
            VM_SET_BUDGET r12, r13
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 0xFFFFFFFD, "zero budget should fail");
    }

    #[test]
    fn test_vm_list() {
        let vm = compile_run(
            r#"
            LDI r11, 0
            ; Spawn 3 VMs
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            LDI r10, 0x2100
            STRO r10, "arch=x86_64 ram=512M"
            VM_SPAWN r10, r11
            LDI r10, 0x2200
            STRO r10, "arch=riscv32 ram=128M"
            VM_SPAWN r10, r11
            ; List them to RAM at 0x3000
            LDI r14, 0x3000
            VM_LIST r14
            ; r0 = count
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 3, "should list 3 VMs");
        assert_eq!(vm.ram[0x3000], 1, "first VM ID should be 1");
        assert_eq!(vm.ram[0x3001], 2, "second VM ID should be 2");
        assert_eq!(vm.ram[0x3002], 3, "third VM ID should be 3");
    }

    #[test]
    fn test_vm_list_after_kill() {
        let vm = compile_run(
            r#"
            LDI r11, 0
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            MOV r12, r0
            LDI r10, 0x2100
            STRO r10, "arch=x86_64 ram=512M"
            VM_SPAWN r10, r11
            ; Kill first VM
            VM_KILL r12
            ; List remaining
            LDI r14, 0x3000
            VM_LIST r14
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 1, "should list 1 VM after kill");
        assert_eq!(vm.ram[0x3000], 2, "remaining VM should be ID 2");
    }

    #[test]
    fn test_vm_status_not_found() {
        let vm = compile_run(
            r#"
            LDI r10, 99
            VM_STATUS r10
            HALT
        "#,
        );
        assert_eq!(vm.regs[0], 0, "not-found status should be 0");
    }

    #[test]
    fn test_background_vm_default_budget() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(
            vm.background_vms[0].instructions_per_frame, 1000,
            "default budget should be 1000"
        );
    }

    #[test]
    fn test_background_vm_mode_detection() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M mode=native"
            LDI r11, 0
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(
            vm.background_vms[0].mode,
            HypervisorMode::Native,
            "mode=native should set Native"
        );
    }

    #[test]
    fn test_background_vm_qemu_mode_default() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 0
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(
            vm.background_vms[0].mode,
            HypervisorMode::Qemu,
            "no mode= should default to Qemu"
        );
    }

    #[test]
    fn test_vm_spawn_with_window_id() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            LDI r11, 5
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(vm.background_vms[0].window_id, 5, "window_id should be 5");
    }

    #[test]
    fn test_vm_spawn_empty_string_fails() {
        let vm = compile_run(
            r#"
            LDI r10, 0x2000
            STRO r10, ""
            LDI r11, 0
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 0, "empty config should not spawn");
        // Empty string has no arch=, so returns 0xFFFFFFFD (missing arch)
        assert_ne!(vm.regs[0], 0, "should return error (not success)");
    }

    #[test]
    fn test_vm_kill_specific_id() {
        // Test that killing one VM doesn't affect others
        let vm = compile_run(
            r#"
            LDI r11, 0
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            MOV r12, r0
            LDI r10, 0x2100
            STRO r10, "arch=x86_64 ram=512M"
            VM_SPAWN r10, r11
            MOV r13, r0
            LDI r10, 0x2200
            STRO r10, "arch=riscv32 ram=128M"
            VM_SPAWN r10, r11
            MOV r14, r0
            ; Kill the middle one (ID 2)
            VM_KILL r13
            HALT
        "#,
        );
        assert_eq!(vm.background_vms.len(), 2, "should have 2 VMs after kill");
        assert_eq!(vm.background_vms[0].id, 1, "first should be ID 1");
        assert_eq!(vm.background_vms[1].id, 3, "second should be ID 3");
        // Verify the configs are correct
        assert!(vm.background_vms[0].config.contains("riscv64"));
        assert!(vm.background_vms[1].config.contains("riscv32"));
    }

    #[test]
    fn test_vm_id_monotonically_increasing() {
        let vm = compile_run(
            r#"
            LDI r11, 0
            ; Spawn 3, kill middle one, spawn another
            LDI r10, 0x2000
            STRO r10, "arch=riscv64 ram=256M"
            VM_SPAWN r10, r11
            MOV r12, r0
            LDI r10, 0x2100
            STRO r10, "arch=x86_64 ram=512M"
            VM_SPAWN r10, r11
            VM_KILL r0
            LDI r10, 0x2200
            STRO r10, "arch=riscv32 ram=128M"
            VM_SPAWN r10, r11
            HALT
        "#,
        );
        // IDs should be 1, 3 (not 1, 2 -- 2 was killed, next gets 3)
        let ids: Vec<u32> = vm.background_vms.iter().map(|v| v.id).collect();
        assert_eq!(ids, vec![1, 3], "IDs should be monotonically increasing");
    }

    #[test]
    fn test_vm_disasm() {
        let mut vm = Vm::new();
        // VM_SPAWN r10, r11
        vm.ram[0] = 0x9F;
        vm.ram[1] = 10;
        vm.ram[2] = 11;
        let (m, len) = vm.disassemble_at(0);
        assert_eq!(m, "VM_SPAWN r10, r11");
        assert_eq!(len, 3);

        // VM_KILL r10
        vm.ram[3] = 0xA0;
        vm.ram[4] = 10;
        let (m, len) = vm.disassemble_at(3);
        assert_eq!(m, "VM_KILL r10");
        assert_eq!(len, 2);

        // VM_STATUS r5
        vm.ram[5] = 0xA1;
        vm.ram[6] = 5;
        let (m, len) = vm.disassemble_at(5);
        assert_eq!(m, "VM_STATUS r5");
        assert_eq!(len, 2);

        // VM_PAUSE r3
        vm.ram[7] = 0xA2;
        vm.ram[8] = 3;
        let (m, len) = vm.disassemble_at(7);
        assert_eq!(m, "VM_PAUSE r3");
        assert_eq!(len, 2);

        // VM_RESUME r7
        vm.ram[9] = 0xA3;
        vm.ram[10] = 7;
        let (m, len) = vm.disassemble_at(9);
        assert_eq!(m, "VM_RESUME r7");
        assert_eq!(len, 2);

        // VM_SET_BUDGET r4, r5
        vm.ram[11] = 0xA4;
        vm.ram[12] = 4;
        vm.ram[13] = 5;
        let (m, len) = vm.disassemble_at(11);
        assert_eq!(m, "VM_SET_BUDGET r4, r5");
        assert_eq!(len, 3);

        // VM_LIST r8
        vm.ram[14] = 0xA5;
        vm.ram[15] = 8;
        let (m, len) = vm.disassemble_at(14);
        assert_eq!(m, "VM_LIST r8");
        assert_eq!(len, 2);
    }
}

#[cfg(test)]
mod substrate_mmio_tests {
    use crate::vm::Vm;

    fn make_vm() -> Vm {
        Vm::new()
    }

    #[test]
    fn test_substrate_nop() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x00;
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // NOP should not change status
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_unknown_command() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0xFF; // Unknown command
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Unknown command should set status to error (0xFF)
        assert_eq!(vm.substrate_status, 0xFF);
    }

    #[test]
    fn test_substrate_tick_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x01; // TICK
        vm.substrate_arg1 = 10;
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Without GPU feature, should just clear the command (no-op)
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_circuit_load_fibonacci_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x02; // CIRCUIT_LOAD
        vm.substrate_arg1 = 1; // Fibonacci
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // CIRCUIT_LOAD sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_circuit_load_xor_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x02; // CIRCUIT_LOAD
        vm.substrate_arg1 = 2; // XOR
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // CIRCUIT_LOAD sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_circuit_load_invalid_id() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x02; // CIRCUIT_LOAD
        vm.substrate_arg1 = 99; // Invalid ID
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Invalid ID should leave status unchanged (no-op)
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_circuit_write_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x03; // CIRCUIT_WRITE
        vm.substrate_arg1 = 0x1000; // port
        vm.substrate_arg2 = 0x123456; // val
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // CIRCUIT_WRITE sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_circuit_read_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x04; // CIRCUIT_READ
        vm.substrate_arg1 = 0x1000; // port
        vm.substrate_result = 0;
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // CIRCUIT_READ sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_circuit_fire_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x05; // CIRCUIT_FIRE
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // CIRCUIT_FIRE sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_defrag_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x06; // DEFRAG
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // DEFRAG sets status unconditionally (no GPU feature gate)
        assert_eq!(vm.substrate_status, 2);
    }

    #[test]
    fn test_substrate_learn_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x07; // LEARN
        vm.substrate_arg1 = 128; // decay_rate = 128/256 = 0.5
        vm.substrate_arg2 = 0x10; // bump_size = 16
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Without GPU, should just clear the command
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_copy_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x08; // COPY
                                 // Pack sx, sy, dx, dy into arg1: sx=10, sy=20, dx=30, dy=40
        vm.substrate_arg1 = (10 << 24) | (20 << 16) | (30 << 8) | 40;
        vm.substrate_arg2 = (50 << 16) | 60; // w=50, h=60
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Without GPU, should just clear the command
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_patch_no_gpu() {
        let mut vm = make_vm();
        vm.substrate_cmd = 0x09; // PATCH
        vm.substrate_x = 128;
        vm.substrate_y = 128;
        vm.substrate_arg1 = 0x00FF00; // green color
        vm.substrate_status = 0;

        vm.handle_substrate_command();

        // Without GPU, should just clear the command
        assert_eq!(vm.substrate_status, 0);
    }

    #[test]
    fn test_substrate_arg_packing() {
        // Test the arg packing format for COPY command
        // arg1: sx[8] sy[8] dx[8] dy[8]
        // arg2: w[16] h[16]

        let sx = 10;
        let sy = 20;
        let dx = 30;
        let dy = 40;
        let w = 100;
        let h = 80;

        let arg1 = (sx << 24) | (sy << 16) | (dx << 8) | dy;
        let arg2 = (w << 16) | h;

        assert_eq!(arg1, 0x0A141E28);
        assert_eq!(arg2, 0x00640050);
    }

    #[test]
    fn test_substrate_command_sequence() {
        let mut vm = make_vm();

        // Test command sequence: NOP -> TICK -> UNKNOWN
        vm.substrate_cmd = 0x00;
        vm.handle_substrate_command();
        assert_eq!(vm.substrate_status, 0);

        vm.substrate_cmd = 0x01;
        vm.handle_substrate_command();
        assert_eq!(vm.substrate_status, 0);

        vm.substrate_cmd = 0xAA; // unknown
        vm.handle_substrate_command();
        assert_eq!(vm.substrate_status, 0xFF);
    }

    #[test]
    fn test_substrate_position_fields() {
        let mut vm = make_vm();
        vm.substrate_x = 100;
        vm.substrate_y = 200;

        assert_eq!(vm.substrate_x, 100);
        assert_eq!(vm.substrate_y, 200);
    }
}
