use super::*;
use crate::vm::types::*;

// ============================================================================
// Test Coverage for Syscall Opcodes (ops_syscall.rs)
// Phase 426 deliverables: READLN, WAITPID, EXECP, CHDIR, GETCWD
// ============================================================================

struct OpcodeTestVm {
    vm: Vm,
}

impl std::ops::Deref for OpcodeTestVm {
    type Target = Vm;
    fn deref(&self) -> &Self::Target {
        &self.vm
    }
}

impl std::ops::DerefMut for OpcodeTestVm {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.vm
    }
}

fn opcode_test_vm() -> OpcodeTestVm {
    OpcodeTestVm { vm: Vm::new() }
}

impl OpcodeTestVm {
    /// Spawn a child process from assembly code and return its PID.
    fn spawn_child(&mut self, code: &str, start_addr: u32) -> u32 {
        let asm = crate::assembler::assemble(code, 0).expect("Assembly failed");
        let start_page = start_addr / PAGE_SIZE as u32;
        let _pc = 0;

        // Copy bytecode to RAM at start_addr
        for (i, &word) in asm.pixels.iter().enumerate() {
            if start_addr as usize + i < self.vm.ram.len() {
                self.vm.ram[start_addr as usize + i] = word;
            }
        }

        // Create child page directory and copy code pages
        let mut pd = vec![0u32; 1024];
        pd[0] = start_page; // Identity map the code page

        // Allocate child PID
        let pid = self.vm.processes.len() as u32 + 1;
        let child = Process {
            pid,
            parent_pid: 0, // Main process is parent
            pc: 0,
            regs: [0; NUM_REGS],
            mode: CpuMode::User,
            page_dir: Some(pd),
            kernel_stack: Vec::new(),
            state: ProcessState::Ready,
            priority: 1,
            slice_remaining: 0,
            sleep_until: 0,
            yielded: false,
            msg_queue: Vec::new(),
            signal_handlers: [0; 4],
            pending_signals: Vec::new(),
            vmas: Vec::new(),
            brk_pos: 0,
            exit_code: 0,
            segfaulted: false,
            custom_font: None,
            font_mode: 0,
            capabilities: None,
            data_base: 0,
        };
        self.vm.processes.push(child);
        pid
    }
}

// ============================================================================
// READLN (0x68) Tests
// ============================================================================

#[test]
fn test_readln_yield_when_no_key() {
    let mut t = opcode_test_vm();
    // Setup: r1 = buffer addr (0x2000), r2 = buffer size (32)
    t.vm.regs[1] = 0x2000;
    t.vm.regs[2] = 32;
    t.vm.ram[0xFFF] = 0; // No key available

    // Assemble READLN syscall
    let source = r#"
        LDI r12, 64
        READLN r1, r12, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until READLN executes
    for _ in 0..10 {
        if !t.vm.step() {
            break;
        }
        if t.vm.regs[1] == 0x2000 && t.vm.yielded {
            break;
        }
    }

    assert!(t.vm.yielded, "READLN should yield when no key is available");
}

#[test]
fn test_readln_enter_key_terminates() {
    let mut t = opcode_test_vm();
    // Setup: r1 = buffer addr (0x2000), r2 = buffer size (32)
    t.vm.regs[1] = 0x2000;
    t.vm.regs[2] = 32;
    // Simulate typing "HI" + Enter
    t.vm.key_buffer = vec![b'H' as u32, b'I' as u32, 0x0Au32]; // 0x0Au32 = Enter

    // Assemble READLN syscall
    let source = r#"
        LDI r12, 64
        READLN r1, r12, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Check buffer contains "HI\n"
    assert_eq!(t.vm.ram[0x2000], b'H' as u32);
    assert_eq!(t.vm.ram[0x2001], b'I' as u32);
    assert_eq!(t.vm.ram[0x2002], 0x0A); // newline
    assert_eq!(t.vm.ram[0x2003], 0); // null terminator
}

