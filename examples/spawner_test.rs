// spawner_test.rs -- Test for dynamic process spawning in geos_kern.elf
use geometry_os::riscv::cpu::Privilege;
use geometry_os::riscv::loader;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let elf_path = "examples/riscv-hello/geos_kern.elf";
    let elf = fs::read(elf_path).expect("read geos_kern.elf");

    // 2MB RAM
    let mut vm = RiscvVm::new(2 * 1024 * 1024);

    // Boot the kernel
    let load_info = loader::load_auto(&mut vm.bus, &elf, 0x8000_0000).expect("load elf");
    vm.cpu.pc = load_info.entry;
    vm.cpu.privilege = Privilege::Machine;

    println!(
        "[test] kernel loaded at 0x{:08X}, running for 5M instructions...",
        load_info.entry
    );

    // Run for 5M instructions to let kernel boot and start Guest A
    for _ in 0..5_000_000 {
        vm.step();
    }

    println!("[test] injecting 'S' to spawn Guest B...");
    vm.bus.uart.receive_byte(b'S');

    // Run for another 10M instructions to allow spawn and switch
    println!("[test] running for 10M instructions...");
    for _ in 0..10_000_000 {
        vm.step();
    }

    println!("[test] injecting 'K' to kill Guest B...");
    vm.bus.uart.receive_byte(b'K');

    // Run for another 5M instructions
    println!("[test] running for 5M instructions...");
    for _ in 0..5_000_000 {
        vm.step();
    }

    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    println!("--- console output ---");
    println!("{}", s);

    // Verification
    let mut passed = true;
    if s.contains("[spawner] spawned id=1") {
        println!("[test] PASS: Guest B spawned successfully");
    } else {
        println!("[test] FAIL: Guest B spawn message not found");
        passed = false;
    }

    if s.contains("[spawner] killed") {
        println!("[test] PASS: Guest B killed successfully");
    } else {
        println!("[test] FAIL: Guest B kill message not found");
        passed = false;
    }

    if !passed {
        std::process::exit(1);
    }
}
