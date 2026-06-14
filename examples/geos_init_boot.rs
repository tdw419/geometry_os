// Boot geos-init in the GeOS emulator
// This loads the geos-init ELF and runs it.

use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let binary_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos-init/target/riscv32imac-unknown-none-elf/debug/geos-init";
    let binary_data = fs::read(binary_path).expect("geos-init binary not found");

    eprintln!("geos-init binary: {} bytes", binary_data.len());

    // Create VM with 128MB RAM
    let mem_base: u64 = 0x80000000;
    let ram_size = 128 * 1024 * 1024;
    let mut vm = RiscvVm::new_with_base(mem_base, ram_size);

    // Load binary
    let load_info = match geometry_os::riscv::loader::load_auto(&mut vm.bus, &binary_data, 0) {
        Ok(info) => {
            eprintln!(
                "Loaded binary: entry=0x{:08X}, highest=0x{:08X}",
                info.entry, info.highest_addr
            );
            info
        },
        Err(e) => {
            eprintln!("Failed to load binary: {}", e);
            return;
        },
    };

    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine; // Run in Machine mode

    eprintln!("=== Booting geos-init ===");

    let max_instrs = 1_000_000;
    let mut count: u64 = 0;

    while count < max_instrs {
        let result = vm.step();

        match result {
            StepResult::Ok | StepResult::Ecall => {},
            _ => {
                eprintln!(
                    "
=== Halted at instr {}: {:?} ===",
                    count, result
                );
                break;
            },
        }
        count += 1;
    }

    // Dump framebuffer
    let fb_addr = 0x6000_0000;
    let mut fb_data = [0u32; 256 * 256];
    for i in 0..(256 * 256) {
        fb_data[i] = vm.bus.read_word(fb_addr + (i * 4) as u64).unwrap_or(0);
    }

    // Check if red pixel exists (0xFF0000FF)
    let mut found = false;
    for pixel in fb_data.iter() {
        if *pixel == 0xFF0000FF {
            found = true;
            break;
        }
    }

    if found {
        eprintln!("SUCCESS: Red pixel found in framebuffer!");
    } else {
        eprintln!("FAILURE: Red pixel not found in framebuffer.");
    }
}
