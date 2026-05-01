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

        let r31_before = vm.regs[31];
        if !vm.step() { 
            eprintln!("HALTED at step {}", step);
            break; 
        }
        let r31_after = vm.regs[31];

        // Log ALL CALL/RET/PUSH r31/POP r31
        if op == 0x33 || op == 0x34 || (op == 0x60 && vm.ram[(pc+1) as usize] == 31) || (op == 0x61 && vm.ram[(pc+1) as usize] == 31) {
            let (d, s) = vm.disassemble_at(pc);
            let sz = s;
            if op == 0x33 {
                eprintln!("step={:4} CALL @ {} -> {} r31: {:#x} -> {:#x} [{}]", 
                    step, pc, pc + sz as u32, r31_before, r31_after, d);
            } else if op == 0x34 {
                eprintln!("step={:4} RET @ {} -> {:#x} [{}]", step, pc, r31_after, d);
            } else if op == 0x60 {
                eprintln!("step={:4} PUSH r31 @ {} r31_before={:#x} [{}]", step, pc, r31_before, d);
            } else if op == 0x61 {
                eprintln!("step={:4} POP r31 @ {} r31: {:#x} -> {:#x} [{}]", 
                    step, pc, r31_before, r31_after, d);
            }
        }
    }
}
