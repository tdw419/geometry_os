//! Standalone test for GlyphGrid
//! Run: cd geometry_os && cargo run --release --bin test_glyph_grid
//! Or: rustc --edition 2021 --crate-type bin src/bin/test_glyph_grid.rs -L target/release/deps --extern geometry_os=target/release/libgeometry_os.rlib -o /tmp/test_glyph_grid && /tmp/test_glyph_grid

use geometry_os::glyph_grid::{
    GlyphGrid, CMD_BIND, CMD_NOP, CMD_PUT, EV_BASE, EV_DATA, EV_HEAD, MAILBOX_BASE,
};

fn main() {
    let mut grid = GlyphGrid::new();
    grid.enabled = true;
    let mut ram = vec![0u32; 0x8000];
    let mut screen = vec![0u32; 256 * 256];
    let base = MAILBOX_BASE;
    let mut passed = 0u32;
    let mut failed = 0u32;

    macro_rules! test {
        ($name:expr, $body:block) => {
            print!("  {} ... ", $name);
            let p = passed;
            let f = failed;
            $body
            if failed == f && passed == p + 1 {
                println!("PASS");
            } else {
                println!("FAIL");
            }
        }
    }

    // Reset state between tests
    fn reset(grid: &mut GlyphGrid, ram: &mut [u32], screen: &mut [u32]) {
        *grid = GlyphGrid::new();
        grid.enabled = true;
        for w in ram.iter_mut() {
            *w = 0;
        }
        for w in screen.iter_mut() {
            *w = 0;
        }
    }

    println!("\nGlyphGrid Bidirectional Layer Tests");
    println!("===================================");
    println!();

    // Test 1: Downward render
    println!("[Downward] Writing glyph → pixels:");
    test!("write 'X' to cell (0,0), verify font pixels", {
        reset(&mut grid, &mut ram, &mut screen);
        grid.put_cell(0, 0, b'X', 0xFFFFFF, 0x000000);
        assert!(grid.cells[0][0].dirty);
        grid.render_to_screen(&mut screen);

        let glyph = &geometry_os::font::GLYPHS[b'X' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + col];
                let on = (glyph[row] & (1 << (7 - col))) != 0;
                assert_eq!(
                    pixel,
                    if on { 0xFFFFFF } else { 0x000000 },
                    "Pixel ({},{}) mismatch",
                    col,
                    row
                );
            }
        }
        assert!(!grid.cells[0][0].dirty);
        passed += 1;
    });

    // Test 2: Upward detection
    println!("\n[Upward] Pixel change → event detection:");
    test!("change pixel, bind token, detect change", {
        reset(&mut grid, &mut ram, &mut screen);
        grid.put_cell(1, 1, b'O', 0xFFFFFF, 0x000000);
        grid.render_to_screen(&mut screen);
        grid.bind_token(0, 1, 1, 1, 1, 0);
        assert_eq!(grid.cells[1][1].token_id, 0);

        // Break a pixel
        screen[10 * 256 + 10] = 0xFF0000;

        let events = grid.scan_for_changes(&screen);
        assert!(!events.is_empty(), "Should detect pixel change");
        let found = events
            .iter()
            .any(|(tid, cx, cy, _)| *tid == 0 && *cx == 1 && *cy == 1);
        assert!(found, "Event should report token 0 at cell (1,1)");
        passed += 1;
    });

    test!("unowned cell changes are NOT detected", {
        reset(&mut grid, &mut ram, &mut screen);
        grid.put_cell(5, 5, b'Z', 0xFFFFFF, 0x000000);
        grid.render_to_screen(&mut screen);
        screen[5 * 256 + 40] = 0xFF0000;
        let events = grid.scan_for_changes(&screen);
        assert!(events.is_empty(), "Unowned cells should not trigger events");
        passed += 1;
    });

    // Test 3: Mailbox protocol
    println!("\n[Mailbox] RAM-based command protocol:");
    test!("PUT via mailbox → auto-clear", {
        reset(&mut grid, &mut ram, &mut screen);
        ram[base + 0] = CMD_PUT; // cmd
        ram[base + 1] = 2; // cell_x
        ram[base + 2] = 3; // cell_y
        ram[base + 3] = b'A' as u32; // char
        ram[base + 4] = 0xFFFFFF; // fg
        ram[base + 5] = 0x0000FF; // bg
        ram[base + 13] = 1; // auto_clear

        grid.process_mailbox(&mut ram, &mut screen);

        assert_eq!(ram[base + 0], CMD_NOP, "cmd should auto-clear");
        assert_eq!(ram[base + 12], 1, "status should be 1");
        assert_eq!(grid.cells[3][2].char_code, b'A');
        passed += 1;
    });

    test!("GET via mailbox", {
        reset(&mut grid, &mut ram, &mut screen);
        grid.put_cell(2, 3, b'A', 0xFFFFFF, 0x0000FF);
        ram[base + 0] = 2; // CMD_GET
        ram[base + 1] = 2; // cell_x
        ram[base + 2] = 3; // cell_y
        ram[base + 13] = 1; // auto_clear

        grid.process_mailbox(&mut ram, &mut screen);

        assert_eq!(ram[base + 3], b'A' as u32, "GET should return char");
        assert_eq!(ram[base + 12], 1, "status should be 1");
        passed += 1;
    });

    // Test 4: Full bidirectional via on_frame
    println!("\n[Bidirectional] Full cycle through on_frame():");
    test!("mailbox → render → pixel change → event buffer", {
        reset(&mut grid, &mut ram, &mut screen);

        // PUT 'X' at (0,0)
        ram[base + 0] = CMD_PUT;
        ram[base + 1] = 0;
        ram[base + 2] = 0;
        ram[base + 3] = b'X' as u32;
        ram[base + 4] = 0xFFFFFF;
        ram[base + 5] = 0x000000;

        // BIND token 0 to cell (0,0)-(0,0)
        ram[base + 6] = 0; // token_id
        ram[base + 7] = 0; // sx
        ram[base + 8] = 0; // sy
        ram[base + 9] = 0; // ex
        ram[base + 10] = 0; // ey

        // NOTE: process PUT and BIND separately since on_frame
        // processes mailbox + renders + scans in one call but
        // only processes ONE command per call
        grid.on_frame(&mut ram, &mut screen); // processes PUT

        ram[base + 0] = CMD_BIND;
        grid.on_frame(&mut ram, &mut screen); // processes BIND, renders, scans

        // Verify 'X' pixels
        let glyph = &geometry_os::font::GLYPHS[b'X' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + col];
                let on = (glyph[row] & (1 << (7 - col))) != 0;
                assert_eq!(
                    pixel,
                    if on { 0xFFFFFF } else { 0x000000 },
                    "Pixel ({},{}) mismatch",
                    col,
                    row
                );
            }
        }

        // Break pixel (4,4)
        screen[4 * 256 + 4] = 0xFF0000;

        // on_frame again should detect the change
        ram[base + 0] = CMD_NOP;
        grid.on_frame(&mut ram, &mut screen);

        let ev_count = ram[EV_BASE + EV_HEAD];
        assert!(
            ev_count > 0,
            "Should have detected pixel change: count={}",
            ev_count
        );

        let tid = ram[EV_BASE + EV_DATA + 0];
        let ev_cx = ram[EV_BASE + EV_DATA + 1];
        let ev_cy = ram[EV_BASE + EV_DATA + 2];
        assert_eq!(tid, 0, "Event token should be 0, got {}", tid);
        assert_eq!(ev_cx, 0, "Event cell X should be 0, got {}", ev_cx);
        assert_eq!(ev_cy, 0, "Event cell Y should be 0, got {}", ev_cy);
        passed += 1;
    });

    println!();
    println!("===================================");
    println!("Results: {} passed, {} failed", passed, failed);
    if failed > 0 {
        std::process::exit(1);
    }
    println!("All tests PASSED.");
    println!();
    println!("The Glyph Grid prototype proves:");
    println!("  ↓ Writing 'X' at glyph level → correct font pixels on framebuffer");
    println!("  ↑ Pixel change on framebuffer → detected with correct token/cell info");
    println!("  ⇅ Mailbox protocol writes glyphs, binds tokens, fires events");
    println!();
    println!("This IS the bidirectional layer.");
    println!("Type 'x' → pixel lights up → font layer owns that pixel → external change propagates back up.");
    println!("Layer 1 (glyph grid) now bridges Layer 0 (pixels) and Layer 2 (tokens).");
}
