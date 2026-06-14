use super::*;

/// Test that VMFS opcodes (0x0D FILEOPEN, 0x0E FILEREAD) now read from
/// ~/.geometry_os/vmfs/{inner,middle,outer}_ring/ after the decode_vmfs_path
/// redirect.
#[test]
fn test_vmfs_palace_path_redirect() {
    // ── 1. Create a test file in the Palace middle_ring ──
    let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
    let test_path = format!("{}/.geometry_os/vmfs/middle_ring/file_0000002a.dat", home);
    let test_data = b"Hello Palace";
    std::fs::write(&test_path, test_data).expect("write test file to VMFS");

    // Clean up on panic or success
    struct Cleanup(&'static str);
    impl Drop for Cleanup {
        fn drop(&mut self) {
            let _ = std::fs::remove_file(self.0);
        }
    }
    let _guard = Cleanup(Box::leak(test_path.clone().into_boxed_str()));

    // ── 2. Assemble a tiny VM program ──
    //   LDI r1, 1          ; ring = 1 (middle_ring)
    //   LDI r2, 0x2A       ; angle = 42
    //   FILEOPEN r1, r2    ; opens file, fd -> r0
    //   LDI r10, 0x100     ; buffer addr
    //   LDI r11, 12        ; read length
    //   FILEREAD r0, r10, r11
    //   HALT
    let bytecode = &[
        0x10, 1, 0x01, // LDI r1, 1
        0x10, 2, 0x2A, // LDI r2, 0x2A
        0x0D, 1, 2, // FILEOPEN r1, r2
        0x10, 10, 0x100, // LDI r10, 0x100
        0x10, 11, 12, // LDI r11, 12
        0x0E, 0, 10, 11,   // FILEREAD r0, r10, r11
        0x00, // HALT
    ];

    let mut vm = Vm::new();
    for (i, &word) in bytecode.iter().enumerate() {
        vm.ram[i] = word;
    }
    vm.pc = 0;
    vm.halted = false;
    while vm.step() && !vm.halted {
        // run to completion
    }

    // ── 3. Assert results ──
    assert!(
        vm.halted,
        "VM should have halted; pc=0x{:04X}, r0=0x{:08X}",
        vm.pc, vm.regs[0]
    );

    // FILEREAD returns bytes-read in r0
    assert_eq!(
        vm.regs[0], 12,
        "FILEREAD should return 12 bytes, got 0x{:08X}",
        vm.regs[0]
    );

    // Verify RAM buffer
    let buf: Vec<u8> = (0x100..0x100 + 12).map(|addr| vm.ram[addr] as u8).collect();
    assert_eq!(&buf[..], test_data, "Data read back from VMFS should match");
}