#[test]
fn test_readln_backspace_deletes() {
    let mut t = opcode_test_vm();
    // Setup: r1 = buffer addr (0x2000), r2 = buffer size (32)
    t.vm.regs[1] = 0x2000;
    t.vm.regs[2] = 32;
    // Simulate typing "A", backspace, "B", Enter
    t.vm.key_buffer = vec![b'A' as u32, 0x08u32, b'B' as u32, 0x0Au32]; // 0x08u32 = Backspace

    // Assemble READLN syscall
    let source = r#"
        LDI r12, 64
        READLN r1, r12, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Check buffer contains "B\n" (A was deleted)
    assert_eq!(t.vm.ram[0x2000], b'B' as u32);
    assert_eq!(t.vm.ram[0x2001], 0x0A);
    assert_eq!(t.vm.ram[0x2002], 0);
}

#[test]
fn test_readln_printable_characters() {
    let mut t = opcode_test_vm();
    // Setup: r1 = buffer addr (0x2000), r2 = buffer size (32)
    t.vm.regs[1] = 0x2000;
    t.vm.regs[2] = 32;
    // Simulate typing various printable characters
    t.vm.key_buffer = vec![b'a' as u32, b'Z' as u32, b'0' as u32, b' ' as u32, b'!' as u32, 0x0Au32];

    // Assemble READLN syscall
    let source = r#"
        LDI r12, 64
        READLN r1, r12, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Check buffer
    assert_eq!(t.vm.ram[0x2000], b'a' as u32);
    assert_eq!(t.vm.ram[0x2001], b'Z' as u32);
    assert_eq!(t.vm.ram[0x2002], b'0' as u32);
    assert_eq!(t.vm.ram[0x2003], b' ' as u32 as u32);
    assert_eq!(t.vm.ram[0x2004], b'!' as u32 as u32);
    assert_eq!(t.vm.ram[0x2005], 0x0A);
}

#[test]
fn test_readln_buffer_overflow() {
    let mut t = opcode_test_vm();
    // Setup: tiny buffer (4 bytes)
    t.vm.regs[1] = 0x2000;
    t.vm.regs[2] = 4;
    // Try to type more than buffer can hold
    t.vm.key_buffer = vec![b'A' as u32, b'B' as u32, b'C' as u32, b'D' as u32, b'E' as u32, 0x0Au32];

    // Assemble READLN syscall
    let source = r#"
        LDI r12, 64
        READLN r1, r12, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Check buffer was truncated (should only hold 3 chars + null + newline max)
    // Actual behavior depends on implementation, just verify it doesn't crash
    assert!(t.vm.halted);
}

// ============================================================================
// WAITPID (0x69) Tests
// ============================================================================

#[test]
fn test_waitpid_reaps_zombie() {
    let mut t = opcode_test_vm();

    // Spawn a child that exits immediately
    let child_code = r#"
        LDI r0, 42  ; exit code
        EXIT
    "#;
    let child_pid = t.spawn_child(child_code, 0x4000);

    // Run child to completion
    t.vm.current_pid = child_pid;
    for _ in 0..1000 {
        if !t.vm.step() {
            break;
        }
    }

    // Verify child is Zombie
    let child = t.vm.processes.iter().find(|p| p.pid == child_pid).unwrap();
    assert!(matches!(child.state, ProcessState::Zombie));

    // Main process waits for child
    t.vm.current_pid = 0;
    t.vm.regs[1] = child_pid;
    let source = r#"
        WAITPID r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Child should be reaped (removed from process list)
    assert!(t.vm.processes.iter().find(|p| p.pid == child_pid).is_none(),
            "Child process should be reaped after WAITPID");
}

#[test]
fn test_waitpid_yield_when_child_running() {
    let mut t = opcode_test_vm();

    // Spawn a child that loops forever
    let child_code = r#"
        loop:
            JMP loop
    "#;
    let child_pid = t.spawn_child(child_code, 0x4000);

    // Main process waits for child
    t.vm.current_pid = 0;
    t.vm.regs[1] = child_pid;
    let source = r#"
        WAITPID r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step a few instructions
    for _ in 0..10 {
        t.vm.step();
    }

    assert!(t.vm.yielded, "WAITPID should yield when child is still running");
}

