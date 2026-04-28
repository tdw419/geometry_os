// kern_clip_test.rs -- Verify region clipping for Phase I deliverable i.2.2
use geometry_os::riscv::RiscvVm;
use std::env;
use std::fs;

fn main() {
    let elf_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/riscv-hello/geos_kern.elf".into());
    let elf = fs::read(&elf_path).expect("read elf");
    let mut vm = RiscvVm::new(1024 * 1024);
    
    // Run 5M instructions -- enough for initial program setup + some timer ticks
    let r = vm.boot_guest(&elf, 1, 5_000_000).expect("boot");
    eprintln!("[clip_test] entry=0x{:08X} ran {} instructions", r.entry, r.instructions);
    
    // Check console output for key messages
    let raw = &vm.bus.sbi.console_output;
    let s = String::from_utf8_lossy(raw);
    
    let has_arbitration = s.contains("i.2.1 arbitration");
    let has_scheduler = s.contains("entering scheduler");
    let has_region_req = s.contains("requested region");
    let has_painted_a = s.contains("[A] painted left half red");
    let has_painted_b = s.contains("[B] painted right half blue");
    let has_clipped = s.contains("clipped");
    
    eprintln!("\n=== Console Analysis ===");
    eprintln!("  arbitration msg:  {}", has_arbitration);
    eprintln!("  scheduler msg:    {}", has_scheduler);
    eprintln!("  region request:   {}", has_region_req);
    eprintln!("  A painted red:    {}", has_painted_a);
    eprintln!("  B painted blue:   {}", has_painted_b);
    eprintln!("  A clipped msg:    {}", has_clipped);
    
    // Print non-T characters (filter out timer ticks)
    eprintln!("\n=== Non-tick console ===");
    for line in s.lines() {
        if !line.chars().all(|c| c == 'T') && !line.is_empty() {
            eprintln!("  {}", line);
        }
    }
    
    // Check framebuffer for clipping: left half should be red, right half should NOT be white
    let fb_base = 0x6000_0000u64;
    let mut left_red_count = 0u32;
    let mut left_other_count = 0u32;
    let mut right_white_count = 0u32;
    let mut right_other_count = 0u32;
    let mut sample_count = 0u32;
    
    // Sample 100 pixels from each half
    for i in 0..100u32 {
        // Left half (x=10, y=i*2+10)
        let px = 10u64;
        let py = (i as u64) * 2 + 10;
        let addr = fb_base + (py * 256 + px) * 4;
        let val = vm.bus.read_word(addr).unwrap_or(0);
        // Check if red-ish (R > 200, G < 50, B < 50)
        let r_ch = (val >> 16) & 0xFF;
        let g_ch = (val >> 8) & 0xFF;
        let b_ch = val & 0xFF;
        if r_ch > 200 && g_ch < 50 && b_ch < 50 {
            left_red_count += 1;
        } else {
            left_other_count += 1;
        }
        
        // Right half (x=140, y=i*2+10)
        let px2 = 140u64;
        let addr2 = fb_base + (py * 256 + px2) * 4;
        let val2 = vm.bus.read_word(addr2).unwrap_or(0);
        let r2 = (val2 >> 16) & 0xFF;
        let g2 = (val2 >> 8) & 0xFF;
        let b2 = val2 & 0xFF;
        if r2 > 200 && g2 > 200 && b2 > 200 {
            right_white_count += 1;
        } else {
            right_other_count += 1;
        }
        sample_count += 1;
    }
    
    eprintln!("\n=== Framebuffer Analysis ({} samples/half) ===", sample_count);
    eprintln!("  Left half:  red={} other={}", left_red_count, left_other_count);
    eprintln!("  Right half: white={} other={}", right_white_count, right_other_count);
    
    // Verdicts
    eprintln!("\n=== Verdicts ===");
    if has_region_req {
        eprintln!("  [PASS] Region requests are being processed");
    } else {
        eprintln!("  [FAIL] Region requests NOT processed -- SBI handler issue?");
    }
    
    if left_red_count > 50 {
        eprintln!("  [PASS] Left half is predominantly red (A painted correctly)");
    } else {
        eprintln!("  [FAIL] Left half is NOT red -- program A may not have run");
    }
    
    // Clipping test: if A tried to paint right half white, it should have been blocked
    // (right_white_count should be 0 or very low)
    if right_white_count < 10 {
        eprintln!("  [PASS] Right half is NOT white -- clipping is working!");
    } else {
        eprintln!("  [FAIL] Right half has white pixels -- clipping is NOT working!");
    }
}
