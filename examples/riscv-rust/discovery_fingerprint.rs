// Geometry OS - Behavioral Fingerprinting Agent
// Probes MMIO regions to deduce register functionality through experimentation.

#![no_std]
#![no_main]

use core::panic::PanicInfo;
use core::arch::global_asm;

global_asm!(
    ".section .text.entry",
    ".globl _start",
    "_start:",
    "   lui     sp, 0x80100",
    "   la      t0, __bss_start",
    "   la      t1, __bss_end",
    "2: bge     t0, t1, 3f",
    "   sw      zero, 0(t0)",
    "   addi    t0, t0, 4",
    "   j       2b",
    "3: jal     ra, rust_entry",
    "   li      a7, 8",
    "   ecall",
);

const MMIO_BASES: [u32; 4] = [
    0x10000000, // UART
    0x10001000, // VirtIO Slot 0 (Block)
    0x10002000, // VirtIO Slot 1 (Net)
    0x60000000, // Framebuffer
];

#[no_mangle]
pub extern "C" fn rust_entry() {
    print_sbi("Geometry OS Behavioral Fingerprinting v1.2\n");
    print_sbi("Deep VIRTIO Deducation Active.\n\n");

    for &base in &MMIO_BASES {
        print_sbi("--- Probing Base ");
        print_hex(base);
        print_sbi(" ---\n");

        let magic = mmio_read(base);
        if magic == 0x74726976 {
            print_sbi("  VIRTIO DETECTED.\n");
            
            let version = mmio_read(base + 0x04);
            let device_id = mmio_read(base + 0x08);
            let vendor_id = mmio_read(base + 0x0C);
            
            print_sbi("    Version:  "); print_hex(version); print_sbi("\n");
            print_sbi("    DeviceID: "); print_hex(device_id); print_sbi("\n");
            print_sbi("    VendorID: "); print_hex(vendor_id); print_sbi("\n");
            
            // Status Negotiation Probe
            print_sbi("    Status Probe: Writing ACKNOWLEDGE(1) | DRIVER(2)... ");
            mmio_write(base + 0x28, 1 | 2);
            let status = mmio_read(base + 0x28);
            if (status & 3) == 3 {
                print_sbi("SUCCESS (Stuck)\n");
            } else {
                print_sbi("FAILED (Read="); print_hex(status); print_sbi(")\n");
            }
            
            // Reset status for cleanliness
            mmio_write(base + 0x28, 0);

            print_sbi("    Queue Deducation:\n");
            for i in 0..4 {
                mmio_write(base + 0x30, i); // QueueSel
                let max = mmio_read(base + 0x34); // QueueNumMax
                if max > 0 {
                    print_sbi("      Queue ");
                    print_int(i as i32);
                    print_sbi(": MaxSize=");
                    print_int(max as i32);
                    print_sbi("\n");
                }
            }
        } else {
            // Standard Behavioral Probe
            print_sbi("  Register Snapshot (offsets 0-7):\n");
            for offset in 0..8 {
                let val = mmio_read(base + (offset * 4));
                print_sbi("    [+");
                print_hex(offset * 4);
                print_sbi("] = ");
                print_hex(val);
                print_sbi("\n");
            }

            // Write Experiment (TX Probe / Buffer Probe)
            print_sbi("  Experiment: Writing '!' (0x21) to offset 0x00\n");
            mmio_write(base, 0x21);
            
            print_sbi("  Post-write Snapshot:\n");
            for offset in 0..8 {
                let val = mmio_read(base + (offset * 4));
                print_sbi("    [+");
                print_hex(offset * 4);
                print_sbi("] = ");
                print_hex(val);
                print_sbi("\n");
            }
        }
    }

    print_sbi("\nFingerprinting Complete.\n");
    sbi_shutdown();
}

#[inline(always)]
fn mmio_read(addr: u32) -> u32 {
    unsafe { core::ptr::read_volatile(addr as *const u32) }
}

#[inline(always)]
fn mmio_write(addr: u32, val: u32) {
    unsafe { core::ptr::write_volatile(addr as *mut u32, val) }
}

fn sbi_putchar(ch: u8) {
    unsafe {
        core::arch::asm!(
            "ecall",
            in("a7") 1,
            inout("a0") ch as u32 => _,
            out("a1") _,
            options(nostack),
        );
    }
}

fn sbi_shutdown() -> ! {
    unsafe {
        core::arch::asm!(
            "ecall",
            in("a7") 8,
            out("a0") _,
            out("a1") _,
            options(nostack),
        );
    }
    loop {}
}

fn print_sbi(s: &str) {
    for &b in s.as_bytes() {
        sbi_putchar(b);
    }
}

fn print_hex(val: u32) {
    let chars = b"0123456789ABCDEF";
    for i in (0..8).rev() {
        let nibble = ((val >> (i * 4)) & 0xF) as usize;
        sbi_putchar(chars[nibble]);
    }
}

fn print_int(mut n: i32) {
    if n == 0 {
        sbi_putchar(b'0');
        return;
    }
    if n < 0 {
        sbi_putchar(b'-');
        n = -n;
    }
    let mut buf = [0u8; 10];
    let mut i = 0;
    while n > 0 {
        buf[i] = (n % 10) as u8 + b'0';
        n /= 10;
        i += 1;
    }
    for j in (0..i).rev() {
        sbi_putchar(buf[j]);
    }
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    sbi_shutdown();
}
