// mandelbrot_debug.rs -- Debug the RISC-V guest Mandelbrot renderer
// Captures UART output and checks a few specific pixels.

use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = "examples/riscv-hello/mandelbrot.elf";
    let elf_data = std::fs::read(elf_path).expect("failed to read mandelbrot.elf");

    let mut vm = RiscvVm::new(1024 * 1024);

    eprintln!("Booting...");
    let result = vm
        .boot_guest(&elf_data, 1, 500_000_000)
        .expect("boot_guest should succeed");

    eprintln!("Executed {} instructions", result.instructions);
    eprintln!("Shutdown: {}", vm.bus.sbi.shutdown_requested);

    // Read UART output
    let uart = &vm.bus.uart;
    let output: String = uart.tx_buf.iter().map(|&b| b as char).collect();
    eprintln!("UART output ({} bytes): {}", output.len(), output);

    // Check specific pixels
    let fb = &vm.bus.framebuf;
    eprintln!("fb.present_flag: {}", fb.present_flag);

    // Check a few pixels
    for (x, y) in [(0, 0), (64, 128), (128, 128), (192, 128), (255, 255)] {
        let pixel = fb.pixels[y * 256 + x];
        let r = (pixel >> 24) & 0xFF;
        let g = (pixel >> 16) & 0xFF;
        let b = (pixel >> 8) & 0xFF;
        let a = pixel & 0xFF;
        eprintln!(
            "  pixel({},{}) = 0x{:08X}  R={} G={} B={} A={}",
            x, y, pixel, r, g, b, a
        );
    }

    // Count unique colors
    let mut colors = std::collections::HashSet::new();
    for &p in &fb.pixels {
        colors.insert(p);
    }
    eprintln!("Unique colors: {}", colors.len());
    for &c in colors.iter().take(20) {
        let r = (c >> 24) & 0xFF;
        let g = (c >> 16) & 0xFF;
        let b = (c >> 8) & 0xFF;
        eprintln!("  color 0x{:08X} = R{} G{} B{}", c, r, g, b);
    }
}
