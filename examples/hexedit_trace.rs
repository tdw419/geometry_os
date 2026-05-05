// Trace hexedit execution to find where PC goes invalid
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = "examples/riscv-hello/hexedit.elf";
    let elf_data = std::fs::read(elf_path).expect("read elf");

    let mut vm = RiscvVm::new(1024 * 1024);

    // Load ELF manually so we can control boot
    let boot = vm.boot_guest(&elf_data, 1, 300_000).expect("boot");
    eprintln!("After 300K: pc=0x{:08X}", vm.cpu.pc);

    // Step until PC goes out of code range or we hit 2M steps
    let code_start = 0x80000000u32;
    let code_end = 0x80002000u32; // well past .text section
    let mut last_good_pc = vm.cpu.pc;
    let mut step = 0u64;
    
    loop {
        let prev_pc = vm.cpu.pc;
        let result = vm.step();
        step += 1;
        
        if step % 100000 == 0 {
            eprintln!("  step {}: pc=0x{:08X}", step + 300000, vm.cpu.pc);
        }
        
        let pc = vm.cpu.pc;
        if pc < code_start || pc >= code_end {
            eprintln!("\nPC went out of range!");
            eprintln!("  step: {} (total: {})", step, step + 300000);
            eprintln!("  prev_pc: 0x{:08X}", prev_pc);
            eprintln!("  bad_pc: 0x{:08X}", pc);
            eprintln!("  last_good_pc: 0x{:08X}", last_good_pc);
            
            // Show context around last good PC
            eprintln!("\n  Last few PCs before jump:");
            // We already printed prev_pc. Let's also check the registers
            eprintln!("  ra=0x{:08X} sp=0x{:08X}", vm.cpu.x[1], vm.cpu.x[2]);
            
            break;
        }
        
        if step > 5_000_000 {
            eprintln!("Reached 5M steps, PC still in range: 0x{:08X}", pc);
            break;
        }
        
        last_good_pc = pc;
    }
}
