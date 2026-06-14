// Pixel-native connect syscall implementation
// connect: initiate a connection on a socket

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native connect syscall (Linux syscall 203)
/// int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)
pub fn syscall_connect_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10] as i32;        // a0: socket fd
    let addr_ptr = cpu.x[11] as u32;  // a1: sockaddr pointer
    let addr_len = cpu.x[12] as u32;  // a2: address length

    let ret = bus.intercept_connect(fd, addr_ptr, addr_len);
    cpu.x[10] = ret as u32;
    Some(ret as u32)
}
