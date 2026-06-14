// Pixel-native readv syscall implementation
// readv: read data into multiple iovec buffers

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native readv syscall
/// Linux syscall 65 (RV64)
/// ssize_t readv(int fd, const struct iovec *iov, int iovcnt)
///
/// For pixel-native: currently delegates to single read syscall.
/// TODO: Implement proper vectored read for better performance.
pub fn syscall_readv_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10]; // a0: file descriptor
    let iov_ptr = cpu.x[11]; // a1: iovec array pointer
    let iovcnt = cpu.x[12] as i32; // a2: number of iovec structures

    // Validate iovcnt
    if iovcnt <= 0 {
        cpu.x[10] = (-22i32) as u32; // EINVAL
        return Some(0);
    }

    if iovcnt > 1024 {
        cpu.x[10] = (-22i32) as u32; // EINVAL (too many)
        return Some(0);
    }

    // For simplicity: if only one iovec, delegate to read
    if iovcnt == 1 {
        // Read the iovec structure
        let iovec_pa = match cpu.translate_va(iov_ptr, crate::riscv::mmu::AccessType::Load, bus) {
            Ok(pa) => pa,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };

        let base = match bus.read_word(iovec_pa) {
            Ok(v) => v,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };
        let len = match bus.read_word(iovec_pa + 4) {
            Ok(v) => v,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };

        // Set up read syscall args
        cpu.x[10] = fd;
        cpu.x[11] = base;
        cpu.x[12] = len;

        // Delegate to read syscall (uses same pixel-native read)
        crate::riscv::pixel_native::read_syscall::syscall_read_pixel_native(cpu, bus)
    } else {
        // Multiple iovecs: read first buffer only
        // Conservative implementation - read into first iovec and mark others as zero
        let iovec_pa = match cpu.translate_va(iov_ptr, crate::riscv::mmu::AccessType::Load, bus) {
            Ok(pa) => pa,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };

        let base = match bus.read_word(iovec_pa) {
            Ok(v) => v,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };
        let len = match bus.read_word(iovec_pa + 4) {
            Ok(v) => v,
            Err(_) => {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                return Some(0);
            }
        };

        // Set up read syscall args for first buffer
        cpu.x[10] = fd;
        cpu.x[11] = base;
        cpu.x[12] = len;

        // Delegate to read syscall
        let read_result = crate::riscv::pixel_native::read_syscall::syscall_read_pixel_native(cpu, bus);
        // Preserve the read return value in a0
        if let Some(_) = read_result {
            Some(cpu.x[10])
        } else {
            None
        }
    }
}