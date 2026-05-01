use geometry_os::assembler::assemble;
use geometry_os::vm::Vm;

fn main() {
    let source = std::fs::read_to_string("programs/file_browser.asm").unwrap();
    let asm = assemble(&source, 0).unwrap();
    eprintln!("Bytecode size: {} words", asm.pixels.len());

    let mut vm = Vm::new();
    for (i, &word) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() { vm.ram[i] = word; }
    }

    // Disassemble 0-10
    eprintln!("\n=== Init (0-10) ===");
    let mut a: u32 = 0;
    while a < 10 {
        let (d, s) = vm.disassemble_at(a);
        eprintln!("  {:4}: {:#06x} {} ({})", a, vm.ram[a as usize], d, s);
        if s == 0 { break; }
        a += s as u32;
    }

    // Disassemble around JMP target 150
    eprintln!("\n=== Around offset 145-165 ===");
    a = 145;
    while a < 165 {
        let (d, s) = vm.disassemble_at(a);
        eprintln!("  {:4}: {:#06x} {} ({})", a, vm.ram[a as usize], d, s);
        if s == 0 { break; }
        a += s as u32;
    }

    // Show all JMP/CALL/RET
    eprintln!("\n=== Branches ===");
    for i in 0..asm.pixels.len() {
        if asm.pixels[i] == 0x30 {
            eprintln!("  JMP @ {} -> {}", i, asm.pixels[i+1]);
        }
        if asm.pixels[i] == 0x33 {
            eprintln!("  CALL @ {} -> {}", i, asm.pixels[i+1]);
        }
        if asm.pixels[i] == 0x34 {
            eprintln!("  RET @ {}", i);
        }
    }

    // Run 1 frame, show instructions after FRAME
    vm.pc = 0; vm.halted = false;
    for step in 0..5_000_000u64 {
        let pc = vm.pc;
        let op = vm.ram[pc as usize];
        if !vm.step() { eprintln!("HALTED at step {}", step); break; }
        if op == 0x02 {
            eprintln!("\nFRAME at step={} pc={}", step, pc);
            for j in 0..15 {
                let (d, s) = vm.disassemble_at(vm.pc);
                eprintln!("  +{}: pc={:#04x} {} ({})", j, vm.pc, d, s);
                if s == 0 { break; }
                if !vm.step() { break; }
            }
            break;
        }
    }
}
