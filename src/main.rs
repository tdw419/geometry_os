// Pixels Move Pixels
//
// The GPU is the computer. A texture IS memory. Each pixel IS an instruction.
// Programs read from the texture, execute, and write back to the texture.
// Programs write programs. Pixels move pixels.

use pixels_move_pixels::{
    assembler,
    software_vm::SoftwareVm,
    substrate::Substrate,
    vm::GlyphVm,
    visualization,
};

fn main() {
    env_logger::init();

    println!("pixels move pixels");
    println!("==================");
    println!();

    // ─── GPU VM: Self-replicator ───
    println!("[boot] Initializing GPU...");
    let mut vm = GlyphVm::new();

    let program = assembler::self_replicator();
    println!("[boot] Loading {}-pixel self-replicator...", program.len());
    vm.substrate().load_program(0, &program.pixels);
    vm.spawn_vm(0, 0);

    println!("[run]  Executing self-replicator...");
    vm.execute_frame();

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
        println!("  PIXELS MOVED PIXELS. 18/18 glyphs replicated on GPU.");
    } else {
        println!("[FAIL] Only {}/18 pixels matched", matched);
    }

    // ─── Software VM: Hello World (text output) ───
    println!();
    println!("[text] Running hello_world on software VM...");
    let hello_prog = assembler::hello_world();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();

    // ─── Boot: Build bold atlas ───
    println!("[boot] Running bold atlas builder...");
    let atlas_builder = assembler::bold_atlas_builder();
    svm.load_program(0x00001000, &atlas_builder.pixels);
    svm.spawn_vm(1, 0x00001000);
    svm.execute_frame();

    // Verify bold atlas at 0x00F10000 (check 'A' row 0)
    let bold_base = 0x00F10000u32;
    let orig_a_row0 = svm.peek(0x00F00000 + 65 * 8);
    let bold_a_row0 = svm.peek(bold_base + 65 * 8);
    if bold_a_row0 == (orig_a_row0 | (orig_a_row0 >> 1)) {
        println!("  Bold atlas verified at 0x{:08X} -- ready.", bold_base);
    } else {
        println!(
            "  [WARN] Bold atlas verification failed: got 0x{:02X}, expected 0x{:02X}. Continuing with base font.",
            bold_a_row0, orig_a_row0 | (orig_a_row0 >> 1)
        );
    }

    svm.load_program(200, &hello_prog.pixels);
    svm.spawn_vm(0, 200);
    svm.execute_frame();

    // Verify text output at address 5000
    let h_rows = pixels_move_pixels::font_atlas::get_char_rows(b'H');
    let row0 = svm.peek(5000);
    if row0 == h_rows[0] as u32 {
        println!("  'H' row 0 = 0x{:02X} -- CORRECT", row0);
    } else {
        println!(
            "  'H' row 0 = 0x{:02X}, expected 0x{:02X} -- MISMATCH",
            row0, h_rows[0]
        );
    }
    println!("  Text 'HELLO' written at addresses 5000..5047");

    // ─── Build composite substrate for visualization ───
    println!();
    println!("[viz] Building composite substrate for visualization...");
    let composite = Substrate::new();

    // Load font atlas (shows up as colored region at 0xF00000)
    composite.load_font_atlas();

    // Copy self-replicator from GPU substrate
    for i in 0..program.pixels.len() as u32 {
        composite.poke(i, vm.substrate().peek(i));
        composite.poke(100 + i, vm.substrate().peek(100 + i));
    }

    // Copy hello_world text output from software VM
    for addr in 5000u32..5048 {
        composite.poke(addr, svm.peek(addr));
    }

    // ─── Render visualizations ───
    println!("[viz] Rendering visualizations...");

    // 1. Full Hilbert PNG (downscaled) -- shows programs, font atlas, text
    //    4096x4096 -> 256x256 at scale=16
    visualization::render_hilbert_png(&composite, 16, "hilbert_full.png");
    println!("  -> hilbert_full.png (full texture, 256x256)");

    // 2. Program region: addresses 0-120 (self-replicator + copy)
    composite.render_hilbert_png(0, 120, 512, "hilbert_programs.png");
    println!("  -> hilbert_programs.png (addr 0-119, 512x512)");

    // 3. Font atlas region: addresses 0xF00000..0xF003FF (1024 entries)
    let font_base = pixels_move_pixels::font_atlas::FONT_BASE;
    let font_size = pixels_move_pixels::font_atlas::FONT_SIZE;
    composite.render_hilbert_png(font_base, font_size, 512, "hilbert_font_atlas.png");
    println!("  -> hilbert_font_atlas.png (addr 0xF00000, 512x512)");

    // 4. Text output region: addresses 5000-5047 (HELLO glyphs)
    composite.render_hilbert_png(5000, 48, 512, "hilbert_text.png");
    println!("  -> hilbert_text.png (addr 5000-5047, 512x512)");

    // 5. Zoomed text output as readable glyph bitmap
    visualization::render_text_png(&composite, 5000, 5, 8, "text_hello.png");
    println!("  -> text_hello.png (HELLO text, 8x scale)");

    // 6. Side-by-side source vs copy comparison
    visualization::render_comparison_png(&composite, 0, 100, 18, "replication_comparison.png");
    println!("  -> replication_comparison.png (source vs copy)");

    // 7. Detailed opcode view of the program
    visualization::render_region_png(&composite, 0, 20, 1, "program_source.png");
    visualization::render_region_png(&composite, 100, 20, 1, "program_copy.png");
    println!("  -> program_source.png, program_copy.png (opcode strip)");

    // ─── Print legend ───
    println!();
    println!("Color legend (by opcode):");
    println!("  NOP=black  LDI=blue  MOV=cyan  LOAD=green  STORE=yellow");
    println!("  ADD=orange  SUB=magenta  MUL=purple  JMP=bright orange");
    println!("  BRANCH=red  CALL=gold  RET=silver  HALT=white  ENTRY=bright green");
    println!("  CHAR=spring green  BLIT=lime  SPAWN=hot pink");
    println!();
    println!("What to look for:");
    println!("  hilbert_programs.png    -- two colored clusters (source + replicated copy)");
    println!("  hilbert_font_atlas.png  -- dense colored region (128 chars x 8 rows each)");
    println!("  hilbert_text.png        -- 5 small clusters (H,E,L,L,O at 10-byte spacing)");
    println!("  text_hello.png          -- readable 'HELLO' rendered from glyph bitmaps");
    println!();
    println!("Done.");
}
