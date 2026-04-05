use pixels_move_pixels::assembler::{self, op, Program};
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::vm::vm_state;

fn main() {
    // Build the program manually to be absolutely sure what we get
    let mut f0 = Program::new();
    f0.ldi(1, 2);      // r1 = 2
    f0.frame(1);        // FRAME r1 (jump to frame r1=2)
    f0.halt();

    let mut f1 = Program::new();
    f1.ldi(0, 99);
    f1.halt();

    let mut f2 = Program::new();
    f2.ldi(0, 42);
    f2.halt();

    let mut f3 = Program::new();
    f3.ldi(0, 0);
    f3.halt();

    let frames = vec![f0, f1, f2, f3];

    // Disassemble each frame
    for (i, frame) in frames.iter().enumerate() {
        println!("Frame {} ({} pixels):", i, frame.pixels.len());
        let mut pc = 0usize;
        while pc < frame.pixels.len() {
            let pixel = frame.pixels[pc];
            let opcode = (pixel & 0xFF) as u8;
            let stratum = ((pixel >> 8) & 0xFF) as u8;
            let p1 = ((pixel >> 16) & 0xFF) as u8;
            let p2 = ((pixel >> 24) & 0xFF) as u8;
            let disasm = match opcode {
                op::LDI => {
                    let data = if pc + 1 < frame.pixels.len() { frame.pixels[pc+1] } else { 0 };
                    pc += 1; // extra pixel for data
                    format!("LDI r{}, {}", p1, data)
                }
                op::HALT => "HALT".into(),
                op::FRAME => format!("FRAME r{}", p1),
                _ => format!("??? op={} raw=0x{:08X}", opcode, pixel),
            };
            println!("  [{:3}] {}", pc, disasm);
            pc += 1;
        }
    }

    // Load into SoftwareVm
    let mut svm = SoftwareVm::new();
    let base: u32 = 0x10000;
    let frame_size: u32 = 65536;

    for (i, frame) in frames.iter().enumerate() {
        let addr = base + (i as u32) * frame_size;
        svm.load_program(addr, &frame.pixels);
    }

    svm.spawn_vm(0, base);
    let vm = svm.vm_state_mut(0);
    vm.attention_mask = 0;
    vm.frame_count = 4;

    println!();
    println!("Initial: PC=0x{:08X} fp={} entry=0x{:08X} fc={}", 
        svm.vm_state(0).pc, svm.vm_state(0).attention_mask, 
        svm.vm_state(0).entry_point, svm.vm_state(0).frame_count);

    // Expected FRAME math: entry_point=0x10000, target=2
    // PC should become 0x10000 + 2 * 65536 = 0x30000
    println!("Expected: FRAME r1 with r1=2 -> PC = 0x10000 + 2*65536 = 0x{:08X}", 
        0x10000u32 + 2 * 65536);

    // Execute one frame
    svm.execute_frame();

    let vm = svm.vm_state(0);
    println!();
    println!("After execute_frame:");
    println!("  PC=0x{:08X}  fp={}  halted={}  state={}", 
        vm.pc, vm.attention_mask, vm.halted, vm.state);
    println!("  r0={}  r1={}", vm.regs[0], vm.regs[1]);
    println!("  cycles={}", vm.cycles);

    // Check what address range the PC is in
    let frame_idx = (vm.pc - vm.entry_point) / frame_size;
    let offset_in_frame = (vm.pc - vm.entry_point) % frame_size;
    println!("  Calculated frame from PC: {} (offset {} within frame)", frame_idx, offset_in_frame);
}
