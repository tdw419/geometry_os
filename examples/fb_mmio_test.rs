// Direct MMIO write test: bypass guest code, write to framebuffer via bus
use geometry_os::riscv::RiscvVm;

fn main() {
    let mut vm = RiscvVm::new(1024 * 1024);

    let fb_base = 0x6000_0000u64;
    
    // Write a red pixel at (0,0)
    vm.bus.write_word(fb_base, 0xFF0000FF).expect("write");
    // Write a green pixel at (1,0)
    vm.bus.write_word(fb_base + 4, 0x00FF00FF).expect("write");
    // Write a blue pixel at (2,0)
    vm.bus.write_word(fb_base + 8, 0x0000FFFF).expect("write");

    // Read them back
    let p0 = vm.bus.read_word(fb_base).expect("read");
    let p1 = vm.bus.read_word(fb_base + 4).expect("read");
    let p2 = vm.bus.read_word(fb_base + 8).expect("read");
    
    eprintln!("Direct bus write/read:");
    eprintln!("  pixel(0,0) = 0x{:08X} (expect 0xFF0000FF)", p0);
    eprintln!("  pixel(1,0) = 0x{:08X} (expect 0x00FF00FF)", p1);
    eprintln!("  pixel(2,0) = 0x{:08X} (expect 0x0000FFFF)", p2);

    // Check framebuf.pixels directly
    eprintln!("\nFramebuffer pixels array:");
    eprintln!("  pixels[0] = 0x{:08X}", vm.bus.framebuf.pixels[0]);
    eprintln!("  pixels[1] = 0x{:08X}", vm.bus.framebuf.pixels[1]);
    eprintln!("  pixels[2] = 0x{:08X}", vm.bus.framebuf.pixels[2]);

    // Now test: write via guest instruction execution
    // Load a simple program that writes to 0x60000000
    // We'll construct a minimal ELF that does:
    //   li t0, 0x60000000
    //   li t1, 0xFF0000FF
    //   sw t1, 0(t0)
    //   li t1, 0x00FF00FF
    //   sw t1, 4(t0)
    //   li t1, 0x0000FFFF
    //   sw t1, 8(t0)
    //   ebreak
    
    // Actually, let's just use a simpler approach - write a tiny raw binary
    // and load it at 0x80000000
    
    // RV32I instructions:
    // lui t0, 0x60000        -> 0x60000 << 12 = 0x60000000
    // addi t0, t0, 0         -> t0 = 0x60000000 (already aligned)
    // li t1, 0xFF0000FF:
    //   lui t1, 0xFF000       -> 0xFF000 << 12 = 0xFF000000
    //   addi t1, t1, 0xFF     -> but this might overflow... 
    //   Actually: 0xFF0000FF = 0xFF000000 + 0x000000FF
    //   lui t1, 0xFF001       -> 0xFF001 << 12 = 0xFF001000
    //   addi t1, t1, -0xF01   -> 0xFF001000 - 0xF01 = 0xFF0000FF? No: 0xFF001000 - 0xF01 = 0xFF000FFF
    //   Hmm, let me use a simpler value
    // li t1, 0x00FF0000       (green)
    //   lui t1, 0x00FF0       -> 0x00FF0000
    //   addi t1, t1, 0        -> 0x00FF0000
    
    // Actually let's just load the hexedit ELF and manually step through
    // to see if the SW instructions to 0x60000000 are being executed.
    
    // Even simpler: let's check if there's a write watchpoint mechanism
    // or add tracing to the bus.
    
    // Let's just check the ELF sections to see where the code/data lives
    let elf_data = std::fs::read("examples/riscv-hello/hexedit.elf").expect("read");
    eprintln!("\nELF size: {} bytes", elf_data.len());
    
    // Parse ELF header to find loadable segments
    if elf_data.len() >= 64 {
        let e_phoff = u32::from_le_bytes(elf_data[28..32].try_into().unwrap()) as usize;
        let e_phentsize = u16::from_le_bytes(elf_data[42..44].try_into().unwrap()) as usize;
        let e_phnum = u16::from_le_bytes(elf_data[44..46].try_into().unwrap()) as usize;
        
        eprintln!("ELF: phoff={} phentsize={} phnum={}", e_phoff, e_phentsize, e_phnum);
        
        for i in 0..e_phnum {
            let off = e_phoff + i * e_phentsize;
            if off + 32 <= elf_data.len() {
                let p_type = u32::from_le_bytes(elf_data[off..off+4].try_into().unwrap());
                let p_offset = u32::from_le_bytes(elf_data[off+4..off+8].try_into().unwrap());
                let p_vaddr = u32::from_le_bytes(elf_data[off+8..off+12].try_into().unwrap());
                let p_filesz = u32::from_le_bytes(elf_data[off+16..off+20].try_into().unwrap());
                let p_memsz = u32::from_le_bytes(elf_data[off+20..off+24].try_into().unwrap());
                
                if p_type == 1 { // PT_LOAD
                    eprintln!("  LOAD: vaddr=0x{:08X} filesz={} memsz={} offset={}", 
                              p_vaddr, p_filesz, p_memsz, p_offset);
                }
            }
        }
    }
    
    // Now boot the hexedit and check if any writes to 0x60000000 happen
    // by checking the write watchpoint
    vm.bus.write_watch_addr = Some(0x6000_0000);
    
    // Reset
    let mut vm2 = RiscvVm::new(1024 * 1024);
    vm2.bus.write_watch_addr = Some(0x6000_0000);
    vm2.bus.write_watch_hit = false;
    
    let _boot = vm2.boot_guest(&elf_data, 1, 500_000).expect("boot");
    
    eprintln!("\nWrite watchpoint at 0x60000000:");
    eprintln!("  hit: {}", vm2.bus.write_watch_hit);
    if vm2.bus.write_watch_hit {
        eprintln!("  val: 0x{:08X}", vm2.bus.write_watch_val);
    }
    eprintln!("  pc: 0x{:08X}", vm2.cpu.pc);
}
