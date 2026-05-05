// Trace render() execution
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = "examples/riscv-hello/hexedit.elf";
    let elf_data = std::fs::read(elf_path).expect("read elf");

    let mut vm = RiscvVm::new(1024 * 1024);

    // Boot with enough steps to get past fb_init and into c_start before render call
    // c_start starts at 0x8000059C, render is called at 0x8000063C
    // Let's step until we hit the jal render instruction
    let boot = vm.boot_guest(&elf_data, 1, 200_000).expect("boot");
    eprintln!("After 200K boot: pc=0x{:08X}", vm.cpu.pc);
    
    // Step until we reach the render call or go out of range
    let mut step = 0u64;
    loop {
        let pc = vm.cpu.pc;
        if pc == 0x8000063C {
            eprintln!("Reached render() call at step {} (total: {})", step, step + 200000);
            eprintln!("  ra=0x{:08X} sp=0x{:08X}", vm.cpu.x[1], vm.cpu.x[2]);
            eprintln!("  a0=0x{:08X} (should be 0x101010FF for COL_BG? or 0 for render args)", vm.cpu.x[10]);
            break;
        }
        if pc < 0x80000000 || pc >= 0x80002000 {
            eprintln!("PC out of range BEFORE render: 0x{:08X} at step {}", pc, step + 200000);
            eprintln!("  ra=0x{:08X} sp=0x{:08X}", vm.cpu.x[1], vm.cpu.x[2]);
            break;
        }
        vm.step();
        step += 1;
        if step > 2_000_000 {
            eprintln!("Timeout at PC=0x{:08X}", vm.cpu.pc);
            break;
        }
    }
    
    if vm.cpu.pc == 0x8000063C {
        // Now step into render and trace
        eprintln!("\n--- Stepping into render() ---");
        let mut last_pcs: Vec<u32> = Vec::new();
        for i in 0..2_000_000 {
            let prev_pc = vm.cpu.pc;
            vm.step();
            let pc = vm.cpu.pc;
            
            // Track PC
            last_pcs.push(prev_pc);
            if last_pcs.len() > 10 {
                last_pcs.remove(0);
            }
            
            if pc < 0x80000000 || pc >= 0x80002000 {
                eprintln!("PC went invalid at render step {}", i);
                eprintln!("  bad_pc=0x{:08X}", pc);
                eprintln!("  prev_pc=0x{:08X}", prev_pc);
                eprintln!("  last 10 PCs: {:08X?}", last_pcs);
                eprintln!("  ra=0x{:08X} sp=0x{:08X}", vm.cpu.x[1], vm.cpu.x[2]);
                eprintln!("  t0=0x{:08X} t1=0x{:08X} t2=0x{:08X}", 
                    vm.cpu.x[5], vm.cpu.x[6], vm.cpu.x[7]);
                break;
            }
        }
        if vm.cpu.pc >= 0x80000000 && vm.cpu.pc < 0x80002000 {
            eprintln!("Render completed 2M steps, PC=0x{:08X}", vm.cpu.pc);
        }
    }
}
