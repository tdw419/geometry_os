// mandelbrot_run.rs -- Visual verification for the RISC-V guest Mandelbrot renderer
//
// Boots the mandelbrot.elf binary via the RISC-V interpreter, runs until
// fb_present is called (the render completes), then verifies:
//   1. Non-zero pixel count > 1000 (fractal has detail)
//   2. Color diversity > 50 unique colors (smooth gradient palette)
//   3. Interior is uniformly black (set membership)
//   4. Exterior has colored pixels (escape-time coloring)
//
// Usage: cargo run --example mandelbrot_run

use geometry_os::riscv::RiscvVm;
use std::collections::HashSet;

fn main() {
    // Load the pre-built Mandelbrot ELF
    let elf_path = "examples/riscv-hello/mandelbrot.elf";
    let elf_data = std::fs::read(elf_path).expect("failed to read mandelbrot.elf");

    eprintln!("=== RISC-V Mandelbrot Fractal Renderer Verification ===");
    eprintln!("ELF: {} ({} bytes)", elf_path, elf_data.len());

    // Create VM with 1MB RAM (same as hypervisor config)
    let mut vm = RiscvVm::new(1024 * 1024);

    // Boot the guest (max 500M instructions for compute-heavy 256x256 Mandelbrot)
    eprintln!("Booting guest...");
    let result = vm
        .boot_guest(&elf_data, 1, 500_000_000)
        .expect("boot_guest should succeed");

    eprintln!(
        "Executed {} instructions, entry=0x{:08X}, dtb=0x{:08X}",
        result.instructions, result.entry, result.dtb_addr
    );

    // Read framebuffer pixels
    let fb = &vm.bus.framebuf;
    let total_pixels = fb.pixels.len();
    let mut nonzero_count = 0u32;
    let mut colors: HashSet<u32> = HashSet::new();
    let mut black_count = 0u32;

    for &pixel in &fb.pixels {
        if pixel != 0 {
            nonzero_count += 1;
            colors.insert(pixel);
        } else {
            black_count += 1;
        }
    }

    eprintln!("\nFramebuffer analysis (256x256 = {} pixels):", total_pixels);
    eprintln!("  Non-zero pixels: {}", nonzero_count);
    eprintln!("  Black pixels:    {}", black_count);
    eprintln!("  Unique colors:   {}", colors.len());

    // === Verification checks ===
    let mut pass = true;

    // Check 1: Non-zero pixel count > 1000
    if nonzero_count > 1000 {
        eprintln!("  [PASS] Non-zero pixel count > 1000 ({})", nonzero_count);
    } else {
        eprintln!(
            "  [FAIL] Non-zero pixel count too low: {} (expected > 1000)",
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

    // Check 3: Interior of the set should be black
    // The default view is centered at (-1.0, 0.0) with span 3.0.
    // Pixel (128, 128) maps to the center of the set's main cardioid.
    let center_pixel = fb.pixels[128 * 256 + 128];
    if center_pixel == 0 {
        eprintln!("  [PASS] Center (128,128) is black (inside set)");
    } else {
        eprintln!(
            "  [FAIL] Center (128,128) should be black, got 0x{:08X}",
            center_pixel
        );
        pass = false;
    }

    // Check 4: Far outside point should be colored (escape-time coloring)
    // Pixel (0, 0) maps to far corner of the complex plane, well outside the set.
    let corner_pixel = fb.pixels[0];
    if corner_pixel != 0 {
        eprintln!(
            "  [PASS] Corner (0,0) is colored 0x{:08X} (outside set)",
            corner_pixel
        );
    } else {
        eprintln!("  [FAIL] Corner (0,0) should be colored, got black");
        pass = false;
    }

    // Check 5: Present flag should have been set (guest called fb_present)
    if fb.present_flag {
        eprintln!("  [PASS] fb_present() was called by guest");
    } else {
        eprintln!("  [WARN] fb_present() was NOT called (guest may not have finished)");
    }

    // Dump a small ASCII representation of the fractal
    eprintln!("\nASCII preview (64x32, each char = 4x8 pixels):");
    for y in 0..32 {
        let mut line = String::new();
        for x in 0..64 {
            let px = x * 4;
            let py = y * 8;
            let pixel = fb.pixels[py * 256 + px];
            let ch = if pixel == 0 {
                ' '
            } else {
                // Map brightness to ASCII density
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
