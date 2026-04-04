// Pixels Move Pixels
//
// The GPU is the computer. A texture IS memory. Each pixel IS an instruction.
// Programs read from the texture, execute, and write back to the texture.
// Programs write programs. Pixels move pixels.

use pixels_move_pixels::{assembler, vm::GlyphVm};

fn main() {
    env_logger::init();

    println!("pixels move pixels");
    println!("==================");
    println!();

    // Initialize GPU
    println!("[boot] Initializing GPU...");
    let mut vm = GlyphVm::new();

    // Load the self-replicating program
    let program = assembler::self_replicator();
    println!("[boot] Loading {}-pixel self-replicator...", program.len());
    vm.substrate().load_program(0, &program.pixels);

    // Spawn VM 0 at address 0
    vm.spawn_vm(0, 0);

    // Execute one frame
    println!("[run]  Executing...");
    vm.execute_frame();

    // Verify
    println!("[verify] Checking self-replication (addr 0 -> addr 100)...");
    let mut matched = 0;
    for i in 0..18 {
        let src = vm.substrate().peek(i);
        let dst = vm.substrate().peek(100 + i);
        if src == dst {
            matched += 1;
        } else {
            println!("  MISMATCH addr {}: 0x{:08X} != 0x{:08X}", i, src, dst);
        }
    }

    if matched == 18 {
        println!();
        println!("  PIXELS MOVED PIXELS.");
        println!("  {} glyphs copied themselves on GPU.", program.len());
        println!("  No Python. No CPU. Just light.");
        println!();
    } else {
        println!("[FAIL] Only {}/18 pixels matched", matched);
    }

    // Render visual snapshot
    vm.substrate().render_png(32, 4, 0, "substrate.png");
    vm.substrate().render_png(32, 4, 100, "substrate_copy.png");
    println!("[render] Wrote substrate.png and substrate_copy.png");

    // Hilbert curve visualization: see programs as colored regions on the 2D texture
    // Show addresses 0-119 (original + copy, addresses cluster due to Hilbert locality)
    vm.substrate().render_hilbert_png(0, 120, 512, "hilbert_view.png");
    println!("[render] Wrote hilbert_view.png (Hilbert curve view of addr 0-119)");
}
