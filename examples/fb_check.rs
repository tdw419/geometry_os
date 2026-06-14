// Run a Rust bare-metal ELF on the GeOS RISC-V VM and check framebuffer pixels.
// cargo run --release --example fb_check

use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "../geometry_os/examples/riscv-rust/fb_driver.elf".into());
    let elf_data = std::fs::read(&elf_path).expect("read elf");
    eprintln!("Loaded {}: {} bytes", elf_path, elf_data.len());

    let mut vm = RiscvVm::new(1024 * 1024);
    let boot = vm.boot_guest(&elf_data, 1, 5_000_000).expect("boot failed");
    eprintln!("Booted: {} instructions", boot.instructions);

    // Check framebuffer pixels
    let fb = &vm.bus.framebuf;

    // Check corner pixel (should be white border)
    let top_left = fb.pixels[0]; // (0,0) = white
    let bottom_right = fb.pixels[255 * 256 + 255]; // (255,255) = white
    let center = fb.pixels[128 * 256 + 128]; // (128,128) = red square
    let bg = fb.pixels[10 * 256 + 10]; // (10,10) = dark blue background

    // Convert from 0xRRGGBBAA (SBI format) to readable
    fn pixel_str(p: u32) -> String {
        let r = (p >> 24) & 0xFF;
        let g = (p >> 16) & 0xFF;
        let b = (p >> 8) & 0xFF;
        let a = p & 0xFF;
        format!("R={:02X} G={:02X} B={:02X} A={:02X}", r, g, b, a)
    }

    println!("Framebuffer pixel check:");
    println!(
        "  (0,0) top-left border:  {} (expect white)",
        pixel_str(top_left)
    );
    println!(
        "  (255,255) bottom-right: {} (expect white)",
        pixel_str(bottom_right)
    );
    println!(
        "  (128,128) center:       {} (expect red)",
        pixel_str(center)
    );
    println!(
        "  (10,10) background:     {} (expect dark blue)",
        pixel_str(bg)
    );

    // Diagonal check (green line)
    let diag = fb.pixels[50 * 256 + 50];
    println!(
        "  (50,50) diagonal:       {} (expect green)",
        pixel_str(diag)
    );

    // Verify
    let white_ok = (top_left >> 8) == 0xFFFFFF && top_left & 0xFF == 0xFF;
    let red_ok = ((center >> 24) & 0xFF) == 0xFF && ((center >> 16) & 0xFF) == 0x00;
    let bg_ok =
        ((bg >> 24) & 0xFF) == 0x10 && ((bg >> 16) & 0xFF) == 0x10 && ((bg >> 8) & 0xFF) == 0x40;
    let green_ok = ((diag >> 16) & 0xFF) == 0xFF && ((diag >> 24) & 0xFF) == 0x00;

    if white_ok && red_ok && bg_ok && green_ok {
        println!("\nALL PIXEL CHECKS PASSED");
    } else {
        println!(
            "\nSOME CHECKS FAILED: white={} red={} bg={} green={}",
            white_ok, red_ok, bg_ok, green_ok
        );
    }

    let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    eprintln!("UART output: {} bytes", output.len());
}
