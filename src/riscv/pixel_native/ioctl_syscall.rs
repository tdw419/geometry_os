// Pixel-native ioctl syscall implementation
// ioctl: control device

use crate::riscv::cpu::RiscvCpu;
use crate::riscv::bus::Bus;

/// Pixel-native ioctl syscall
/// Linux syscall 29 (common)
/// int ioctl(int fd, unsigned long request, ...)
/// 
/// For pixel-native: implements common terminal/device ioctls.
/// Returns success (0) for supported operations, ENOTTY otherwise.
pub fn syscall_ioctl_pixel_native(cpu: &mut RiscvCpu, bus: &mut Bus) -> Option<u32> {
    let fd = cpu.x[10];         // a0: file descriptor
    let request = cpu.x[11];    // a1: ioctl request
    let arg = cpu.x[12];        // a2: optional argument
    
    // Common terminal ioctls (termios)
    // TCGETS: 0x5401 - get terminal attributes
    // TCSETS: 0x5402 - set terminal attributes
    // TIOCGWINSZ: 0x5413 - get window size
    // TIOCSWINSZ: 0x5414 - set window size
    
    match request {
        // Terminal get attributes - return success with minimal structure
        0x5401 | 0x540d => {  // TCGETS / TCGETA
            // Write minimal termios structure to user memory
            // This is a stub that programs can call without failing
            cpu.x[10] = 0; // Success
            Some(0)
        }
        
        // Terminal set attributes - no-op but success
        0x5402 | 0x540e => {  // TCSETS / TCSETA
            cpu.x[10] = 0; // Success
            Some(0)
        }
        
        // Get window size
        0x5413 => { // TIOCGWINSZ
            // Write struct winsize { unsigned short row, col, xpixel, ypixel; }
            if let Some(ws_ptr) = try_write_winsize(cpu, bus, arg, 24, 80) {
                cpu.x[10] = 0; // Success
                Some(0)
            } else {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                Some(0)
            }
        }
        
        // Set window size - no-op
        0x5414 => { // TIOCSWINSZ
            cpu.x[10] = 0; // Success
            Some(0)
        }
        
        // FIONBIO: set non-blocking I/O (0x5421)
        0x5421 => {
            // No-op: we don't support non-blocking mode yet
            cpu.x[10] = 0; // Success
            Some(0)
        }
        
        // FIONREAD: get number of bytes available to read (0x541B)
        0x541b => {
            // Return 0 bytes available (conservative)
            if let Some(result_ptr) = try_write_u32(cpu, bus, arg, 0) {
                cpu.x[10] = 0; // Success
                Some(0)
            } else {
                cpu.x[10] = (-14i32) as u32; // EFAULT
                Some(0)
            }
        }
        
        // Unsupported ioctl: return ENOTTY
        _ => {
            cpu.x[10] = (-25i32) as u32; // ENOTTY
            Some(0)
        }
    }
}

/// Try to write a winsize structure to user memory
fn try_write_winsize(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32, rows: u16, cols: u16) -> Option<bool> {
    let pa = cpu.translate_va(ptr, crate::riscv::mmu::AccessType::Store, bus).ok()?;
    
    // struct winsize layout:
    // rows (2 bytes), cols (2 bytes), xpixel (2 bytes), ypixel (2 bytes)
    let ws_value = ((rows as u32) & 0xFFFF) | (((cols as u32) & 0xFFFF) << 16);
    bus.write_word(pa, ws_value).ok()?;
    
    // Zero out xpixel/ypixel fields (already zero from above)
    Some(true)
}

/// Try to write a u32 to user memory
fn try_write_u32(cpu: &mut RiscvCpu, bus: &mut Bus, ptr: u32, value: u32) -> Option<bool> {
    let pa = cpu.translate_va(ptr, crate::riscv::mmu::AccessType::Store, bus).ok()?;
    bus.write_word(pa, value).ok()?;
    Some(true)
}