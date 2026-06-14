// kern_fb_verify.rs -- Verify split-screen framebuffer content from geos_kern.elf
use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");
    let mut vm = RiscvVm::new(2 * 1024 * 1024);

    // Run for 50M instructions (enough for painter first frame + life32 gen 0)
    let r = vm.boot_guest(&elf, 2, 50_000_000).expect("boot");
    eprintln!(
        "[verify] entry=0x{:08X} ran {} instructions",
        r.entry, r.instructions
    );

    // Check framebuffer
    let fb = &vm.bus.framebuf;
    let pixels = &fb.pixels;

    eprintln!("[verify] framebuffer size: {} pixels", pixels.len());

    // Count non-black pixels in left half (x: 0-127) and right half (x: 128-255)
    let mut left_nonblack = 0u64;
    let mut right_nonblack = 0u64;
    let mut left_colors = std::collections::HashSet::new();
    let mut right_colors = std::collections::HashSet::new();

    for y in 0..256u32 {
        for x in 0..256u32 {
            let idx = (y * 256 + x) as usize;
            if idx < pixels.len() {
                // Pixel format in VM: 0xRRGGBBAA
                let px = pixels[idx];
                let r_ch = (px >> 24) & 0xFF;
                let g_ch = (px >> 16) & 0xFF;
                let b_ch = (px >> 8) & 0xFF;
                let a_ch = px & 0xFF;
                let color = ((r_ch as u32) << 24) | ((g_ch as u32) << 16) | ((b_ch as u32) << 8);

                if r_ch > 0 || g_ch > 0 || b_ch > 0 {
                    if x < 128 {
                        left_nonblack += 1;
                        left_colors.insert(color);
                    } else {
                        right_nonblack += 1;
                        right_colors.insert(color);
                    }
                }
            }
        }
    }

    eprintln!(
        "[verify] left half (painter): {} non-black pixels, {} unique colors",
        left_nonblack,
        left_colors.len()
    );
    eprintln!(
        "[verify] right half (life32): {} non-black pixels, {} unique colors",
        right_nonblack,
        right_colors.len()
    );

    // Sample some specific pixels
    eprintln!("[verify] sample pixels:");
    for (x, y) in [
        (10, 10),
        (64, 128),
        (127, 200),
        (140, 64),
        (200, 128),
        (250, 200),
    ] {
        let idx = (y * 256 + x) as usize;
        if idx < pixels.len() {
            let px = pixels[idx];
            eprintln!(
                "  ({:3},{:3}) = 0x{:08X} (R={} G={} B={} A={})",
                x,
                y,
                px,
                (px >> 24) & 0xFF,
                (px >> 16) & 0xFF,
                (px >> 8) & 0xFF,
                px & 0xFF
            );
        }
    }

    // Verdict
    let mut pass = true;
    if left_nonblack < 100 {
        eprintln!(
            "[FAIL] Left half has only {} non-black pixels (expected 100+)",
            left_nonblack
        );
        pass = false;
    }
    if right_nonblack < 50 {
        eprintln!(
            "[FAIL] Right half has only {} non-black pixels (expected 50+)",
            right_nonblack
        );
        pass = false;
    }
    if left_colors.len() < 10 {
        eprintln!(
            "[FAIL] Left half has only {} unique colors (expected 10+)",
            left_colors.len()
        );
        pass = false;
    }

    // Console output check
    let console = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    let has_painter = console.contains("painter") && console.contains("started");
    let has_life = console.contains("life32") && console.contains("gen");
    eprintln!("[verify] painter console: {}", has_painter);
    eprintln!("[verify] life32 console: {}", has_life);
    if !has_painter || !has_life {
        eprintln!("[FAIL] Missing expected console output");
        pass = false;
    }

    if pass {
        eprintln!("[PASS] Split-screen kernel verification PASSED");
    } else {
        eprintln!("[FAIL] Split-screen kernel verification FAILED");
        std::process::exit(1);
    }
}
