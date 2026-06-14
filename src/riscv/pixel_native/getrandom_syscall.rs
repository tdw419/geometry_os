// Pixel-native getrandom syscall implementation
// getrandom: obtain a series of random bytes

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native getrandom syscall (Linux syscall 278)
/// ssize_t getrandom(void *buf, size_t buflen, unsigned int flags)
pub fn syscall_getrandom_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let buf_ptr = cpu.x[10]; // a0: void *buf
    let buflen = cpu.x[11];  // a1: size_t buflen

    let mtime_addr = 0x0200_BFF8u64;
    let mut seed = bus.read_word(mtime_addr).unwrap_or(0x12345678) as u64;

    for i in 0..buflen {
        seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1);
        let byte = ((seed >> 32) & 0xFF) as u8;

        let pa = match cpu.translate_va(buf_ptr + i, AccessType::Store, bus) {
            Ok(p) => p,
            Err(_) => return Some(0xFFFFFFF2), // -EFAULT
        };

        if bus.write_byte(pa, byte).is_err() {
            return Some(0xFFFFFFF2);
        }
    }

    Some(buflen)
}
