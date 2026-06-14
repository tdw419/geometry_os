// Pixel-native sendto syscall implementation
// sendto: send a message on a socket

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native sendto syscall (Linux syscall 206)
/// ssize_t sendto(int sockfd, const void *buf, size_t len, int flags,
///                const struct sockaddr *dest_addr, socklen_t addrlen)
pub fn syscall_sendto_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10] as i32;         // a0: socket fd
    let buf_ptr = cpu.x[11] as u32;    // a1: buffer pointer
    let len = cpu.x[12] as u32;        // a2: length
    let flags = cpu.x[13] as u32;      // a3: flags
    let addr_ptr = cpu.x[14] as u32;   // a4: dest address pointer
    let addr_len = cpu.x[15] as u32;   // a5: address length

    let ret = bus.intercept_sendto(fd, buf_ptr, len, flags, addr_ptr, addr_len);
    cpu.x[10] = ret as u32;
    Some(ret as u32)
}
