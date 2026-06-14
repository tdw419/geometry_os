// Phase 123: Alpine Linux Live Tile tests
// Tests for VM_LIVE_SPAWN, VM_LIVE_STEP, VM_LIVE_KILL
// and the hypervisor-to-window bridge (console text rendering)

#[cfg(test)]
mod phase123_live_tile {
    use crate::assembler::assemble;
    use crate::vm::types::{geos_errno, LiveHypervisorState, GEOS_EBUSY, GEOS_EINVAL, GEOS_ESRCH};
    use crate::vm::Vm;

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

    /// Helper: create a VM with a WINSYS window.
    /// WINSYS op=0 (CREATE) reads from r1=x, r2=y, r3=w, r4=h, r5=title_addr.
    fn vm_with_window() -> Vm {
        let source = "\
            LDI r1, 10\n\
            LDI r2, 10\n\
            LDI r3, 128\n\
            LDI r4, 128\n\
            LDI r5, 0\n\
            LDI r10, 0\n\
            WINSYS r10\n\
            HALT";
        compile_run(source)
    }

    #[test]
    fn test_vm_live_spawn_assembles() {
        // Verify the new opcodes assemble correctly
        let source = r#"
            LDI r1, 0x3000
            LDI r2, 1
            VM_LIVE_SPAWN r1, r2
            HALT
        "#;
        let result = assemble(source, 0);
        assert!(result.is_ok(), "VM_LIVE_SPAWN should assemble");
        let asm = result.unwrap();
        // LDI r1, 0x3000 = 3 words [0..2], LDI r2, 1 = 3 words [3..5]
        // VM_LIVE_SPAWN starts at word 6: 0xB4, r1, r2
        assert_eq!(asm.pixels[6], 0xB4);
        assert_eq!(asm.pixels[7], 1); // r1
        assert_eq!(asm.pixels[8], 2); // r2
    }

    #[test]
    fn test_vm_live_step_assembles() {
        let source = "VM_LIVE_STEP\nHALT";
        let result = assemble(source, 0);
        assert!(result.is_ok(), "VM_LIVE_STEP should assemble");
        let asm = result.unwrap();
        assert_eq!(asm.pixels[0], 0xB5);
    }

    #[test]
    fn test_vm_live_kill_assembles() {
        let source = "VM_LIVE_KILL\nHALT";
        let result = assemble(source, 0);
        assert!(result.is_ok(), "VM_LIVE_KILL should assemble");
        let asm = result.unwrap();
        assert_eq!(asm.pixels[0], 0xB6);
    }

    #[test]
    fn test_vm_live_spawn_no_window_no_bounds() {
        // VM_LIVE_SPAWN with window_reg = 0 and no bounds at 0xFC00-0xFC03
        // should fail (bw=0, bh=0 means no valid bounds to auto-create from).
        let vm = compile_run(
            "LDI r1, 0x3000\n\
             LDI r2, 0\n\
             ; Write config string at 0x3000\n\
             LDI r10, 0x3000\n\
             LDI r11, 0x61\n\
             STORE r10, r11\n\
             LDI r10, 0x3001\n\
             LDI r11, 0\n\
             STORE r10, r11\n\
             VM_LIVE_SPAWN r1, r2\n\
             HALT",
        );
        // Should fail -- no window, no valid bounds to auto-create from
        assert_ne!(vm.regs[0], 0, "window_id=0 with no bounds should fail");
    }

