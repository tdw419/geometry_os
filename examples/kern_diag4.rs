
// kern_diag4.rs -- track context switches and detect crashes
use geometry_os::riscv::RiscvVm;
use geometry_os::riscv::cpu::StepResult;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");

    let mut vm = RiscvVm::new(2 * 1024 * 1024);
    let load_info = geometry_os::riscv::loader::load_auto(&mut vm.bus, &elf, 0x8000_0000).expect("load");

    vm.cpu.pc = load_info.entry;
    vm.cpu.x[10] = 0;
    vm.cpu.x[11] = 0;
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    let mut count: u64 = 0;
    let mut prev_tp: u32 = 0;
    let mut switch_count: u32 = 0;
    let mut console_chars: Vec<u8> = Vec::new();
    let mut last_pc: u32 = 0;
    let mut stall_count: u64 = 0;

    // Run for 5M instructions
    let max = 5_000_000u64;
    while count < max {
        let old_pc = vm.cpu.pc;
        let old_tp = vm.cpu.x[4];

        match vm.step() {
            StepResult::Shutdown => { eprintln!("[DIAG] Shutdown at {}", count); break; }
            StepResult::Ebreak => { eprintln!("[DIAG] Ebreak at {}", count); break; }
            _ => {}
        }

        // Detect context switch (tp changed)
        if vm.cpu.x[4] != old_tp && old_tp != 0 {
            switch_count += 1;
            if switch_count <= 10 {
                eprintln!("[CTX] #{} at instr {}: tp 0x{:08X} -> 0x{:08X}, pc 0x{:08X} -> 0x{:08X}",
                    switch_count, count, old_tp, vm.cpu.x[4], old_pc, vm.cpu.pc);
            }
        }

        // Detect PC stall (same PC for too long)
        if vm.cpu.pc == last_pc {
            stall_count += 1;
            if stall_count == 1000 {
                eprintln!("[STALL] PC stuck at 0x{:08X} for 1000 instructions (at instr {})", vm.cpu.pc, count);
            }
        } else {
            stall_count = 0;
        }
        last_pc = vm.cpu.pc;

        // Detect out-of-range PC
        if vm.cpu.pc < 0x80000000 && vm.cpu.pc > 0x100 && count > 1000 {
            eprintln!("[BAD PC] 0x{:08X} at instruction {} (prev was 0x{:08X})", vm.cpu.pc, count, old_pc);
            // Show last 10 console chars for context
            let prev_len = console_chars.len();
            if vm.bus.sbi.console_output.len() > prev_len {
                let new_chars: Vec<u8> = vm.bus.sbi.console_output[prev_len..].to_vec();
                for &b in &new_chars {
                    if (0x20..=0x7E).contains(&b) || b == b'\n' {
                        eprint!("{}", b as char);
                    }
                }
                console_chars = vm.bus.sbi.console_output.clone();
                eprintln!();
            }
            break;
        }

        count += 1;
    }

    // Print final state
    let prev_len = console_chars.len();
    if vm.bus.sbi.console_output.len() > prev_len {
        for &b in &vm.bus.sbi.console_output[console_chars.len()..] {
            if (0x20..=0x7E).contains(&b) || b == b'\n' {
                eprint!("{}", b as char);
            }
        }
    }
    eprintln!("\n[DIAG] Ran {} instructions, {} context switches", count, switch_count);
    eprintln!("[DIAG] Final PC=0x{:08X} mscratch=0x{:08X} tp=0x{:08X} sp=0x{:08X}",
        vm.cpu.pc, vm.cpu.csr.read(0x340), vm.cpu.x[4], vm.cpu.x[2]);
    eprintln!("[DIAG] mstatus=0x{:08X} mepc=0x{:08X} mtvec=0x{:08X}",
        vm.cpu.csr.mstatus, vm.cpu.csr.read(0x341), vm.cpu.csr.read(0x305));
    eprintln!("[DIAG] mtime={} mtimecmp={} mip=0x{:08X}",
        vm.bus.clint.mtime, vm.bus.clint.mtimecmp, vm.cpu.csr.mip);
}
