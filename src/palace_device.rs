// palace_device.rs — /dev/palace pixel buffer driver bindings
//
// Provides direct mmap access to the 256KB /dev/palace kernel buffer.
// When /dev/palace is available, this replaces the Python FUSE socket
// bridge entirely:
//
//   BEFORE: GeoOS ↔ socket ↔ Python FUSE ↔ FUSE mount ↔ QEMU
//   AFTER:  GeoOS → mmap(/dev/palace) → QEMU (via loopback)
//
// The buffer is 256x256 RGBA pixels = 262,144 bytes.
// Each pixel is 4 bytes: R, G, B, A.

use std::fs::{File, OpenOptions};
use std::io;
use std::os::unix::io::AsRawFd;
use std::ptr;

const PALACE_PATH: &str = "/dev/palace";
const PALACE_SIZE: usize = 256 * 1024; // 256 KB

/// Result of trying to open /dev/palace.
pub enum PalaceDevice {
    /// Mapped successfully — buffer is a raw pointer to the 256KB region.
    Mapped {
        /// Memory-mapped buffer (256KB).
        file: File,
        ptr: *mut u8,
    },
    /// /dev/palace not available — use fallback (socket/backing file).
    NotAvailable,
}

impl PalaceDevice {
    /// Try to open and mmap /dev/palace.
    ///
    /// Returns `Mapped` on success, `NotAvailable` if the device doesn't exist
    /// or if mmap fails.
    pub fn open() -> Self {
        let file = match OpenOptions::new().read(true).write(true).open(PALACE_PATH) {
            Ok(f) => f,
            Err(_) => {
                // /dev/palace kernel module not loaded
                return PalaceDevice::NotAvailable;
            },
        };

        let fd = file.as_raw_fd();

        // Safety: /dev/palace is a kernel char device that supports mmap.
        // The kernel allocates physically contiguous memory.
        let ptr = unsafe {
            libc::mmap(
                ptr::null_mut(),
                PALACE_SIZE,
                libc::PROT_READ | libc::PROT_WRITE,
                libc::MAP_SHARED,
                fd,
                0,
            )
        };

        if ptr == libc::MAP_FAILED {
            let err = io::Error::last_os_error();
            eprintln!("[palace_device] mmap failed: {}", err);
            return PalaceDevice::NotAvailable;
        }

        eprintln!("[palace_device] mmap'd /dev/palace: 256 KB at {:p}", ptr);

        PalaceDevice::Mapped {
            file,
            ptr: ptr as *mut u8,
        }
    }

    /// Read a pixel at (x, y). Returns (R, G, B, A).
    ///
    /// # Safety
    ///
    /// Only call if `PalaceDevice::Mapped` — panics otherwise.
    pub unsafe fn get_pixel(&self, x: usize, y: usize) -> (u8, u8, u8, u8) {
        match self {
            PalaceDevice::Mapped { ptr, .. } => {
                let offset = (y * 256 + x) * 4;
                let buf = unsafe { std::slice::from_raw_parts(*ptr, PALACE_SIZE) };
                (
                    buf[offset],
                    buf[offset + 1],
                    buf[offset + 2],
                    buf[offset + 3],
                )
            },
            PalaceDevice::NotAvailable => {
                panic!("palace_device: get_pixel called when not available")
            },
        }
    }

    /// Write a pixel at (x, y) with RGBA values.
    ///
    /// # Safety
    ///
    /// Only call if `PalaceDevice::Mapped` — panics otherwise.
    pub unsafe fn set_pixel(&self, x: usize, y: usize, r: u8, g: u8, b: u8, a: u8) {
        match self {
            PalaceDevice::Mapped { ptr, .. } => {
                let offset = (y * 256 + x) * 4;
                let buf = unsafe { std::slice::from_raw_parts_mut(*ptr, PALACE_SIZE) };
                buf[offset] = r;
                buf[offset + 1] = g;
                buf[offset + 2] = b;
                buf[offset + 3] = a;
            },
            PalaceDevice::NotAvailable => {
                panic!("palace_device: set_pixel called when not available")
            },
        }
    }

    /// Get a mutable slice of the entire buffer.
    ///
    /// # Safety
    ///
    /// Only call if `PalaceDevice::Mapped` — panics otherwise.
    pub unsafe fn as_mut_slice(&mut self) -> &mut [u8] {
        match self {
            PalaceDevice::Mapped { ptr, .. } => unsafe {
                std::slice::from_raw_parts_mut(*ptr, PALACE_SIZE)
            },
            PalaceDevice::NotAvailable => {
                panic!("palace_device: as_mut_slice called when not available")
            },
        }
    }

    /// Get an immutable slice of the entire buffer.
    ///
    /// # Safety
    ///
    /// Only call if `PalaceDevice::Mapped` — panics otherwise.
    pub unsafe fn as_slice(&self) -> &[u8] {
        match self {
            PalaceDevice::Mapped { ptr, .. } => unsafe {
                std::slice::from_raw_parts(*ptr, PALACE_SIZE)
            },
            PalaceDevice::NotAvailable => {
                panic!("palace_device: as_slice called when not available")
            },
        }
    }

    /// Copy from an external buffer into /dev/palace.
    pub fn write_buffer(&self, data: &[u8], offset: usize) -> usize {
        match self {
            PalaceDevice::Mapped { ptr, .. } => {
                let end = (offset + data.len()).min(PALACE_SIZE);
                let count = end - offset;
                if count == 0 {
                    return 0;
                }
                unsafe {
                    std::ptr::copy_nonoverlapping(data.as_ptr(), (*ptr).add(offset), count);
                }
                count
            },
            PalaceDevice::NotAvailable => 0,
        }
    }

    /// Read from /dev/palace into an external buffer.
    pub fn read_buffer(&self, data: &mut [u8], offset: usize) -> usize {
        match self {
            PalaceDevice::Mapped { ptr, .. } => {
                let end = (offset + data.len()).min(PALACE_SIZE);
                let count = end - offset;
                if count == 0 {
                    return 0;
                }
                unsafe {
                    std::ptr::copy_nonoverlapping((*ptr).add(offset), data.as_mut_ptr(), count);
                }
                count
            },
            PalaceDevice::NotAvailable => 0,
        }
    }

    /// Check if /dev/palace is available.
    pub fn is_available(&self) -> bool {
        matches!(self, PalaceDevice::Mapped { .. })
    }
}

impl Drop for PalaceDevice {
    fn drop(&mut self) {
        if let PalaceDevice::Mapped { ptr, .. } = self {
            unsafe {
                libc::munmap(*ptr as *mut libc::c_void, PALACE_SIZE);
            }
            eprintln!("[palace_device] unmapped /dev/palace");
        }
    }
}

unsafe impl Send for PalaceDevice {}
unsafe impl Sync for PalaceDevice {}
