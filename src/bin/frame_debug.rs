
// Minimal FRAME opcode debug test
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::vm::vm_state;

fn main() {
    // Assemble the same program we sent to the daemon:
    // Frame 0: LDI r1, 2; FRAME r1; HALT
    // Frame 1: LDI r0, 99; HALT
    // Frame 2: LDI r0, 42; HALT
    // Frame 3: LDI r0, 0; HALT
    let source = r#"
LDI r1, 2
FRAME r1
HALT
---
LDI r0, 99
HALT
---
LDI r0, 42
HALT
---
LDI r0, 0
HALT
"#;

    let programs = gasm::assemble_filmstrip(source).expect("assembly failed");
    println!("Assembled {} frames", programs.len());
    for (i, p) in programs.iter().enumerate() {
        println!("  Frame {}: {} pixels", i, p.pixels.len());
        // Print first 10 pixels of each frame (disassemble)
        for (j, &pixel) in p.pixels.iter().take(10).enumerate() {
            let opcode = (pixel >> 24) & 0xFF;
            let stratum = (pixel >> 16) & 0xFF;
            let p1 = (pixel >> 8) & 0xFF;
            let p2 = pixel & 0xFF;
            println!("    [{:3}] opcode={:3} p1=r{} p2=r{}  raw=0x{:08X}", j, opcode, p1, p2, pixel);
        }
    }

    // Now test using the software VM directly
    let mut svm = SoftwareVm::new();

    // Load each frame into its own 64k segment
    let base_addr: u32 = 0x10000;
    let frame_size: u32 = 256 * 256; // 65536

    for (i, p) in programs.iter().enumerate() {
        let addr = base_addr + (i as u32) * frame_size;
        svm.load_program(addr, &p.pixels);
        println!("Loaded frame {} at address 0x{:08X} ({} pixels)", i, addr, p.pixels.len());
    }

    // Spawn VM 0 at frame 0
    svm.spawn_vm(0, base_addr);
    let vm = svm.vm_state_mut(0);
    vm.attention_mask = 0; // frame_ptr = 0
    vm.frame_count = programs.len() as u32;

    println!();
    println!("Initial state: PC=0x{:08X} frame_ptr={} frame_count={}", 
        svm.vm_state(0).pc, svm.vm_state(0).attention_mask, svm.vm_state(0).frame_count);
    println!("entry_point=0x{:08X}", svm.vm_state(0).entry_point);

    // Step through execution
    println!();
    println!("=== Stepping through VM execution ===");
    for step in 0..20 {
        let vm = svm.vm_state(0);
        let state = vm.state;
        let halted = vm.halted;
        let pc = vm.pc;
        let fp = vm.attention_mask;
        let r0 = vm.regs[0];
        let r1 = vm.regs[1];

        if halted != 0 || state == vm_state::HALTED || state == vm_state::INACTIVE {
            println!("[Step {:2}] HALTED  PC=0x{:08X}  fp={}  r0={}  r1={}", step, pc, fp, r0, r1);
            break;
        }

        // Read the current instruction
        let pixel = svm.peek(pc);
        let opcode = (pixel >> 24) & 0xFF;
        let p1 = ((pixel >> 8) & 0xFF) as usize;
        let p2 = (pixel & 0xFF) as usize;
        let mnemonic = match opcode {
            1 => format!("LDI r{}, ???", p1),
            13 => "HALT".into(),
            27 => format!("FRAME r{}", p1),
            _ => format!("op({})", opcode),
        };

        println!("[Step {:2}] PC=0x{:08X} fp={}  r0={:<5} r1={:<5}  => {}", step, pc, fp, r0, r1, mnemonic);

        svm.execute_frame();

        let vm_after = svm.vm_state(0);
        println!("         => PC=0x{:08X} fp={}  r0={:<5} r1={}  halted={}", 
            vm_after.pc, vm_after.attention_mask, vm_after.regs[0], vm_after.regs[1], vm_after.halted);
        println!();

        if vm_after.halted != 0 && vm_after.attention_mask >= programs.len() as u32 - 1 {
            // Fully halted at last frame
            break;
        }
    }
}
