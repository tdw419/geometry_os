
// kern_diag5.rs -- track PC at each context switch
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 { eprintln!("Usage: kern_diag5 <elf>"); return; }

    let elf_data = std::fs::read(&args[1]).unwrap();
    let ram_mb = 2u64 * 1024 * 1024;
    let mut vm = geometry_os::riscv::RiscvVm::new(ram_mb);

    match vm.load_auto(&elf_data) {
        Ok(info) => {
            println!("[DIAG] Loaded: entry=0x{:08X}, size={}", info.entry, elf_data.len());
        }
        Err(e) => {
            println!("[DIAG] Load error: {:?}", e);
            return;
        }
    }

    vm.cpu.csr.mepc = vm.load_info.as_ref().unwrap().entry;
    vm.cpu.csr.mstatus = (1u32 << 3) | (1u32 << 7) | (1u32 << 11) | (1u32 << 12);
    let _ = vm.cpu.csr.trap_return(geometry_os::riscv::cpu::Privilege::Machine);
    vm.cpu.pc = vm.cpu.csr.mepc;
    vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Machine;

    let max_instr = 10_000_000u64;
    let check_interval = 500_000u64;
    let mut last_mepc: u32 = vm.cpu.csr.mepc;
    let mut timer_fires = 0u64;
    let mut ctx_switches = 0;

    for i in 0..max_instr {
        let pc_before = vm.cpu.pc;
        let _ = vm.step();
        let pc_after = vm.cpu.pc;

        // Detect timer fires by checking mepc changes
        if vm.cpu.csr.mepc != last_mepc {
            timer_fires += 1;
            let mepc = vm.cpu.csr.mepc;
            if mepc != 0x80000340 {
                ctx_switches += 1;
                if ctx_switches <= 20 {
                    println!("[CTX-SWITCH #{}] instr={}: mepc=0x{:08X} pc=0x{:08X} tp=0x{:08X}",
                        ctx_switches, i, mepc, pc_after, vm.cpu.x[4]);
                }
            }
            last_mepc = vm.cpu.csr.mepc;
        }

        if i > 0 && i % check_interval == 0 {
            let mip = vm.cpu.csr.mip;
            println!("[DIAG] {} instr: pc=0x{:08X} timer_fires={} ctx_switches={} mip=0x{:08X}",
                i, vm.cpu.pc, timer_fires, ctx_switches, mip);
        }
    }

    println!("\n[FINAL] pc=0x{:08X} timer_fires={} ctx_switches={}",
        vm.cpu.pc, timer_fires, ctx_switches);
    println!("[FINAL] sscratch=0x{:08X} mtvec=0x{:08X} mepc=0x{:08X}",
        vm.cpu.csr.sscratch, vm.cpu.csr.mtvec, vm.cpu.csr.mepc);
    println!("[FINAL] sp=0x{:08X} ra=0x{:08X} tp=0x{:08X}",
        vm.cpu.x[2], vm.cpu.x[1], vm.cpu.x[4]);
}
