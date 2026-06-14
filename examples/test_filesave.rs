use geometry_os::vm::Vm;
use std::path::PathBuf;

fn main() {
    println!("=== Testing Memory Palace FS: FILEWRITE ===\n");

    // Create a test file first
    let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
    let test_path = format!("{}/.geometry_os/vmfs/middle_ring/file_00000064.dat", home); // 0x64 = 100
    let test_data = b"Hello Geometry OS";
    std::fs::write(&test_path, test_data).expect("write test file");
    println!("Created test file: {}", test_path);

    // ── Test: READ the file using FILEOPEN + FILEREAD ──
    let mut vm = Vm::new();
    vm.halted = false;

    let bytecode = &[
        0x10, 1, 0x01, // LDI r1, 1 (ring)
        0x10, 2, 0x64, // LDI r2, 0x64 (angle = 100)
        0x0D, 1, 2, // FILEOPEN r1, r2
        0x10, 10, 0x100, // LDI r10, 0x100 (buffer)
        0x10, 11, 17, // LDI r11, 17 (length)
        0x0E, 0, 10, 11,   // FILEREAD r0, r10, r11
        0x00, // HALT
    ];

    for (i, &word) in bytecode.iter().enumerate() {
        vm.ram[i] = word;
    }
    vm.pc = 0;

    while vm.step() && !vm.halted {}

    println!("READ Test:");
    println!("  Halted: {}, PC: 0x{:04X}", vm.halted, vm.pc);
    println!("  r0 (bytes read): {}", vm.regs[0]);

    let buf: Vec<u8> = (0x100..0x100 + 17).map(|addr| vm.ram[addr] as u8).collect();
    println!("  Data read: {:?}", buf);
    println!("  Match expected: {}", buf == test_data);

    // ── Test: WRITE to a new file using Memory Palace FS ──
    // Note: The Memory Palace FS uses different opcodes (0xD0-0xD4) for spatial coordinates
    // but these opcodes are NOT in the main dispatch table. They are internal methods.

    // However, we can test that the existing FILEOPEN/FILEWRITE (0x0D/0x0F) work
    // by writing to a test file via VFS
    let mut vm2 = Vm::new();
    vm2.halted = false;

    // Write "TestWrite" to a file
    let write_data: &[u8] = b"TestWrite";
    for (i, &byte) in write_data.iter().enumerate() {
        vm2.ram[0x200 + i * 4] = byte as u32;
    }

    let write_bytecode = &[
        0x10, 1, 0x01, // LDI r1, 1 (ring)
        0x10, 2, 0x65, // LDI r2, 0x65 (angle = 101, new file)
        0x0D, 1, 2, // FILEOPEN r1, r2 (opens for write)
        0x10, 10, 0x200, // LDI r10, 0x200 (buffer)
        0x10, 11, 8, // LDI r11, 8 (length)
        0x0F, 0, 10, 11,   // FILEWRITE r0, r10, r11
        0x00, // HALT
    ];

    for (i, &word) in write_bytecode.iter().enumerate() {
        vm2.ram[i] = word;
    }
    vm2.pc = 0;

    while vm2.step() && !vm2.halted {}

    println!("\nWRITE Test:");
    println!("  Halted: {}, PC: 0x{:04X}", vm2.halted, vm2.pc);
    println!("  r0 (bytes written): {}", vm2.regs[0]);

    // List files in middle_ring
    let base_dir = PathBuf::from(home).join(".geometry_os/vmfs/middle_ring");
    if base_dir.exists() {
        println!("\nFiles in middle_ring:");
        if let Ok(entries) = std::fs::read_dir(&base_dir) {
            for entry in entries.flatten() {
                let name = entry.file_name();
                println!("  {}", name.display());
            }
        }
    }

    // Cleanup
    let _ = std::fs::remove_file(&test_path);

    println!("\n=== Test Complete ===");
}
