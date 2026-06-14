use std::fs::File;
use std::os::unix::io::AsRawFd;
use std::ptr;

// ioctl constants for Linux framebuffer
const FBIOGET_VSCREENINFO: libc::c_ulong = 0x4601;
const FBIOGET_FSCREENINFO: libc::c_ulong = 0x4602;

#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
struct FbBitfield {
    offset: u32,
    length: u32,
    msb_right: u32,
}

#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
struct FbVarScreeninfo {
    xres: u32,
    yres: u32,
    xres_virtual: u32,
    yres_virtual: u32,
    xoffset: u32,
    yoffset: u32,
    bits_per_pixel: u32,
    grayscale: u32,
    red: FbBitfield,
    green: FbBitfield,
    blue: FbBitfield,
    transp: FbBitfield,
    nonstd: u32,
    activate: u32,
    height: u32,
    width: u32,
    accel_flags: u32,
    pixclock: u32,
    left_margin: u32,
    right_margin: u32,
    upper_margin: u32,
    lower_margin: u32,
    hsync_len: u32,
    vsync_len: u32,
    sync: u32,
    vmode: u32,
    rotate: u32,
    colorspace: u32,
    reserved: [u32; 4],
}

#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
struct FbFixScreeninfo {
    id: [u8; 16],
    smem_start: libc::c_ulong,
    smem_len: u32,
    type_: u32,
    type_aux: u32,
    visual: u32,
    xpanstep: u16,
    ypanstep: u16,
    ywrapstep: u16,
    line_length: u32,
    mmio_start: libc::c_ulong,
    mmio_len: u32,
    accel: u32,
    capabilities: u16,
    reserved: [u16; 2],
}

pub struct Framebuffer {
    _file: File,
    mapped_ptr: *mut libc::c_void,
    mapped_size: usize,
    pub width: usize,
    pub height: usize,
    pub bpp: usize,
    pub line_length: usize,
}

impl Framebuffer {
    pub fn new() -> Result<Self, String> {
        let file = File::options()
            .read(true)
            .write(true)
            .open("/dev/fb0")
            .map_err(|e| format!("Failed to open /dev/fb0: {}", e))?;

        let fd = file.as_raw_fd();

        let mut var_info = FbVarScreeninfo::default();
        let mut fix_info = FbFixScreeninfo::default();

        unsafe {
            if libc::ioctl(fd, FBIOGET_VSCREENINFO, &mut var_info) < 0 {
                return Err("Failed to get var screen info via ioctl".to_string());
            }
            if libc::ioctl(fd, FBIOGET_FSCREENINFO, &mut fix_info) < 0 {
                return Err("Failed to get fix screen info via ioctl".to_string());
            }
        }

        let mapped_size = fix_info.smem_len as usize;
        let mapped_ptr = unsafe {
            libc::mmap(
                ptr::null_mut(),
                mapped_size,
                libc::PROT_READ | libc::PROT_WRITE,
                libc::MAP_SHARED,
                fd,
                0,
            )
        };

        if mapped_ptr == libc::MAP_FAILED {
            return Err("Failed to mmap framebuffer memory".to_string());
        }

        println!(
            "[fb0] Mapped {} bytes. Resolution: {}x{} @ {}bpp. Pitch: {}",
            mapped_size,
            var_info.xres,
            var_info.yres,
            var_info.bits_per_pixel,
            fix_info.line_length
        );

        Ok(Framebuffer {
            _file: file,
            mapped_ptr,
            mapped_size,
            width: var_info.xres as usize,
            height: var_info.yres as usize,
            bpp: var_info.bits_per_pixel as usize,
            line_length: fix_info.line_length as usize,
        })
    }

    /// Blit canvas buffer `src` (format 0xRRGGBB) to mapped framebuffer memory.
    /// Handles simple scaling/clipping if size mismatches.
    pub unsafe fn blit(&mut self, src: &[u32], src_w: usize, src_h: usize) {
        if self.bpp != 32 {
            // Unimplemented color depth
            return;
        }

        let dest_pitch_pixels = self.line_length / 4;
        let blit_w = src_w.min(self.width);
        let blit_h = src_h.min(self.height);

        let dest_slice =
            std::slice::from_raw_parts_mut(self.mapped_ptr as *mut u32, self.mapped_size / 4);

        for y in 0..blit_h {
            let src_row_offset = y * src_w;
            let dest_row_offset = y * dest_pitch_pixels;
            for x in 0..blit_w {
                let pixel = src[src_row_offset + x];
                // Convert 0xRRGGBB format to BGRA/RGBA based on typical FB layout
                // In /dev/fb0, color format is typically BGRA or RGBA
                let r = (pixel >> 16) & 0xFF;
                let g = (pixel >> 8) & 0xFF;
                let b = pixel & 0xFF;
                let converted_pixel = (b << 16) | (g << 8) | r | 0xFF000000;

                let dest_idx = dest_row_offset + x;
                if dest_idx < dest_slice.len() {
                    dest_slice[dest_idx] = converted_pixel;
                }
            }
        }
    }
}

impl Drop for Framebuffer {
    fn drop(&mut self) {
        unsafe {
            libc::munmap(self.mapped_ptr, self.mapped_size);
        }
    }
}
