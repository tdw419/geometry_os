//! Diagnostic: watch ctx_a and ctx_b MEPC fields across context switches.
//! Also verify that kern_trap.S actually saves MEPC correctly.

use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_data =
        fs::read("examples/riscv-hello/geos_kern.elf").expect("geos_kern.elf not found");

    let mut vm = RiscvVm::new_with_base(0x80000000u64, 16 * 1024 * 1024);

    let load_info =
        geometry_os::riscv::loader::load_elf(&mut vm.bus, &kernel_data).expect("ELF load failed");

    eprintln!("Entry: 0x{:08X}", load_info.entry);

    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;
    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.csr.mie |= 1 << 7;
    vm.cpu.csr.mstatus |= 1 << 3;

    // Known addresses from nm
    let ctx_a_addr = 0x80001300u64;
    let ctx_b_addr = 0x80001384u64;
    let ctx_mepc_off = 128u64; // offset 128 = word index 32
    let current_id_addr = 0x8000140cu64;

    let max_instr = 3_000_000u64;
    let mut count = 0u64;
    let mut mret_count = 0u64;

    // Watch for writes to ctx_a MEPC
    let mut last_ctx_a_mepc = 0u32;
    let mut last_ctx_b_mepc = 0u32;
    let mut mepc_write_log: Vec<(u64, u32, &str)> = Vec::new();

    while count < max_instr {
        let pc = vm.cpu.pc;
        let word = vm.bus.read_word(pc as u64).unwrap_or(0);

        // Track MEPC before step
        let mepc_before = vm.cpu.csr.mepc;

        vm.step();
        count += 1;

        // Detect MRET
        if word == 0x30200073 {
            mret_count += 1;
            let mepc = vm.cpu.csr.mepc;
            let ctx_a_mepc = vm.bus.read_word(ctx_a_addr + ctx_mepc_off).unwrap_or(0);
            let ctx_b_mepc = vm.bus.read_word(ctx_b_addr + ctx_mepc_off).unwrap_or(0);
            let current = vm.bus.read_word(current_id_addr).unwrap_or(0);

            eprintln!(
                "MRET #{} @ instr {}: mepc=0x{:08X}, current_id={}, ctx_a[32]=0x{:08X}, ctx_b[32]=0x{:08X}",
                mret_count, count, mepc, current, ctx_a_mepc, ctx_b_mepc
            );
        }

        // Detect crash
        if vm.cpu.pc == 0 && count > 10000 {
            eprintln!("PC=0 at instr {} - crash!", count);
            // Show what's in the contexts
            let ctx_a_mepc = vm.bus.read_word(ctx_a_addr + ctx_mepc_off).unwrap_or(0);
            let ctx_b_mepc = vm.bus.read_word(ctx_b_addr + ctx_mepc_off).unwrap_or(0);
            let current = vm.bus.read_word(current_id_addr).unwrap_or(0);
            let mscratch = vm.cpu.csr.sscratch; // mscratch maps to sscratch in our CSR bank
            eprintln!(
                "ctx_a[32]=0x{:08X}, ctx_b[32]=0x{:08X}, current_id={}, mscratch=0x{:08X}",
                ctx_a_mepc, ctx_b_mepc, current, mscratch
            );

            // Show what mepc was before the crash step
            eprintln!("Last MEPC: 0x{:08X}", mepc_before);
            break;
        }

        if count % 1_000_000 == 0 {
            let ctx_a_mepc = vm.bus.read_word(ctx_a_addr + ctx_mepc_off).unwrap_or(0);
            let ctx_b_mepc = vm.bus.read_word(ctx_b_addr + ctx_mepc_off).unwrap_or(0);
            eprintln!(
                "At {}: ctx_a_mepc=0x{:08X}, ctx_b_mepc=0x{:08X}",
                count, ctx_a_mepc, ctx_b_mepc
            );
        }
    }

    // Final state
    let ctx_a_mepc = vm.bus.read_word(ctx_a_addr + ctx_mepc_off).unwrap_or(0);
    let ctx_b_mepc = vm.bus.read_word(ctx_b_addr + ctx_mepc_off).unwrap_or(0);
    eprintln!(
        "\nFinal: ctx_a_mepc=0x{:08X}, ctx_b_mepc=0x{:08X}",
        ctx_a_mepc, ctx_b_mepc
    );
    eprintln!("Total MRETs: {}", mret_count);
}
