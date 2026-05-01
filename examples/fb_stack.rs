use geometry_os::assembler::assemble;
use geometry_os::vm::Vm;

fn main() {
    let source = std::fs::read_to_string("programs/file_browser.asm").unwrap();
    let asm = assemble(&source, 0).unwrap();

    let mut vm = Vm::new();
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() { vm.ram[i] = word; }
    }

    vm.pc = 0; vm.halted = false;

    for step in 0..600u64 {
        let pc = vm.pc;
        let op = vm.ram[pc as usize];
        let sp_before = vm.regs[30];

        if !vm.step() { break; }

        // Track PUSH/POP and stack operations
        if op == 0x60 {
            let sp_after = vm.regs[30];
            let rd = vm.ram[(pc+1) as usize];
            eprintln!("step={:4} PUSH r{} @ {} sp: {:#x} -> {:#x} (wrote {:#x} to [{:#x}])", 
                step, rd, pc, sp_before, sp_after, vm.regs[rd as usize], sp_after);
        } else if op == 0x61 {
            let rd = vm.ram[(pc+1) as usize];
            eprintln!("step={:4} POP r{} @ {} sp: {:#x} -> {:#x} (read {:#x} from [{:#x}])", 
                step, rd, pc, sp_before, vm.regs[30], vm.regs[rd as usize], sp_before);
        }
    }
}