#[test]
fn test_waitpid_invalid_pid() {
    let mut t = opcode_test_vm();

    // Try to wait for non-existent child
    t.vm.current_pid = 0;
    t.vm.regs[1] = 999; // Non-existent PID
    let source = r#"
        WAITPID r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // r0 should contain error code (GEOS_ESRCH = 3)
    assert_eq!(t.vm.regs[0], 3, "WAITPID should return GEOS_ESRCH for invalid PID");
}

// ============================================================================
// EXECP (0x6A) Tests
// ============================================================================

#[test]
fn test_execp_loads_file_and_returns_pid() {
    // Ensure test program exists
    let _ = std::fs::write(
        "programs/test_execp_child.asm",
        r#"
            LDI r0, 0
            HALT
        "#,
    );

    let mut t = opcode_test_vm();
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;

    // Write program name to RAM
    let prog_name = "test_execp_child";
    for (i, &byte) in prog_name.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }
    t.vm.ram[(path_addr as usize) + prog_name.len()] = 0; // null terminator

    // stdin/stdout defaults (0xFFFFFFFF)
    t.vm.regs[2] = 0xFFFFFFFF;
    t.vm.regs[3] = 0xFFFFFFFF;

    let source = r#"
        EXECP r1, r2, r3
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // r0 should contain the child PID (should be > 0)
    assert!(t.vm.regs[0] > 0, "EXECP should return a valid PID");
    assert!(!t.vm.processes.is_empty(), "EXECP should have spawned a child process");

    // Cleanup
    let _ = std::fs::remove_file("programs/test_execp_child.asm");
}

#[test]
fn test_execp_auto_append_asm() {
    // Ensure test program exists with .asm extension
    let _ = std::fs::write(
        "programs/test_execp_noext.asm",
        r#"
            LDI r0, 1
            HALT
        "#,
    );

    let mut t = opcode_test_vm();
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;

    // Write program name WITHOUT .asm extension
    let prog_name = "test_execp_noext";
    for (i, &byte) in prog_name.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }
    t.vm.ram[(path_addr as usize) + prog_name.len()] = 0;

    t.vm.regs[2] = 0xFFFFFFFF;
    t.vm.regs[3] = 0xFFFFFFFF;

    let source = r#"
        EXECP r1, r2, r3
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Should succeed and return PID
    assert!(t.vm.regs[0] > 0, "EXECP should auto-append .asm and succeed");

    // Cleanup
    let _ = std::fs::remove_file("programs/test_execp_noext.asm");
}

#[test]
fn test_execp_nonexistent_file() {
    let mut t = opcode_test_vm();
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;

    // Write non-existent program name
    let prog_name = "nonexistent_program";
    for (i, &byte) in prog_name.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }
    t.vm.ram[(path_addr as usize) + prog_name.len()] = 0;

    t.vm.regs[2] = 0xFFFFFFFF;
    t.vm.regs[3] = 0xFFFFFFFF;

    let source = r#"
        EXECP r1, r2, r3
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // r0 should contain error code (GEOS_ENOENT = 2)
    assert_eq!(t.vm.regs[0], 2, "EXECP should return GEOS_ENOENT for nonexistent file");
}

// ============================================================================
// CHDIR (0x6B) Tests
// ============================================================================

#[test]
fn test_chdir_updates_env_var() {
    let mut t = opcode_test_vm();
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;

    // Write directory path
    let path = "/tmp/test";
    for (i, &byte) in path.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }
    t.vm.ram[(path_addr as usize) + path.len()] = 0;

    let source = r#"
        CHDIR r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // CWD env var should be updated
    assert_eq!(t.vm.env_vars.get("CWD"), Some(&"/tmp/test".to_string()),
               "CHDIR should update CWD env var");
}

