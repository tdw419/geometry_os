//! Diagnostic: run geos_kern.elf and check context switching behavior.
//! Checks whether guest B (life32) re-initializes on every context switch.

use geometry_os::riscv::RiscvVm;
use std::fs;
use std::time::Instant;

fn main() {
    let kernel_data = fs::read("examples/riscv-hello/geos_kern.elf")
        .expect("geos_kern.elf not found");

    let mut vm = RiscvVm::new_with_base(0x80000000u64, 16 * 1024 * 1024);

    let load_info = geometry_os::riscv::loader::load_elf(&mut vm.bus, &kernel_data)
        .expect("ELF load failed");

    eprintln!("Entry point: 0x{:08X}", load_info.entry);

    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;
    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.csr.mie |= 1 << 7; // MTIE
    vm.cpu.csr.mstatus |= 1 << 3; // MIE

    let max_instr = 50_000_000u64;
    let start = Instant::now();
    let mut count = 0u64;

    // Track MEPC on each step that enters the trap handler
    // We detect this by checking if PC jumps to the trap handler address
    let mut timer_traps = 0u64;
    let mut ecall_traps = 0u64;
    let mut prev_sbi_len = 0usize;

    // Detect mepc addresses after trap returns (look for mret)
    let mut mepc_after_timer: Vec<u32> = Vec::new();

    // Track kern_trap_entry address
    let trap_entry_addr = {
        // The trap handler address is set by csrw mtvec in c_start
        // We need to find it. For now, observe from console output.
        // The kernel sets mtvec to &kern_trap_entry.
        // We'll detect it by watching for csrw mtvec.
        0u32 // placeholder
    };

    while count < max_instr {
        let pc_before = vm.cpu.pc;
        let result = vm.step();
        count += 1;

        // Check for timer traps: mcause should be 0x80000007
        // We detect this by watching mepc changes after MRET
        // Actually, let's just check SBI output growth periodically
        if count % 500_000 == 0 {
            let sbi_len = vm.bus.sbi.console_output.len();
            if sbi_len != prev_sbi_len {
                let new_output = String::from_utf8_lossy(
                    &vm.bus.sbi.console_output[prev_sbi_len..sbi_len]
                );
                // Only print non-heartbeat output
                for line in new_output.lines() {
                    if !line.starts_with('T') && !line.is_empty() {
                        eprintln!("[{}] {}", count, line);
                    }
                }
                prev_sbi_len = sbi_len;
            }
        }

        if result == geometry_os::riscv::cpu::StepResult::Shutdown {
            eprintln!("VM shut down at count {}", count);
            break;
        }
    }

    let elapsed = start.elapsed();
    eprintln!("\n=== RESULTS ===");
    eprintln!("Instructions: {}", count);
    eprintln!("Time: {:?}", elapsed);

    // Check SBI output
    let sbi = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    let uart = String::from_utf8_lossy(&vm.bus.uart.tx_buf);
    let combined = format!("{}{}", sbi, uart);

    // Count life32 startup messages (filter out heartbeat 'T' chars)
    let non_heartbeat: String = combined.chars().filter(|c| *c != 'T').collect();
    let life32_count = non_heartbeat.matches("[life32] 32x32").count();
    eprintln!("Life32 startup message count: {}", life32_count);

    if life32_count > 1 {
        eprintln!("BUG CONFIRMED: life32 re-initializes {} times!", life32_count);
    } else if life32_count == 1 {
        eprintln!("OK: life32 starts exactly once");
    } else {
        eprintln!("WARNING: life32 never started ({} chars output)", combined.len());
    }

    // Count painter startup messages
    let painter_count = non_heartbeat.matches("[painter]").count();
    eprintln!("Painter message count: {}", painter_count);

    // Show full console output (last 3000 chars, stripped of heartbeats)
    eprintln!("\n=== CONSOLE OUTPUT (last 3000 non-heartbeat chars) ===");
    let clean: String = combined.chars().filter(|c| *c != 'T').collect();
    let tail = if clean.len() > 3000 {
        &clean[clean.len() - 3000..]
    } else {
        &clean
    };
    eprintln!("{}", tail);
    eprintln!("=== END CONSOLE OUTPUT ===");

    eprintln!("\nPC: 0x{:08X}", vm.cpu.pc);
    eprintln!("Privilege: {:?}", vm.cpu.privilege);
    eprintln!("MEPC: 0x{:08X}", vm.cpu.csr.mepc);
}
