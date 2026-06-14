// Pixel-native shutdown syscall implementation
// shutdown: shut down part of a full-duplex connection

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native shutdown syscall (Linux syscall 210)
/// int shutdown(int sockfd, int how)
pub fn syscall_shutdown_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10] as i32;   // a0: socket fd
    let how = cpu.x[11] as u32;  // a1: how (SHUT_RD=0, SHUT_WR=1, SHUT_RDWR=2)

    let ret = bus.guest_sockets.sys_shutdown(fd, how);
    cpu.x[10] = ret as u32;
    Some(ret as u32)
}
