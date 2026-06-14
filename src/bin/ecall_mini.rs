// Minimal test: execute ECALL from S-mode with SBI_CONSOLE_PUTCHAR
use geometry_os::riscv::cpu::Privilege;
use geometry_os::riscv::RiscvVm;

fn main() {
    // Build RV32 machine code: just ecall
    // ecall = 0x00000073
    let code = vec![
        0x73u8, 0x00, 0x00, 0x00, // ecall
    ];

    let mut vm = RiscvVm::new(65536);
    vm.cpu.pc = 0x8000_0000;
    vm.cpu.privilege = Privilege::Supervisor;
    // Set a7 = 1 (SBI_CONSOLE_PUTCHAR), a0 = 'H' (0x48)
    vm.cpu.x[17] = 1; // a7 = SBI_CONSOLE_PUTCHAR
    vm.cpu.x[10] = 0x48; // a0 = 'H'

    // Write ecall at PC
    for (i, &b) in code.iter().enumerate() {
        vm.bus.write_byte(0x8000_0000 + i as u64, b).ok();
    }

    eprintln!("=== S-mode ECALL test (SBI_CONSOLE_PUTCHAR 'H') ===");
    eprintln!("Before: ecall_count={}", vm.cpu.ecall_count);
    eprintln!("PC=0x{:08X}, privilege={:?}", vm.cpu.pc, vm.cpu.privilege);
    eprintln!("a7=0x{:X}, a0=0x{:X}", vm.cpu.x[17], vm.cpu.x[10]);

    let result = vm.step();

    eprintln!("After step: result={:?}", result);
    eprintln!("ecall_count={}", vm.cpu.ecall_count);
    eprintln!("PC=0x{:08X}, privilege={:?}", vm.cpu.pc, vm.cpu.privilege);
    eprintln!("SBI ecall_log len={}", vm.bus.sbi.ecall_log.len());
    eprintln!("SBI console_output len={}", vm.bus.sbi.console_output.len());

    if vm.bus.sbi.ecall_log.len() > 0 {
        eprintln!(
            "SBI ecall: eid=0x{:X} fid=0x{:X} a0=0x{:X}",
            vm.bus.sbi.ecall_log[0].0, vm.bus.sbi.ecall_log[0].1, vm.bus.sbi.ecall_log[0].2
        );
    }
    if vm.bus.sbi.console_output.len() > 0 {
        let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
        eprintln!("SBI console: {:?}", s);
    }
}
