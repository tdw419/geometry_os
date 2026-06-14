// Debug: Dump kernel memblock reserved regions after boot
use geometry_os::riscv::RiscvVm;
use std::fs;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path).expect("kernel not found");

    let bootargs = "earlycon=sbi nosmp loglevel=8";

    // Boot WITHOUT initrd
    let (mut vm, result) = RiscvVm::boot_linux(
        &kernel_data,
        None, // no initrd
        512,
        200_000_000,
        bootargs,
    )
    .expect("boot failed");

    eprintln!(
        "Result: {:?} instrs, entry=0x{:08X}, dtb=0x{:08X}",
        result.instructions, result.entry, result.dtb_addr
    );
    eprintln!("PC=0x{:08X} priv={:?}", vm.cpu.pc, vm.cpu.privilege);

    // Dump console output
    let sbi_out = vm.bus.sbi.console_output.clone();
    println!("SBI output ({} bytes):", sbi_out.len());
    println!("{}", String::from_utf8_lossy(&sbi_out));

    // Dump memblock struct at PA 0x80803448
    let mb_pa: u64 = 0x80803448;
    println!("\n=== memblock struct at PA 0x{:08X} ===", mb_pa);
    for i in (0..120).step_by(4) {
        let val = vm.bus.read_word(mb_pa + i).unwrap_or(0xDEAD);
        print!(" +{:3}: 0x{:08X}", i, val);
        if (i / 4) % 4 == 3 {
            println!();
        }
    }
    println!();

    // Find reserved regions -- scan for kernel VA pointers
    // On RV32 Linux, struct memblock_type layout:
    //   cnt: u32, max: u32, total_size: u64, name: u32, regions: u32
    // But total_size might be u32 on RV32... let me just look at the raw data
    // and find pointers >= 0xC0000000

    // The kernel ELF's memblock struct is defined with static initialization
    // The reserved regions array is a static array in the kernel
    // Let me find it by looking at System.map
    println!("\n=== Scanning for region arrays (VA pointers >= 0xC0000000) ===");
    for i in (0..120).step_by(4) {
        let val = vm.bus.read_word(mb_pa + i).unwrap_or(0);
        if val >= 0xC0000000 && val < 0xFFFFFFFF {
            let pa = (val as u64).wrapping_sub(0x40000000);
            if pa < 0xA0000000 {
                println!("  +{}: VA 0x{:08X} -> PA 0x{:08X}", i, val, pa);
                // Dump regions
                for j in 0..30 {
                    let base = vm.bus.read_word(pa + j as u64 * 12).unwrap_or(0);
                    let size = vm.bus.read_word(pa + j as u64 * 12 + 4).unwrap_or(0);
                    let flags = vm.bus.read_word(pa + j as u64 * 12 + 8).unwrap_or(0);
                    if size > 0 || base > 0 {
                        println!(
                            "    region[{:2}]: base=0x{:08X} size=0x{:08X} flags=0x{:08X} (end=0x{:08X})",
                            j, base, size, flags, base.wrapping_add(size)
                        );
                    }
                }
            }
        }
    }
}
