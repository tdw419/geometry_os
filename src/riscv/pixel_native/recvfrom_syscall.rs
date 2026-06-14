// Pixel-native recvfrom syscall implementation
// recvfrom: receive a message from a socket

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native recvfrom syscall (Linux syscall 207)
/// ssize_t recvfrom(int sockfd, void *buf, size_t len, int flags,
///                  struct sockaddr *src_addr, socklen_t *addrlen)
pub fn syscall_recvfrom_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10] as i32;        // a0: socket fd
    let buf_ptr = cpu.x[11] as u32;   // a1: buffer pointer
    let len = cpu.x[12] as u32;       // a2: length
    let flags = cpu.x[13] as u32;     // a3: flags

    let ret = bus.intercept_recvfrom(fd, buf_ptr, len, flags);
    cpu.x[10] = ret as u32;
    Some(ret as u32)
}
