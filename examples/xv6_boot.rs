// Boot xv6-rv32 in the GeOS emulator
// This loads the xv6-rv32 ELF kernel and runs it, monitoring SBI console output.

use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::framebuf::{FB_HEIGHT, FB_WIDTH};
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/kernel/kernel";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    eprintln!("xv6-rv32 kernel: {} bytes", kernel_data.len());

    // Create VM with 128MB RAM (PHYSTOP from memlayout.h)
    let mem_base: u64 = 0x80000000;
    let ram_size = 128 * 1024 * 1024;
    let mut vm = RiscvVm::new_with_base(mem_base, ram_size);

    // Set up initial state similar to what xv6 expects from QEMU:
    // - Kernel loaded at 0x80000000
    // - Hart boots in machine mode at _entry (0x80000000)
    // xv6's ELF has absolute physical addresses (paddr=0x80000000),
    // so the load offset is 0 (unlike Linux which uses paddr=0).
    let load_info = match geometry_os::riscv::loader::load_auto(&mut vm.bus, &kernel_data, 0) {
        Ok(info) => {
            eprintln!(
                "Loaded kernel: entry=0x{:08X}, highest=0x{:08X}",
                info.entry, info.highest_addr
            );
            info
        },
        Err(e) => {
            eprintln!("Failed to load kernel: {}", e);
            return;
        },
    };

    vm.cpu.pc = load_info.entry as u32;
    vm.cpu.x[10] = 0; // a0 = hartid
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    eprintln!("=== Booting xv6-rv32 ===\n");

    let max_instrs = 25_000_000; // 25M instructions for boot + fs init
    let mut count: u64 = 0;
    let mut last_print = 0u64;

    while count < max_instrs {
        // Tick CLINT and sync MIP — step() does this internally,
        // so we DON'T call them here. Double-ticking causes mtime
        // to advance faster than xv6's timer handler can keep up,
        // creating an infinite timer interrupt storm.
        let result = vm.step();

        match result {
            StepResult::Ok | StepResult::Ecall => {},
            StepResult::Ebreak => {
                eprintln!("\n=== xv6 halted via EBREAK at instr {} ===", count);
                report_state(&vm);
                break;
            },
            StepResult::Shutdown => {
                eprintln!("\n=== xv6 shutdown at instr {} ===", count);
                report_state(&vm);
                break;
            },
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                eprintln!("\n=== FAULT at instr {}: {:?} ===", count, result);
                eprintln!(
                    "PC=0x{:08X} scause=0x{:08X} stval=0x{:08X}",
                    vm.cpu.pc, vm.cpu.csr.scause, vm.cpu.csr.stval
                );
                report_state(&vm);
                break;
            },
            StepResult::Yielded => {
                eprintln!("\n=== xv6 yielded at instr {} ===", count);
                report_state(&vm);
                break;
            },
        }

        count += 1;

        // Progress report every 1M instructions
        if count - last_print >= 1_000_000 {
            // Check timer state
            let timer_pending = vm.bus.clint.timer_pending();
            let mip = vm.cpu.csr.read(geometry_os::riscv::csr::MIP);
            let mie = vm.cpu.csr.read(geometry_os::riscv::csr::MIE);
            let mstatus = vm.cpu.csr.read(geometry_os::riscv::csr::MSTATUS);
            let mtimecmp = vm.bus.clint.mtimecmp;
            let mtime = vm.bus.clint.mtime;
            eprintln!("  {}M: PC=0x{:08X} scause=0x{:08X} priv={:?} ecall={} sbi={}B timer={} mtime={} mtimecmp={} mip=0x{:08X} mie=0x{:08X} mstatus=0x{:08X}",
                count / 1_000_000,
                vm.cpu.pc,
                vm.cpu.csr.scause,
                vm.cpu.privilege,
                vm.bus.sbi.ecall_log.len(),
                vm.bus.sbi.console_output.len(),
                timer_pending,
                mtime,
                mtimecmp,
                mip, mie, mstatus);
            last_print = count;
        }
    }

    if count >= max_instrs {
        eprintln!("\n=== TIMEOUT after {} instructions ===", max_instrs);
        report_state(&vm);
    }
}

fn report_state(vm: &RiscvVm) {
    let sbi = &vm.bus.sbi;
    let console = &sbi.console_output;
    if !console.is_empty() {
        let s = String::from_utf8_lossy(console);
        eprintln!("SBI console output ({}B):\n{}", console.len(), s);
    } else {
        eprintln!("No SBI console output");
    }
    eprintln!(
        "Ecall count: {} (logged: {})",
        vm.cpu.ecall_count,
        sbi.ecall_log.len()
    );
    eprintln!("Final PC=0x{:08X} priv={:?}", vm.cpu.pc, vm.cpu.privilege);
    eprintln!(
        "a0=0x{:08X} a1=0x{:08X} sp=0x{:08X}",
        vm.cpu.x[10], vm.cpu.x[11], vm.cpu.x[2]
    );
    eprintln!(
        "scause=0x{:08X} stvec=0x{:08X} satp=0x{:08X}",
        vm.cpu.csr.scause, vm.cpu.csr.stvec, vm.cpu.csr.satp
    );

    // Dump framebuffer if any pixels were written
    dump_framebuffer(vm);
}

fn dump_framebuffer(vm: &RiscvVm) {
    let pixels = &vm.bus.framebuf.pixels;
    let total = FB_WIDTH * FB_HEIGHT;

    // Check if anything was written
    let written = pixels.iter().filter(|&&p| p != 0).count();
    eprintln!("Framebuffer: {} / {} non-zero pixels", written, total);

    if written == 0 {
        return;
    }

    let out_path = "/tmp/xv6_framebuffer.ppm";
    let mut data = Vec::with_capacity(total * 3 + 32);

    // PPM P6 header
    data.extend_from_slice(format!("P6\n{} {}\n255\n", FB_WIDTH, FB_HEIGHT).as_bytes());

    // Pixel data: RGBA -> RGB (drop alpha)
    for &pixel in pixels.iter() {
        let r = ((pixel >> 24) & 0xFF) as u8;
        let g = ((pixel >> 16) & 0xFF) as u8;
        let b = ((pixel >> 8) & 0xFF) as u8;
        data.push(r);
        data.push(g);
        data.push(b);
    }

    match std::fs::write(out_path, &data) {
        Ok(_) => eprintln!("Framebuffer saved to {}", out_path),
        Err(e) => eprintln!("Failed to save framebuffer: {}", e),
    }
}
