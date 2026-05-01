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

    vm.pc = 0; vm.halted = false;

    // Run until first FRAME, tracking all PCs
    let mut prev_pc = 0u32;
    let mut frame_count = 0u32;
    let mut pc_log: Vec<(u64, u32, u32)> = Vec::new();

    for step in 0..5_000_000u64 {
        let pc = vm.pc;
        let op = vm.ram[pc as usize];

        // Detect PC going backwards (to init section 0-149)
        if step > 100 && pc < 150 && prev_pc >= 150 {
            eprintln!("\n*** PC BACKWARD at step {}: {} -> {} (op={:#x}) ***", step, prev_pc, pc, op);
            // Show 5 instructions around the backward-jump source
            eprintln!("  Context around source:");
            let mut a = if prev_pc > 10 { prev_pc - 10 } else { 0 };
            let end = if prev_pc + 10 < vm.ram.len() as u32 { prev_pc + 10 } else { vm.ram.len() as u32 };
            while a < end {
                let (d, s) = vm.disassemble_at(a);
                let marker = if a == prev_pc { ">>>" } else if a == pc { " <<<<" } else { "" };
                eprintln!("  {:4}: {:#06x} {} ({}){}", a, vm.ram[a as usize], d, s, marker);
                if s == 0 { break; }
                a += s as u32;
            }
            break;
        }

        // Detect PC going below 32 (init section)
        if step > 100 && pc < 32 {
            eprintln!("\n*** PC IN INIT at step {}: pc={} op={:#x} ***", step, pc, op);
            eprintln!("  prev_pc={}, r31={}", prev_pc, vm.regs[31]);
            // Show disasm around current PC
            let mut a = if pc > 5 { pc - 5 } else { 0 };
            let end = pc + 15;
            while a < end {
                let (d, s) = vm.disassemble_at(a);
                let marker = if a == pc { ">>>" } else { "" };
                eprintln!("  {:4}: {:#06x} {} ({}){}", a, vm.ram[a as usize], d, s, marker);
                if s == 0 { break; }
                a += s as u32;
            }
            break;
        }

        prev_pc = pc;

        if !vm.step() { eprintln!("HALTED at step {}", step); break; }

        if op == 0x02 {
            frame_count += 1;
            if frame_count <= 1 {
                eprintln!("FRAME #{} at step={} pc={}", frame_count, step, pc);
            }
        }
    }
}
