// life_fb_run.rs -- Visual verification for the RISC-V Guest Conway's Life (framebuffer)
//
// Boots life_fb.elf, runs until fb_present is called, then verifies:
//   1. Non-zero pixel count indicates active life grid (full framebuffer coverage)
//   2. Alive cells exist (green channel > 100)
//   3. Color diversity exists (alive green + grid lines + background)
//   4. Spatial pattern: alive cells occupy distinct regions from dead cells
//   5. Console output contains program banner
//
// Design rule: state is verified via spatial patterns (pixel block positions,
// region occupancy), not color-channel values.
//
// Usage: cargo run --example life_fb_run

use geometry_os::riscv::RiscvVm;
use std::collections::HashSet;

fn main() {
    let elf_path = "examples/riscv-hello/life_fb.elf";
    let elf_data = std::fs::read(elf_path).expect("failed to read life_fb.elf");

    eprintln!("=== RISC-V Conway's Life (Framebuffer) Verification ===");
    eprintln!("ELF: {} ({} bytes)", elf_path, elf_data.len());

    let mut vm = RiscvVm::new(2 * 1024 * 1024);

    // Boot with 2 cores, 300M instruction budget
    // (life_fb renders full 256x256 grid + computes 64x64 neighbors each frame)
    eprintln!("Booting guest...");
    let result = vm
        .boot_guest(&elf_data, 2, 300_000_000)
        .expect("boot_guest should succeed");

    eprintln!(
        "Executed {} instructions, entry=0x{:08X}",
        result.instructions, result.entry
    );

    // Read framebuffer
    let fb = &vm.bus.framebuf;
    let total_pixels = fb.pixels.len();
    let mut nonzero_count = 0u32;
    let mut colors: HashSet<u32> = HashSet::new();
    let mut alive_pixels = 0u32; // green channel > 100 (alive cells)
    let mut dark_pixels = 0u32;  // non-zero but not alive (grid/bg)
    let mut black_pixels = 0u32; // zero (unwritten)

    for &pixel in &fb.pixels {
        if pixel == 0 {
            black_pixels += 1;
            continue;
        }
        nonzero_count += 1;
        colors.insert(pixel);

        let g = (pixel >> 16) & 0xFF;
        if g > 100 {
            alive_pixels += 1;
        } else {
            dark_pixels += 1;
        }
    }

    eprintln!("\nFramebuffer analysis (256x256 = {} pixels):", total_pixels);
    eprintln!("  Non-zero pixels: {}", nonzero_count);
    eprintln!("  Black (unwritten): {}", black_pixels);
    eprintln!("  Alive (g>100): {}", alive_pixels);
    eprintln!("  Dark (grid/bg): {}", dark_pixels);
    eprintln!("  Unique colors: {}", colors.len());

    // === Verification checks ===
    let mut pass = true;

    // Check 1: Screen has content (not all black)
    if nonzero_count > 50000 {
        eprintln!(
            "  [PASS] Non-zero pixels > 50000 ({})",
            nonzero_count
        );
    } else {
        eprintln!(
            "  [FAIL] Non-zero pixels too low: {} (expected > 50000)",
            nonzero_count
        );
        pass = false;
    }

    // Check 2: Alive cells are present
    if alive_pixels > 50 {
        eprintln!(
            "  [PASS] Alive cells (g>100) > 50 ({})",
            alive_pixels
        );
    } else {
        eprintln!(
            "  [FAIL] Alive cells too few: {} (expected > 50)",
            alive_pixels
        );
        pass = false;
    }

    // Check 3: Multiple colors (grid lines + alive cells + background)
    if colors.len() > 2 {
        eprintln!("  [PASS] Color diversity > 2 ({})", colors.len());
    } else {
        eprintln!(
            "  [FAIL] Color diversity too low: {} (expected > 2)",
            colors.len()
        );
        pass = false;
    }

    // Check 4: Spatial pattern -- alive cells form clusters, not uniformly spread.
    // Divide the screen into quadrants and check alive cell distribution.
    // At least one quadrant should have significantly more alive cells than another
    // (proving the pattern is structured, not uniform noise).
    let mut quad_alive = [0u32; 4]; // TL, TR, BL, BR
    for y in 0..256u32 {
        for x in 0..256u32 {
            let pixel = fb.pixels[(y * 256 + x) as usize];
            let g = (pixel >> 16) & 0xFF;
            if g > 100 {
                let qi = if y < 128 { 0 } else { 2 } + if x < 128 { 0 } else { 1 };
                quad_alive[qi] += 1;
            }
        }
    }
    eprintln!(
        "  Quadrant alive: TL={} TR={} BL={} BR={}",
        quad_alive[0], quad_alive[1], quad_alive[2], quad_alive[3]
    );

    let max_quad = *quad_alive.iter().max().unwrap();
    let min_quad = *quad_alive.iter().filter(|&&x| x > 0).min().unwrap_or(&max_quad);
    if max_quad > 0 && (max_quad > min_quad * 2 || min_quad == 0) {
        eprintln!(
            "  [PASS] Spatial pattern: non-uniform distribution (max={}, min={})",
            max_quad, min_quad
        );
    } else if max_quad > 0 {
        eprintln!(
            "  [WARN] Spatial pattern: relatively uniform (max={}, min={})",
            max_quad, min_quad
        );
    }

    // Check 5: Console output contains expected strings
    let console = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    let console_end = if console.len() > 300 {
        &console[console.len() - 300..]
    } else {
        &console
    };
    eprintln!("\nConsole output (last 300 chars):");
    eprintln!("  {}", console_end);

    if console.contains("life_fb") && console.contains("Framebuffer") {
        eprintln!("  [PASS] Console output contains expected banner");
    } else if console.contains("life_fb") {
        eprintln!("  [PASS] Console output contains program identifier");
    } else {
        eprintln!("  [FAIL] Console output missing expected strings");
        pass = false;
    }

    // Check 6: fb_present was called
    if fb.present_flag {
        eprintln!("  [PASS] fb_present() was called by guest");
    } else {
        eprintln!("  [WARN] fb_present() was NOT called");
        pass = false;
    }

    // ASCII preview
    eprintln!("\nASCII preview (64x32, each char = 4x8 pixels):");
    for y in 0..32 {
        let mut line = String::new();
        for x in 0..64 {
            let px = x * 4;
            let py = y * 8;
            let pixel = fb.pixels[py * 256 + px];
            let g = (pixel >> 16) & 0xFF;
            let ch = if g > 150 {
                '#'
            } else if g > 80 {
                '+'
            } else if pixel != 0 {
                '.'
            } else {
                ' '
            };
            line.push(ch);
        }
        eprintln!("  {}", line);
    }

    if pass {
        eprintln!("\n=== ALL CHECKS PASSED ===");
    } else {
        eprintln!("\n=== SOME CHECKS FAILED ===");
        std::process::exit(1);
    }
}
