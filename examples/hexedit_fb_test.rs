// Test: boot hexedit with more steps and check if render completes
use geometry_os::riscv::bridge::UartBridge;
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = "examples/riscv-hello/hexedit.elf";
    let elf_data = std::fs::read(elf_path).expect("read elf");

    let mut vm = RiscvVm::new(1024 * 1024);
    let _bridge = UartBridge::new();

    // Boot with more steps - render needs ~1M+ instructions
    let boot = vm.boot_guest(&elf_data, 1, 2_000_000).expect("boot");
    eprintln!("After boot: pc=0x{:08X}, steps={}", vm.cpu.pc, boot.instructions);

    let fb = &vm.bus.framebuf.pixels;

    // Count unique pixel values
    use std::collections::HashMap;
    let mut counts: HashMap<u32, usize> = HashMap::new();
    for &p in fb.iter() {
        *counts.entry(p).or_insert(0) += 1;
    }
    eprintln!("Unique pixel values: {}", counts.len());
    let mut sorted: Vec<_> = counts.into_iter().collect();
    sorted.sort_by_key(|(_, c)| std::cmp::Reverse(*c));
    for (val, cnt) in &sorted {
        eprintln!("  0x{:08X} : {} pixels", val, cnt);
    }

    // Check title bar area (y=0..12) - should be COL_TITLE_BG=0x303050FF
    let title_bg_count = fb[0..12*256].iter().filter(|&&p| p == 0x303050FF).count();
    eprintln!("Title bar pixels matching COL_TITLE_BG: {}/{}", title_bg_count, 12*256);

    // Check for any text pixels (non-background, non-title colors)
    let text_colors = [0xD0D0D0FFu32, 0x80C0FFFF, 0xFFFFFFFF, 0xA0D0A0FF, 0xFF8080FF];
    let mut text_count = 0usize;
    for &p in fb.iter() {
        if text_colors.contains(&p) {
            text_count += 1;
        }
    }
    eprintln!("Text-colored pixels found: {}", text_count);

    // ASCII art of the screen (64x32, downsampled)
    eprintln!("\n--- ASCII art (64x32, downsampled from 256x256) ---");
    for cy in 0..32 {
        let mut line = String::new();
        for cx in 0..64 {
            // Sample center pixel of each 4x8 block
            let sx = cx * 4 + 2;
            let sy = cy * 8 + 4;
            let px = fb[sy * 256 + sx];
            let r = (px >> 24) & 0xFF;
            let g = (px >> 16) & 0xFF;
            let b = (px >> 8) & 0xFF;
            let brightness = (r as u32 + g as u32 + b as u32) / 3;
            let ch = match brightness {
                0..=15 => ' ',
                16..=48 => '.',
                49..=96 => ':',
                97..=160 => '+',
                161..=210 => '#',
                _ => '@',
            };
            line.push(ch);
        }
        eprintln!("{}", line);
    }
}