    #[test]
    fn test_vm_live_spawn_empty_config() {
        // VM_LIVE_SPAWN with empty config should fail
        let vm = compile_run(
            "LDI r1, 0x3000\n\
             LDI r10, 0x3000\n\
             LDI r11, 0\n\
             STORE r10, r11\n\
             LDI r2, 1\n\
             VM_LIVE_SPAWN r1, r2\n\
             HALT",
        );
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_EINVAL),
            "empty config should fail with EINVAL"
        );
    }

    #[test]
    fn test_vm_live_spawn_missing_kernel() {
        // VM_LIVE_SPAWN with config but no kernel= should fail
        let vm = compile_run(
            "LDI r1, 0x3000\n\
             ; Write 'arch=riscv32 ram=64M\\0' at 0x3000\n\
             STRO r1, \"arch=riscv32 ram=64M\"\n\
             LDI r2, 1\n\
             VM_LIVE_SPAWN r1, r2\n\
             HALT",
        );
        // Missing kernel= should return GEOS_EINVAL
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_EINVAL),
            "missing kernel= should fail with GEOS_EINVAL"
        );
    }

    #[test]
    fn test_vm_live_step_no_vm() {
        // VM_LIVE_STEP with no live VM should return 0xFFFFFFFF
        let vm = compile_run("VM_LIVE_STEP\nHALT");
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_ESRCH),
            "no live VM should return ESRCH"
        );
    }

    #[test]
    fn test_vm_live_kill_no_vm() {
        // VM_LIVE_KILL with no live VM should return 0xFFFFFFFF
        let vm = compile_run("VM_LIVE_KILL\nHALT");
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_ESRCH),
            "no live VM to kill should return ESRCH"
        );
    }

    #[test]
    fn test_vm_live_kill_clears_state() {
        // Spawn then kill - live_hypervisor should be None
        let mut vm = Vm::new();
        assert!(vm.live_hypervisor.is_none());

        // Simulate: create a live hypervisor state directly
        // (since we can't load a kernel in tests without the file)
        // Instead test the opcode path for kill when there's nothing to kill
        let source = "VM_LIVE_KILL\nHALT";
        let asm = assemble(source, 0).unwrap();
        for (i, &pixel) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = pixel;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert!(vm.live_hypervisor.is_none());
        assert_eq!(vm.regs[0], geos_errno(GEOS_ESRCH));
    }

    #[test]
    fn test_live_hypervisor_state_fields() {
        // Verify the LiveHypervisorState struct exists with correct fields
        // by creating a RiscvVm directly
        let riscv_vm = crate::riscv::RiscvVm::new(1024 * 1024); // 1MB
        let state = LiveHypervisorState {
            vm: riscv_vm,
            window_id: 1,
            instructions_per_slice: 500,
            total_instructions: 0,
            console_row: 0,
            console_col: 0,
            booted: false,
        };
        assert_eq!(state.window_id, 1);
        assert_eq!(state.instructions_per_slice, 500);
        assert_eq!(state.total_instructions, 0);
        assert!(!state.booted);
    }

    #[test]
    fn test_render_console_to_window_basic() {
        // Test the render_console_to_window method directly
        // by creating a VM with a window and a live hypervisor state
        let mut vm = vm_with_window();

        // Verify window was created
        let win = vm.windows.iter().find(|w| w.active);
        assert!(win.is_some(), "window should be created");
        let win_id = win.unwrap().id;

        // Create a RISC-V VM and inject some UART output
        let mut riscv_vm = crate::riscv::RiscvVm::new(1024 * 1024);
        // Write some chars to UART TX buffer
        riscv_vm.bus.uart.write_byte(0, b'H');
        riscv_vm.bus.uart.write_byte(0, b'e');
        riscv_vm.bus.uart.write_byte(0, b'l');
        riscv_vm.bus.uart.write_byte(0, b'l');
        riscv_vm.bus.uart.write_byte(0, b'o');

        let mut live = LiveHypervisorState {
            vm: riscv_vm,
            window_id: win_id,
            instructions_per_slice: 500,
            total_instructions: 0,
            console_row: 0,
            console_col: 0,
            booted: false,
        };

        // Render console
        vm.render_console_to_window(&mut live);

        // Check that characters were rendered
        let win = vm.windows.iter().find(|w| w.id == win_id).unwrap();
        assert!(
            win.offscreen_buffer.iter().any(|&p| p != 0),
            "window buffer should have non-zero pixels after rendering"
        );

        // Cursor should have advanced
        assert_eq!(
            live.console_col, 5,
            "5 characters should have been rendered"
        );

        // UART should be drained
        let drained = live.vm.bus.uart.drain_tx();
        assert!(drained.is_empty(), "UART should be drained after rendering");
    }

    #[test]
    fn test_render_console_newline() {
        // Test that newlines advance the row cursor
        let mut vm = vm_with_window();
        let win_id = vm.windows.iter().find(|w| w.active).unwrap().id;

        let mut riscv_vm = crate::riscv::RiscvVm::new(1024 * 1024);
        riscv_vm.bus.uart.write_byte(0, b'A');
        riscv_vm.bus.uart.write_byte(0, 10); // newline
        riscv_vm.bus.uart.write_byte(0, b'B');

        let mut live = LiveHypervisorState {
            vm: riscv_vm,
            window_id: win_id,
            instructions_per_slice: 500,
            total_instructions: 0,
            console_row: 0,
            console_col: 0,
            booted: false,
        };

        vm.render_console_to_window(&mut live);

        assert_eq!(live.console_row, 1, "should be on row 1 after newline");
        assert_eq!(live.console_col, 1, "B should be at col 1 on new row");
    }

    #[test]
    fn test_render_console_scroll() {
        // Test that the console scrolls when it reaches the bottom
        let mut vm = vm_with_window();
        let found = vm.windows.iter().find(|w| w.active).unwrap();
        let win_id = found.id;
        let win_h = found.h as usize;
        let rows = win_h / 8; // char_h = 8

        let mut riscv_vm = crate::riscv::RiscvVm::new(1024 * 1024);

        // Write enough lines to fill and scroll
        let mut live = LiveHypervisorState {
            vm: riscv_vm,
            window_id: win_id,
            instructions_per_slice: 500,
            total_instructions: 0,
            console_row: 0,
            console_col: 0,
            booted: false,
        };

        // Fill rows + 1 lines
        for _ in 0..=rows {
            live.vm.bus.uart.write_byte(0, b'X');
            live.vm.bus.uart.write_byte(0, 10); // newline
            vm.render_console_to_window(&mut live);
        }

        // Should have scrolled - row should be clamped to rows-1
        assert_eq!(
            live.console_row as usize,
            rows - 1,
            "after scroll, row should be clamped to rows-1"
        );
    }

    #[test]
    fn test_vm_live_spawn_double_fails() {
        // Can't spawn two live VMs
        // This test verifies the "already have a live VM" check
        // We test indirectly since we can't load a real kernel
        let mut vm = Vm::new();
        assert!(vm.live_hypervisor.is_none());

        // Manually set live_hypervisor to simulate an active VM
        let riscv_vm = crate::riscv::RiscvVm::new(1024 * 1024);
        vm.live_hypervisor = Some(LiveHypervisorState {
            vm: riscv_vm,
            window_id: 1,
            instructions_per_slice: 500,
            total_instructions: 0,
            console_row: 0,
            console_col: 0,
            booted: false,
        });

        // Now try to spawn another - should fail
        let source = "LDI r1, 0x3000\nLDI r2, 1\nVM_LIVE_SPAWN r1, r2\nHALT";
        let asm = assemble(source, 0).unwrap();
        for (i, &pixel) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i + 0x100] = pixel;
            }
        }
        vm.pc = 0x100;
        vm.halted = false;
        for _ in 0..10_000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_EBUSY),
            "double spawn should fail with GEOS_EBUSY"
        );
    }

    #[test]
    fn test_disasm_live_opcodes() {
        // Verify disassembler recognizes the new opcodes
        let mut test_vm = Vm::new();

        // VM_LIVE_SPAWN (0xB4)
        test_vm.ram[0] = 0xB4;
        test_vm.ram[1] = 1;
        test_vm.ram[2] = 2;
        let (name, len) = test_vm.disassemble_at(0);
        assert!(
            name.contains("VM_LIVE_SPAWN"),
            "disasm should show VM_LIVE_SPAWN, got: {}",
            name
        );
        assert_eq!(len, 3);

        // VM_LIVE_STEP (0xB5)
        test_vm.ram[100] = 0xB5;
        let (name, len) = test_vm.disassemble_at(100);
        assert!(
            name.contains("VM_LIVE_STEP"),
            "disasm should show VM_LIVE_STEP, got: {}",
            name
        );
        assert_eq!(len, 1);

        // VM_LIVE_KILL (0xB6)
        test_vm.ram[200] = 0xB6;
        let (name, len) = test_vm.disassemble_at(200);
        assert!(
            name.contains("VM_LIVE_KILL"),
            "disasm should show VM_LIVE_KILL, got: {}",
            name
        );
        assert_eq!(len, 1);
    }

    // ── Window Bounds Protocol integration tests ─────────────────

    #[test]
    fn test_vm_live_spawn_auto_window_from_bounds() {
        // Write Window Bounds Protocol to RAM[0xFC00..0xFC03],
        // then VM_LIVE_SPAWN with window_id=0 should auto-create a WINSYS window.
        let vm = compile_run(
            "; Set up Window Bounds Protocol (REGION ... SHARED would emit this)\n\
             LDI r10, 64\n\
             LDI r11, 0xFC00\n\
             STORE r11, r10\n\
             LDI r10, 64\n\
             LDI r11, 0xFC01\n\
             STORE r11, r10\n\
             LDI r10, 128\n\
             LDI r11, 0xFC02\n\
             STORE r11, r10\n\
             LDI r10, 128\n\
             LDI r11, 0xFC03\n\
             STORE r11, r10\n\
             ; Config string at 0x3000\n\
             LDI r1, 0x3000\n\
             STRO r1, \"arch=rv32imac kernel=vmlinux\"\n\
             LDI r2, 0\n\
             VM_LIVE_SPAWN r1, r2\n\
             HALT",
        );
        // Should succeed (r0=0) -- auto-created window from bounds
        assert_eq!(
            vm.regs[0], 0,
            "auto-window VM_LIVE_SPAWN should succeed, got: 0x{:X}",
            vm.regs[0]
        );
        // Should have created a window
        assert_eq!(vm.windows.len(), 1, "should have auto-created 1 window");
        let win = &vm.windows[0];
        assert_eq!(win.x, 64, "window x should be 64");
        assert_eq!(win.y, 64, "window y should be 64");
        assert_eq!(win.w, 128, "window w should be 128");
        assert_eq!(win.h, 128, "window h should be 128");
        assert!(win.active, "auto-created window should be active");
        // Live hypervisor should exist with that window's id
        assert!(
            vm.live_hypervisor.is_some(),
            "live hypervisor should be active"
        );
        assert_eq!(vm.live_hypervisor.as_ref().unwrap().window_id, win.id);
    }

    #[test]
    fn test_vm_live_spawn_auto_window_with_existing_window() {
        // If bounds exist AND there's already a window, the explicit window_id
        // should be used (not auto-creation path).
        let vm = compile_run(
            "; Set up Window Bounds Protocol\n\
             LDI r10, 10\n\
             LDI r11, 0xFC00\n\
             STORE r11, r10\n\
             LDI r10, 20\n\
             LDI r11, 0xFC01\n\
             STORE r11, r10\n\
             LDI r10, 100\n\
             LDI r11, 0xFC02\n\
             STORE r11, r10\n\
             LDI r10, 50\n\
             LDI r11, 0xFC03\n\
             STORE r11, r10\n\
             ; Create window explicitly via WINSYS\n\
             LDI r10, 0\n\
             LDI r1, 5\n\
             LDI r2, 10\n\
             LDI r3, 80\n\
             LDI r4, 40\n\
             LDI r5, 0\n\
             WINSYS r10\n\
             ; Now spawn with explicit window_id (from WINSYS create result in r0)\n\
             ; r0 has window_id from WINSYS\n\
             LDI r1, 0x3000\n\
             STRO r1, \"arch=rv32imac kernel=vmlinux\"\n\
             VM_LIVE_SPAWN r1, r0\n\
             HALT",
        );
        // Should succeed with the explicit window
        assert_eq!(
            vm.regs[0], 0,
            "explicit window VM_LIVE_SPAWN should succeed, got: 0x{:X}",
            vm.regs[0]
        );
        // Should have exactly 1 window (from WINSYS create, NOT from bounds auto-create)
        assert_eq!(
            vm.windows.len(),
            1,
            "should have 1 window from WINSYS create"
        );
        let win = &vm.windows[0];
        assert_eq!(win.x, 5, "window should have WINSYS x=5");
        assert_eq!(win.y, 10, "window should have WINSYS y=10");
        assert_eq!(win.w, 80, "window should have WINSYS w=80");
        assert_eq!(win.h, 40, "window should have WINSYS h=40");
    }

    #[test]
    fn test_vm_live_spawn_preloads_mailbox_into_ram() {
        // Verify that VM_LIVE_SPAWN preloads hypervisor_mailbox into RISC-V RAM
        // at the end of guest RAM (ram_base + ram_size - 256).
        let source = r#"
            LDI r1, 0x3000
            LDI r2, 1
            STRO r1, "arch=riscv64 kernel=vmlinux ram=4M"
            VM_LIVE_SPAWN r1, r2
            HALT
        "#;
        let asm = assemble(source, 0).unwrap();
        let mut vm = Vm::new();
        // Set mailbox before loading program and running
        for i in 0..64 {
            vm.hypervisor_mailbox[i] = 0xDEAD0000 | i as u32;
        }
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

        // VM_LIVE_SPAWN should have succeeded
        assert_eq!(
            vm.regs[0], 0,
            "VM_LIVE_SPAWN should succeed, got: 0x{:X}",
            vm.regs[0]
        );

        // Verify live hypervisor was created
        assert!(vm.live_hypervisor.is_some(), "live_hypervisor should exist");
        let live = vm.live_hypervisor.as_ref().unwrap();

        // RAM size: 4MB = 4194304 bytes
        // Mailbox at offset ram_size - 256 = 4194048
        // RISC-V RAM base is 0x8000_0000
        let mailbox_phys_addr = 0x8000_0000u64 + 4194304 - 256;

        // Read back first word
        let word0 = live.vm.bus.mem.read_word(mailbox_phys_addr).unwrap();
        assert_eq!(
            word0, 0xDEAD0000,
            "mailbox word 0 should be preloaded at physical addr 0x{:X}",
            mailbox_phys_addr
        );

        // Read back last word
        let word63 = live
            .vm
            .bus
            .mem
            .read_word(mailbox_phys_addr + 63 * 4)
            .unwrap();
        assert_eq!(word63, 0xDEAD003F, "mailbox word 63 should be preloaded");
    }
}
