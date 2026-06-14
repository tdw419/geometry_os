use geometry_os::vm::Vm;
use std::path::PathBuf;

fn main() {
    let mut vm = Vm::new();
    vm.halted = false;

    // Test: Directly call the internal methods to verify Memory Palace FS works
    // We'll write "Hello" to ring 1, angle 999 (unique to avoid collisions)

    println!("Testing Memory Palace FS directly...");

    // Call FILECREATE manually
    vm.ram[vm.pc as usize] = 0xD3; // FILECREATE
    vm.ram[vm.pc as usize + 1] = 1; // ring
    vm.ram[vm.pc as usize + 2] = 999; // angle (unique)
    vm.ram[vm.pc as usize + 3] = 0; // size_hint_reg

    vm.op_filecreate();

    println!("After FILECREATE: r0 (fd) = {}", vm.regs[0]);

    let fd = vm.regs[0];
    if fd == 0xFFFFFFFF || fd == 0 {
        println!("FILECREATE failed! Error in r0");
        return;
    }

    // Set up buffer at 0x2000 with "Hello"
    vm.ram[0x2000] = 72; // H
    vm.ram[0x2004] = 101; // e
    vm.ram[0x2008] = 108; // l
    vm.ram[0x200C] = 108; // l
    vm.ram[0x2010] = 111; // o

    // Set registers for FILEWRITE
    vm.regs[10] = 0x2000; // buffer address
    vm.regs[11] = 5; // length

    // Call FILEWRITE
    vm.ram[vm.pc as usize] = 0xD2; // FILEWRITE
    vm.ram[vm.pc as usize + 1] = 0; // fd_reg
    vm.ram[vm.pc as usize + 2] = 10; // buf_reg
    vm.ram[vm.pc as usize + 3] = 11; // len_reg

    vm.op_filewrite();

    println!("After FILEWRITE: r0 (bytes written) = {}", vm.regs[0]);

    // Check if file was created
    let home = std::env::var("HOME").unwrap_or_else(|_| "/tmp".to_string());
    let base_dir = PathBuf::from(home).join(".geometry_os/vmfs/middle_ring");

    if base_dir.exists() {
        match std::fs::read_dir(&base_dir) {
            Ok(entries) => {
                println!("Files in middle_ring:");
                let mut found = false;
                for entry in entries.flatten() {
                    let name = entry.file_name();
                    println!("  {}", name.display());
                    if name.to_string_lossy().contains("999") {
                        found = true;
                        // Try to read content
                        if let Ok(content) = std::fs::read(entry.path()) {
                            println!("    Content: {:?}", content);
                            if content == b"Hello" {
                                println!("    SUCCESS: File contains 'Hello'!");
                            }
                        }
                    }
                }
                if !found {
                    println!("    WARNING: File for angle 999 not found");
                }
            },
            Err(e) => println!("Failed to read directory: {}", e),
        }
    } else {
        println!("Directory does NOT exist: {}", base_dir.display());
    }
}
