// Minimal Linux boot diagnostic - stop when PC goes low
use geometry_os::riscv::{cpu, RiscvVm};
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    let bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8";
    let (mut vm, _fw_addr, _entry, _dtb_addr) =
        RiscvVm::boot_linux_setup(&kernel_data, None, 512, bootargs).expect("boot failed");

    eprintln!("Starting boot, watching for PC corruption...");

    let mut count: u64 = 0;
    let mut last_pc = vm.cpu.pc;

    while count < 20_000_000 {
        let pc_before = vm.cpu.pc;
        let step_result = vm.step();

        // Check for PC corruption (kernel should stay at high addresses)
        if vm.cpu.privilege == cpu::Privilege::Supervisor
            && (pc_before < 0x80000000 || pc_before > 0xFFFFFFFF)
        {
            eprintln!(
                "[CORRUPTION] count={} PC dropped from 0x{:08X} to 0x{:08X}",
                count, last_pc, pc_before
            );
            eprintln!(
                "  mepc=0x{:08X} sepc=0x{:08X} mcause=0x{:08X} scause=0x{:08X}",
                vm.cpu.csr.mepc, vm.cpu.csr.sepc, vm.cpu.csr.mcause, vm.cpu.csr.scause
            );
            eprintln!(
                "  mstatus=0x{:08X} satp=0x{:08X} stvec=0x{:08X}",
                vm.cpu.csr.mstatus, vm.cpu.csr.satp, vm.cpu.csr.stvec
            );
            eprintln!(
                "  x1(ra)=0x{:08X} x2(sp)=0x{:08X}",
                vm.cpu.x[1], vm.cpu.x[2]
            );
            eprintln!("  Last step result: {:?}", step_result);

            // Show last few instructions
            // TODO: Add instruction history tracking
            break;
        }

        last_pc = pc_before;

        match step_result {
            cpu::StepResult::Shutdown | cpu::StepResult::Ebreak => break,
            cpu::StepResult::FetchFault
            | cpu::StepResult::LoadFault
            | cpu::StepResult::StoreFault => {
                // Continue after fault, PC should be at trap handler
            },
            _ => {},
        }

        count += 1;
    }

    eprintln!("Boot stopped at count={}", count);
}