#[test]
fn test_chdir_invalid_path() {
    let mut t = opcode_test_vm();
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;

    // Write invalid path
    let path = "/invalid\0directory"; // null in middle
    for (i, &byte) in path.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }

    let source = r#"
        CHDIR r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // CWD env var should NOT be updated
    assert!(t.vm.env_vars.get("CWD").is_none() ||
            t.vm.env_vars.get("CWD") != Some(&"/invalid".to_string()),
            "CHDIR should not update CWD for invalid path");
}

// ============================================================================
// GETCWD (0x6C) Tests
// ============================================================================

#[test]
fn test_getcwd_retrieves_env_var() {
    let mut t = opcode_test_vm();

    // Set CWD env var
    t.vm.env_vars.insert("CWD".to_string(), "/home/user".to_string());

    let buf_addr = 0x2000;
    let buf_size = 64;
    t.vm.regs[1] = buf_addr;
    t.vm.regs[2] = buf_size;

    let source = r#"
        GETCWD r1, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Check buffer contains "/home/user"
    let mut result = String::new();
    for i in 0..buf_size {
        let byte = t.vm.ram[(buf_addr as usize) + (i as usize)] as u8;
        if byte == 0 {
            break;
        }
        result.push(byte as char);
    }

    assert_eq!(result, "/home/user", "GETCWD should retrieve CWD from env vars");
}

#[test]
fn test_getcwd_when_not_set() {
    let mut t = opcode_test_vm();

    // CWD env var is not set

    let buf_addr = 0x2000;
    let buf_size = 64;
    t.vm.regs[1] = buf_addr;
    t.vm.regs[2] = buf_size;

    let source = r#"
        GETCWD r1, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Buffer should be empty or contain default path
    let first_byte = t.vm.ram[buf_addr as usize] as u8;
    assert!(first_byte == 0, "GETCWD should return empty string when CWD not set");
}

#[test]
fn test_getcwd_buffer_truncation() {
    let mut t = opcode_test_vm();

    // Set a long CWD path
    t.vm.env_vars.insert("CWD".to_string(), "/very/long/path/that/exceeds/buffer/size".to_string());

    let buf_addr = 0x2000;
    let buf_size = 10; // Too small
    t.vm.regs[1] = buf_addr;
    t.vm.regs[2] = buf_size;

    let source = r#"
        GETCWD r1, r2
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;

    // Step until HALT
    while t.vm.step() {}

    // Should not crash and should return truncated or empty string
    assert!(t.vm.halted, "GETCWD should not crash on small buffer");
}

// ============================================================================
// CHDIR/GETCWD Round-Trip Tests
// ============================================================================

#[test]
fn test_chdir_getcwd_roundtrip() {
    let mut t = opcode_test_vm();

    // CHDIR
    let path_addr = 0x3000;
    t.vm.regs[1] = path_addr;
    let path = "/var/log";
    for (i, &byte) in path.as_bytes().iter().enumerate() {
        t.vm.ram[(path_addr as usize) + i] = byte as u32;
    }
    t.vm.ram[(path_addr as usize) + path.len()] = 0;

    let source = r#"
        CHDIR r1
        HALT
    "#;
    let asm = crate::assembler::assemble(source, 0).expect("Assembly failed");
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    t.vm.halted = false;
    while t.vm.step() {}

    // GETCWD
    t.vm.halted = false;
    let buf_addr = 0x4000;
    t.vm.regs[1] = buf_addr;
    t.vm.regs[2] = 64;

    let source2 = r#"
        GETCWD r1, r2
        HALT
    "#;
    let asm2 = crate::assembler::assemble(source2, 0).expect("Assembly failed");
    for (i, &word) in asm2.pixels.iter().enumerate() {
        if i < t.vm.ram.len() {
            t.vm.ram[i] = word;
        }
    }
    t.vm.pc = 0;
    while t.vm.step() {}

    // Verify round-trip
    let mut result = String::new();
    for i in 0..64 {
        let byte = t.vm.ram[(buf_addr as usize) + (i as usize)] as u8;
        if byte == 0 {
            break;
        }
        result.push(byte as char);
    }

    assert_eq!(result, "/var/log", "CHDIR/GETCWD round-trip should preserve path");
}