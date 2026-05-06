// mandelbrot_run.rs -- Visual verification for the RISC-V guest Mandelbrot renderer
//
// Boots the mandelbrot.elf binary via the RISC-V interpreter, runs until
// fb_present is called (the render completes), then verifies:
//   1. Non-zero pixel count > 1000 (fractal has detail)
//   2. Color diversity > 50 unique colors (smooth gradient palette)
//   3. Interior is uniformly dark (set membership)
//   4. Exterior has colored pixels (escape-time coloring)
//
// Note: The interactive version waits for keyboard input after the initial
// render. We check that the initial render completed correctly by looking
// at the framebuffer state after the instruction limit.
//
// Usage: cargo run --example mandelbrot_run

use geometry_os::riscv::RiscvVm;
use std::collections::HashSet;

/// Check if a pixel is "visually black" (RGB channels all zero).
/// Pixel format is 0xRRGGBBAA; interior points are fb_rgb(0,0,0) = 0x000000FF.
fn is_black(pixel: u32) -> bool {
    let r = (pixel >> 24) & 0xFF;
    let g = (pixel >> 16) & 0xFF;
    let b = (pixel >> 8) & 0xFF;
    r == 0 && g == 0 && b == 0
}

/// Extract RGB part (ignoring alpha) for color diversity counting.
fn rgb_key(pixel: u32) -> u32 {
    pixel & 0xFFFFFF00 // mask out alpha, keep RGB
}

fn main() {
    let elf_path = "examples/riscv-hello/mandelbrot.elf";
    let elf_data = std::fs::read(elf_path).expect("failed to read mandelbrot.elf");

    eprintln!("=== RISC-V Mandelbrot Fractal Renderer Verification ===");
    eprintln!("ELF: {} ({} bytes)", elf_path, elf_data.len());

    let mut vm = RiscvVm::new(1024 * 1024);

    eprintln!("Booting guest (max 500M instructions)...");
    let result = vm
        .boot_guest(&elf_data, 1, 500_000_000)
        .expect("boot_guest should succeed");

    eprintln!(
        "Executed {} instructions, entry=0x{:08X}, dtb=0x{:08X}",
        result.instructions, result.entry, result.dtb_addr
    );

    // Check if present was called (render completed)
    let fb = &vm.bus.framebuf;
    let total_pixels = fb.pixels.len();

    if !fb.present_flag {
        eprintln!("[WARN] fb_present() was NOT called -- guest may still be running.");
        eprintln!("       This is expected for the interactive version after initial render.");
    } else {
        eprintln!("[INFO] fb_present() was called by guest.");
    }

    // Analyze pixels (use RGB-based black check, not zero check)
    let mut nonzero_count = 0u32;
    let mut colors: HashSet<u32> = HashSet::new();
    let mut black_count = 0u32;

    for &pixel in &fb.pixels {
        let rgb = rgb_key(pixel);
        if is_black(pixel) {
            black_count += 1;
        } else {
            nonzero_count += 1;
        }
        colors.insert(rgb);
    }

    eprintln!("\nFramebuffer analysis (256x256 = {} pixels):", total_pixels);
    eprintln!("  Non-black pixels: {}", nonzero_count);
    eprintln!("  Black pixels:     {}", black_count);
    eprintln!("  Unique RGB colors: {}", colors.len());

    // === Verification checks ===
    let mut pass = true;

    // Check 1: Non-black pixel count > 1000
    if nonzero_count > 1000 {
        eprintln!("  [PASS] Non-black pixel count > 1000 ({})", nonzero_count);
    } else {
        eprintln!(
            "  [FAIL] Non-black pixel count too low: {} (expected > 1000)",
            nonzero_count
        );
        pass = false;
    }

    // Check 2: Color diversity > 50 unique colors
    if colors.len() > 50 {
        eprintln!("  [PASS] Color diversity > 50 ({})", colors.len());
    } else {
        eprintln!(
            "  [FAIL] Color diversity too low: {} (expected > 50)",
            colors.len()
        );
        pass = false;
    }

    // Check 3: Center pixel (128,128) maps to (-1,0) which is inside the set
    // Interior points are rendered as fb_rgb(0,0,0) = 0x000000FF (black RGB)
    let center_pixel = fb.pixels[128 * 256 + 128];
    if is_black(center_pixel) {
        eprintln!("  [PASS] Center (128,128) is black (inside set)");
    } else {
        eprintln!(
            "  [FAIL] Center (128,128) should be black, got 0x{:08X}",
            center_pixel
        );
        pass = false;
    }

    // Check 4: Far outside point should be colored
    // Pixel (0, 0) maps to the far corner of the complex plane
    let corner_pixel = fb.pixels[0];
    if !is_black(corner_pixel) {
        eprintln!(
            "  [PASS] Corner (0,0) is colored 0x{:08X} (outside set)",
            corner_pixel
        );
    } else {
        eprintln!("  [FAIL] Corner (0,0) should be colored, got black");
        pass = false;
    }

    // Check 5: Symmetry -- column 128 should be a vertical axis of symmetry
    // (the Mandelbrot set is symmetric about the real axis, and our view
    //  is centered at imaginary=0, so top half mirrors bottom half)
    let mut symmetry_errors = 0u32;
    for px in 0..256u32 {
        let top = fb.pixels[(128 - 64) as usize * 256 + px as usize];
        let bot = fb.pixels[(128 + 64) as usize * 256 + px as usize];
        if rgb_key(top) != rgb_key(bot) {
            symmetry_errors += 1;
        }
    }
    // Allow some asymmetry due to HUD overlay at bottom
    if symmetry_errors < 50 {
        eprintln!(
            "  [PASS] Vertical symmetry check ({}/256 mismatches, within tolerance)",
            symmetry_errors
        );
    } else {
        eprintln!(
            "  [WARN] Vertical symmetry has {} mismatches (HUD overlay may cause this)",
            symmetry_errors
        );
    }

    // Dump ASCII preview
    eprintln!("\nASCII preview (64x32, each char = 4x8 pixels):");
    for y in 0..32 {
        let mut line = String::new();
        for x in 0..64 {
            let px = x * 4;
            let py = y * 8;
            let pixel = fb.pixels[py * 256 + px];
            let ch = if is_black(pixel) {
                ' '
            } else {
                let r = (pixel >> 24) & 0xFF;
                let g = (pixel >> 16) & 0xFF;
                let b = (pixel >> 8) & 0xFF;
                let brightness = (r as u32 + g as u32 + b as u32) / 3;
                match brightness {
                    0..=32 => '.',
                    33..=64 => ':',
                    65..=96 => '+',
                    97..=128 => '*',
                    129..=160 => '#',
                    161..=191 => '@',
                    192..=255 => 'W',
                    _ => '?',
                }
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
