// Pixel-native sysinfo syscall implementation
// sysinfo: returns system information

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native sysinfo syscall (Linux syscall 179)
/// int sysinfo(struct sysinfo *info)
pub fn syscall_sysinfo_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let info_ptr = cpu.x[10]; // a0: struct sysinfo *info

    // Assume 10 MHz timer
    let mtime_addr = 0x0200_BFF8u64;
    let mtime = bus.read_word(mtime_addr).unwrap_or(0) as u64;
    let uptime = mtime / 10_000_000;

    let pa = match cpu.translate_va(info_ptr, AccessType::Store, bus) {
        Ok(p) => p,
        Err(_) => return Some(0xFFFFFFF2), // -EFAULT
    };

    // Helper closure to write a 32-bit word
    let write_word = |bus: &mut Bus, offset: u32, val: u32| -> Result<(), ()> {
        bus.write_word(pa + offset as u64, val).map_err(|_| ())
    };

    // Helper closure to write a 16-bit halfword
    let write_half = |bus: &mut Bus, offset: u32, val: u16| -> Result<(), ()> {
        bus.write_half(pa + offset as u64, val).map_err(|_| ())
    };

    // uptime (0)
    if write_word(bus, 0, uptime as u32).is_err() { return Some(0xFFFFFFF2); }
    // loads[0] (4), loads[1] (8), loads[2] (12)
    if write_word(bus, 4, 0).is_err() { return Some(0xFFFFFFF2); }
    if write_word(bus, 8, 0).is_err() { return Some(0xFFFFFFF2); }
    if write_word(bus, 12, 0).is_err() { return Some(0xFFFFFFF2); }
    // totalram (16)
    if write_word(bus, 16, 64 * 1024 * 1024).is_err() { return Some(0xFFFFFFF2); }
    // freeram (20)
    if write_word(bus, 20, 32 * 1024 * 1024).is_err() { return Some(0xFFFFFFF2); }
    // sharedram (24)
    if write_word(bus, 24, 0).is_err() { return Some(0xFFFFFFF2); }
    // bufferram (28)
    if write_word(bus, 28, 0).is_err() { return Some(0xFFFFFFF2); }
    // totalswap (32)
    if write_word(bus, 32, 0).is_err() { return Some(0xFFFFFFF2); }
    // freeswap (36)
    if write_word(bus, 36, 0).is_err() { return Some(0xFFFFFFF2); }
    // procs (40)
    if write_half(bus, 40, 1).is_err() { return Some(0xFFFFFFF2); }
    // pad (42)
    if write_half(bus, 42, 0).is_err() { return Some(0xFFFFFFF2); }
    // totalhigh (44)
    if write_word(bus, 44, 0).is_err() { return Some(0xFFFFFFF2); }
    // freehigh (48)
    if write_word(bus, 48, 0).is_err() { return Some(0xFFFFFFF2); }
    // mem_unit (52)
    if write_word(bus, 52, 1).is_err() { return Some(0xFFFFFFF2); }

    Some(0)
}
