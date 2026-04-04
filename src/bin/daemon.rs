// Headless GPU Dispatch Daemon
//
// Initializes GPU without a surface (headless), compiles the
// glyph_vm_scheduler.wgsl compute shader, uploads the self-replicator
// program to the 4096x4096 RAM texture, dispatches one frame of compute,
// reads back results, and verifies the copy at address 100.
//
// Also loads the font atlas and runs hello_world to verify text rendering.
// Produces comprehensive PNG visualizations.
//
// Usage: cargo run --bin daemon

use pixels_move_pixels::{assembler, font_atlas, software_vm::SoftwareVm, visualization, vm::GlyphVm};

fn main() {
    env_logger::init();

    println!("headless gpu dispatch daemon");
    println!("============================");
    println!();

    // Step 1: Headless wgpu device init (no surface)
    println!("[1/6] Initializing headless GPU device...");
    let mut vm = GlyphVm::new();
    println!("      OK - GPU device ready");

    // Step 2: Compile glyph_vm_scheduler.wgsl (done inside GlyphVm::new)
    println!("[2/6] Compute shader compiled (glyph_vm_scheduler.wgsl)");

    // Step 3: Load font atlas into substrate
    println!("[3/6] Loading font atlas into substrate at 0x{:08X}...", font_atlas::FONT_BASE);
    font_atlas::load_into_substrate(vm.substrate());
    println!("      OK - {} characters loaded", font_atlas::FONT_CHARS);

    // Step 3b: Build bold atlas using software VM
    println!("[3b/7] Building bold font atlas via software VM...");
    let atlas_program = assembler::bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0x1000, &atlas_program.pixels);
    svm.spawn_vm(0, 0x1000);
    // Run atlas builder to completion
    let max_frames = 2000;
    for frame in 0..max_frames {
        if svm.vm_state(0).halted != 0 {
            println!(
                "      Atlas builder halted after {} frames ({} cycles)",
                frame, svm.vm_state(0).cycles
            );
            break;
        }
        svm.execute_frame();
    }
    // Verify derived atlas at 0x00F10000
    let derived_base: u32 = 0x00F10000;
    let mut atlas_ok = true;
    for ascii in [65u32, 72, 90].iter() {
        // A, H, Z
        let row0 = svm.peek(derived_base + ascii * 8);
        if row0 == 0 {
            eprintln!(
                "  WARNING: derived atlas char '{}' row 0 is empty at 0x{:08X}",
                *ascii as u8 as char, derived_base + ascii * 8
            );
            atlas_ok = false;
        }
    }
    if atlas_ok {
        println!("      OK - bold atlas verified at 0x{:08X}", derived_base);
        // Copy derived atlas from software VM into GPU substrate
        for addr in derived_base..(derived_base + 128 * 8) {
            vm.substrate().poke(addr, svm.peek(addr));
        }
        println!("      OK - bold atlas copied to GPU substrate");
    } else {
        eprintln!("      WARNING: bold atlas verification failed (base font still available)");
    }

    // Step 4: Upload self-replicator and execute
    let program = assembler::self_replicator();
    println!(
        "[4/6] Uploading {}-pixel self-replicator to RAM texture...",
        program.len()
    );
    vm.substrate().load_program(0, &program.pixels);
    println!("      OK - program loaded at Hilbert address 0");

    println!("      Spawning VM 0 and dispatching compute...");
    vm.spawn_vm(0, 0);
    vm.execute_frame();
    println!("      OK - frame dispatched and read back");

    // Step 5: Verify self-replication
    println!("[5/6] Verifying self-replication (addr 0 -> addr 100)...");
    let mut matched = 0;
    for i in 0..18 {
        let src = vm.substrate().peek(i);
        let dst = vm.substrate().peek(100 + i);
        if src == dst {
            matched += 1;
        } else {
            eprintln!(
                "  MISMATCH addr {}: expected 0x{:08X}, got 0x{:08X}",
                100 + i,
                src,
                dst
            );
        }
    }

    if matched == 18 {
        println!();
        println!("  VERIFIED: 18/18 pixels replicated on GPU.");
        println!();
    } else {
        eprintln!("FAIL: only {}/18 pixels matched", matched);
        std::process::exit(1);
    }

    // Step 6: Produce comprehensive visualizations
    println!("[6/6] Rendering visualizations...");
    visualization::render_substrate_overview(
        vm.substrate(),
        "daemon",
        &[(0, 18), (100, 18)],           // program regions: source + copy
        &[],                              // no text regions from self-replicator
    );
    println!("      OK - wrote daemon_overview.png, daemon_program0.png, daemon_program1.png, daemon_font_atlas.png");

    // Also render the classic Hilbert view and side-by-side comparison
    vm.substrate()
        .render_hilbert_png(0, 120, 512, "daemon_hilbert_view.png");
    visualization::render_comparison_png(vm.substrate(), 0, 100, 18, "daemon_comparison.png");

    // Render the font atlas as a readable grid
    visualization::render_font_atlas_png(vm.substrate(), "daemon_font_atlas.png");
    println!("      OK - wrote daemon_hilbert_view.png, daemon_comparison.png");

    // Now run hello_world on a fresh VM to show text rendering
    println!();
    println!("[bonus] Running hello_world program for text visualization...");
    let hello = assembler::hello_world();
    vm.reset();
    font_atlas::load_into_substrate(vm.substrate());
    vm.substrate().load_program(0, &hello.pixels);
    vm.spawn_vm(0, 0);
    vm.execute_frame();

    // Render the text output: hello_world writes to address 5000, 5 chars
    visualization::render_text_png(vm.substrate(), 5000, 5, 4, "daemon_hello_text.png");
    println!("      OK - wrote daemon_hello_text.png (5 chars at 4x scale)");

    // Full overview with text region
    visualization::render_substrate_overview(
        vm.substrate(),
        "daemon_hello",
        &[(0, hello.pixels.len() as u32)],
        &[(5000, 5, 4)],  // text region: 5 chars at addr 5000, rendered at 4x
    );
    println!("      OK - wrote daemon_hello_overview.png and daemon_hello_text.png");

    println!();
    println!("  Daemon dispatch complete. Pixels moved pixels.");
    println!();
}
