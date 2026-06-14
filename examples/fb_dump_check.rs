use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = std::env::args().nth(1).unwrap();
    let elf_data = std::fs::read(&elf_path).unwrap();
    let mut vm = RiscvVm::new(1024 * 1024);
    vm.boot_guest(&elf_data, 1, 5_000_000).unwrap();

    let fb = &vm.bus.framebuf;
    let points: [(usize, usize); 8] = [
        (0, 0),
        (1, 0),
        (10, 10),
        (50, 50),
        (128, 128),
        (255, 255),
        (100, 200),
        (0, 1),
    ];
    for (x, y) in points {
        let idx = y * 256 + x;
        let val = fb.pixels[idx];
        let r = (val >> 24) & 0xFF;
        let g = (val >> 16) & 0xFF;
        let b = (val >> 8) & 0xFF;
        let a = val & 0xFF;
        eprintln!(
            "({},{}) idx={}: 0x{:08X} R={:02X} G={:02X} B={:02X} A={:02X}",
            x, y, idx, val, r, g, b, a
        );
    }

    let mut vals: std::collections::HashMap<u32, usize> = std::collections::HashMap::new();
    for &p in &fb.pixels {
        *vals.entry(p).or_insert(0) += 1;
    }
    eprintln!("Distinct pixel values:");
    let mut sorted: Vec<_> = vals.iter().collect();
    sorted.sort_by_key(|(_, c)| std::cmp::Reverse(**c));
    for (val, count) in sorted.iter().take(10) {
        eprintln!("  0x{:08X}: {} pixels", val, count);
    }
}
