use geometry_os::riscv::cpu::Privilege;
use geometry_os::riscv::loader;
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let mut vm = RiscvVm::new(32 * 1024 * 1024); // 32MB
    let kern_data = fs::read("examples/riscv-hello/geos_kern.elf").expect("Failed to read kernel");
    let info = loader::load_elf(&mut vm.bus, &kern_data).expect("Failed to load kernel");
    
    vm.cpu.pc = info.entry;
    vm.cpu.privilege = Privilege::Machine;
    
    for i in 0..10000 {
        let pc = vm.cpu.pc;
        if pc == 0x80000386 || pc == 0x8000038c {
             println!("Step {}: Context switch logic. t1={}, t2=0x{:08x}", i, vm.cpu.x[6], vm.cpu.x[7]);
        }
        let res = vm.step();
        
        if pc == 0x80000386 || pc == 0x8000038c {
             println!("Step {}: After switch. tp=0x{:08x}", i, vm.cpu.x[4]);
        }

        use geometry_os::riscv::cpu::StepResult;
        if matches!(res, StepResult::Shutdown | StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault) {
            println!("VM stop at step {} PC 0x{:08X}: {:?}", i, pc, res);
            break;
        }
    }
}
