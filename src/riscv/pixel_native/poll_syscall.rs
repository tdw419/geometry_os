// Pixel-native poll syscall implementation
// poll: wait for some event on a file descriptor

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;
use crate::riscv::mmu::AccessType;

/// Pixel-native poll syscall (Linux syscall 73)
/// int poll(struct pollfd *fds, nfds_t nfds, int timeout)
pub fn syscall_poll_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fds_ptr = cpu.x[10]; // a0: struct pollfd *fds
    let nfds = cpu.x[11];    // a1: nfds_t nfds
    let _timeout = cpu.x[12] as i32; // a2: timeout

    if fds_ptr != 0 && nfds > 0 {
        for i in 0..nfds {
            let entry_ptr = fds_ptr + i * 8;
            let pa = match cpu.translate_va(entry_ptr, AccessType::Store, bus) {
                Ok(p) => p,
                Err(_) => return Some(0xFFFFFFF2), // -EFAULT
            };

            // Zero out revents (offset 6, 2 bytes)
            if bus.write_half(pa + 6, 0).is_err() {
                return Some(0xFFFFFFF2);
            }
        }
    }

    Some(0)
}
