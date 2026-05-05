// camera.rs -- Host-side webcam feeder for Geometry OS
//
// Captures frames from /dev/video0 via V4L2 mmap, downscales to 256x256
// using bilinear interpolation, and makes them available as the bottom
// compositor layer. WINSYS windows draw on top -- the robot's "thoughts"
// overlaid on its "eyes".
//
// Usage: geometry_os --camera [--camera-device /dev/video0]
//
// Design: host-side only, not an opcode. The camera is a pixel source,
// not a VM instruction. This keeps the asm surface clean and treats
// the camera as just another background layer the compositor handles.
//
// No new dependencies: V4L2 via libc ioctl, downscaling by hand.

use std::sync::mpsc::{self, TryRecvError};
use std::thread::{self, JoinHandle};

/// A single 256x256 frame from the camera, in 0x00RRGGBB format (same as minifb).
#[derive(Debug, Clone)]
pub struct CameraFrame {
    /// 256*256 pixels, 0x00RRGGBB.
    pub pixels: Vec<u32>,
}

/// Control messages for the camera thread.
enum CameraControl {
    Shutdown,
}

/// Handle to the camera capture thread.
pub struct CameraHandle {
    thread: Option<JoinHandle<()>>,
    control_tx: Option<std::sync::mpsc::Sender<CameraControl>>,
    frame_rx: mpsc::Receiver<CameraFrame>,
}

impl CameraHandle {
    /// Try to receive the latest camera frame (non-blocking).
    /// Returns None if no new frame is available.
    pub fn try_recv_frame(&mut self) -> Option<CameraFrame> {
        let mut latest: Option<CameraFrame> = None;
        loop {
            match self.frame_rx.try_recv() {
                Ok(frame) => latest = Some(frame),
                Err(TryRecvError::Empty) => break,
                Err(TryRecvError::Disconnected) => break,
            }
        }
        latest
    }

    /// Shut down the camera thread and release the device.
    pub fn shutdown(&mut self) {
        if let Some(tx) = self.control_tx.take() {
            let _ = tx.send(CameraControl::Shutdown);
        }
        if let Some(handle) = self.thread.take() {
            let _ = handle.join();
        }
    }
}

impl Drop for CameraHandle {
    fn drop(&mut self) {
        self.shutdown();
    }
}

/// V4L2 format descriptor.
#[repr(C)]
struct V4l2Format {
    type_: u32,
    width: u32,
    height: u32,
    pixelformat: u32,
    field: u32,
    bytesperline: u32,
    sizeimage: u32,
    colorspace: u32,
    priv_: [u8; 24],
}

/// V4L2 buffer (mmap).
#[repr(C)]
struct V4l2Buffer {
    index: u32,
    type_: u32,
    bytesused: u32,
    flags: u32,
    field: u32,
    timestamp: libc::timeval,
    timecode: V4l2Timecode,
    sequence: u32,
    memory: u32,
    m: V4l2BufferMmap,
    length: u32,
    reserved2: [u32; 2],
}

#[repr(C)]
struct V4l2Timecode {
    type_: u32,
    flags: u32,
    frames: u8,
    seconds: u8,
    minutes: u8,
    hours: u8,
    userbits: [u8; 4],
}

#[repr(C)]
union V4l2BufferMmap {
    offset: u32,
    userptr: u64,
    planes: u64,
    fd: i32,
}

// V4L2 ioctl constants
const VIDIOC_QUERYCAP: libc::c_ulong = 0x8068_5600;
const VIDIOC_S_FMT: libc::c_ulong = 0x40C0_5605;
const VIDIOC_REQBUFS: libc::c_ulong = 0xC018_5608;
const VIDIOC_QUERYBUF: libc::c_ulong = 0xC044_5609;
const VIDIOC_QBUF: libc::c_ulong = 0xC044_560A;
const VIDIOC_DQBUF: libc::c_ulong = 0xC044_560B;
const VIDIOC_STREAMON: libc::c_ulong = 0x4004_5614;
const VIDIOC_STREAMOFF: libc::c_ulong = 0x4004_5615;

const V4L2_BUF_TYPE_VIDEO_CAPTURE: u32 = 1;
const V4L2_MEMORY_MMAP: u32 = 1;
const V4L2_FIELD_ANY: u32 = 0;
const V4L2_PIX_FMT_YUYV: u32 = 0x5659_5559; // 'YUYV'
const V4L2_CAP_VIDEO_CAPTURE: u32 = 0x0000_0001;

/// Bilinear downscale a YUYV frame to 256x256 RGB pixels (0x00RRGGBB).
fn downscale_yuyv_to_256x256(
    src: &[u8],
    src_width: u32,
    src_height: u32,
    bytesperline: u32,
) -> Vec<u32> {
    const DST: usize = 256;
    let mut out = vec![0u32; DST * DST];

    let sw = src_width as f32;
    let sh = src_height as f32;

    for dy in 0..DST {
        // Map destination y to source y (center of pixel)
        let sy = (dy as f32 + 0.5) * sh / DST as f32 - 0.5;
        let sy0 = sy.floor().max(0.0) as usize;
        let sy1 = (sy0 + 1).min(src_height as usize - 1);
        let fy = sy - sy.floor().max(0.0);

        for dx in 0..DST {
            // Map destination x to source x
            // YUYV packs 2 pixels per 4 bytes, so we need even x for clean sampling
            let sx = (dx as f32 + 0.5) * sw / DST as f32 - 0.5;
            let sx0 = (sx.floor().max(0.0) as usize / 2) * 2; // snap to even
            let sx1 = (sx0 + 2).min((src_width as usize / 2) * 2);
            let fx = sx - sx.floor().max(0.0);

            // Sample 4 source pixels (bilinear)
            let sample = |sx: usize, sy: usize| -> (u8, u8, u8) {
                let offset = sy as usize * bytesperline as usize + sx as usize * 2;
                if offset + 3 >= src.len() {
                    return (0, 0, 0);
                }
                let y0 = src[offset] as f32;
                let u = src[offset + 1] as f32;
                let y1 = src[offset + 2] as f32;
                let v = src[offset + 3] as f32;

                // Average Y for the pair
                let y_avg = (y0 + y1) / 2.0;

                // YUV to RGB (BT.601)
                let c = y_avg - 16.0;
                let d = u - 128.0;
                let e = v - 128.0;

                let r = (1.164 * c + 1.596 * e).clamp(0.0, 255.0) as u8;
                let g = (1.164 * c - 0.392 * d - 0.813 * e).clamp(0.0, 255.0) as u8;
                let b = (1.164 * c + 2.017 * d).clamp(0.0, 255.0) as u8;
                (r, g, b)
            };

            let p00 = sample(sx0, sy0);
            let p10 = sample(sx1, sy0);
            let p01 = sample(sx0, sy1);
            let p11 = sample(sx1, sy1);

            let fx1 = 1.0 - fx;
            let fy1 = 1.0 - fy;

            let r = (p00.0 as f32 * fx1 * fy1
                + p10.0 as f32 * fx * fy1
                + p01.0 as f32 * fx1 * fy
                + p11.0 as f32 * fx * fy) as u8;
            let g = (p00.1 as f32 * fx1 * fy1
                + p10.1 as f32 * fx * fy1
                + p01.1 as f32 * fx1 * fy
                + p11.1 as f32 * fx * fy) as u8;
            let b = (p00.2 as f32 * fx1 * fy1
                + p10.2 as f32 * fx * fy1
                + p01.2 as f32 * fx1 * fy
                + p11.2 as f32 * fx * fy) as u8;

            out[dy * DST + dx] = ((r as u32) << 16) | ((g as u32) << 8) | (b as u32);
        }
    }

    out
}

/// Open the camera device and start capturing frames.
/// Returns a handle that provides frames via try_recv_frame().
pub fn open_camera(device: &str) -> Result<CameraHandle, String> {
    let fd = unsafe { libc::open(device.as_ptr() as *const _, libc::O_RDWR) };
    if fd < 0 {
        return Err(format!("Failed to open {}: {}", device, std::io::Error::last_os_error()));
    }

    // Query capabilities
    let mut cap = [0u8; 128]; // v4l2_capability is large, we just check a few bytes
    let ret = unsafe { libc::ioctl(fd, VIDIOC_QUERYCAP, cap.as_mut_ptr()) };
    if ret < 0 {
        unsafe { libc::close(fd) };
        return Err(format!(
            "VIDIOC_QUERYCAP failed: {}",
            std::io::Error::last_os_error()
        ));
    }
    // Check video capture capability (first 4 bytes of device_caps or capabilities)
    let device_caps = u32::from_le_bytes([cap[96], cap[97], cap[98], cap[99]]);
    if device_caps & V4L2_CAP_VIDEO_CAPTURE == 0 {
        unsafe { libc::close(fd) };
        return Err(format!("{} does not support video capture", device));
    }

    // Set format: YUYV (most webcams support this)
    let mut fmt: V4l2Format = unsafe { std::mem::zeroed() };
    fmt.type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    fmt.width = 640;
    fmt.height = 480;
    fmt.pixelformat = V4L2_PIX_FMT_YUYV;
    fmt.field = V4L2_FIELD_ANY;

    let ret = unsafe { libc::ioctl(fd, VIDIOC_S_FMT, &mut fmt) };
    if ret < 0 {
        unsafe { libc::close(fd) };
        return Err(format!(
            "VIDIOC_S_FMT failed (requested 640x480 YUYV): {}",
            std::io::Error::last_os_error()
        ));
    }

    let actual_w = fmt.width;
    let actual_h = fmt.height;
    let actual_fmt = fmt.pixelformat;
    let bpl = fmt.bytesperline;

    eprintln!(
        "[camera] {} -> {}x{} fmt=0x{:08X} bpl={}",
        device, actual_w, actual_h, actual_fmt, bpl
    );

    if actual_fmt != V4L2_PIX_FMT_YUYV {
        // Try MJPEG as fallback
        fmt.pixelformat = 0x47504A4D; // 'MJPG'
        let ret = unsafe { libc::ioctl(fd, VIDIOC_S_FMT, &mut fmt) };
        if ret < 0 {
            unsafe { libc::close(fd) };
            return Err(format!(
                "Camera does not support YUYV or MJPEG: {}",
                std::io::Error::last_os_error()
            ));
        }
        eprintln!(
            "[camera] fell back to MJPEG: {}x{} bpl={}",
            fmt.width, fmt.height, fmt.bytesperline
        );
        // For MJPEG we'd need a JPEG decoder -- bail for now
        unsafe { libc::close(fd) };
        return Err("MJPEG fallback not yet implemented. Use a YUYV-capable webcam.".into());
    }

    // Request mmap buffers (4 buffers for smooth streaming)
    #[repr(C)]
    struct ReqBufs {
        type_: u32,
        memory: u32,
        count: u32,
        reserved: [u32; 2],
    }
    let mut req = ReqBufs {
        type_: V4L2_BUF_TYPE_VIDEO_CAPTURE,
        memory: V4L2_MEMORY_MMAP,
        count: 4,
        reserved: [0, 0],
    };
    let ret = unsafe { libc::ioctl(fd, VIDIOC_REQBUFS, &mut req) };
    if ret < 0 {
        unsafe { libc::close(fd) };
        return Err(format!(
            "VIDIOC_REQBUFS failed: {}",
            std::io::Error::last_os_error()
        ));
    }
    let buf_count = req.count as usize;
    eprintln!("[camera] {} mmap buffers allocated", buf_count);

    // Map buffers
    let mut buffers: Vec<(Vec<u8>, usize)> = Vec::with_capacity(buf_count);
    for i in 0..buf_count {
        let mut vbuf: V4l2Buffer = unsafe { std::mem::zeroed() };
        vbuf.type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        vbuf.memory = V4L2_MEMORY_MMAP;
        vbuf.index = i as u32;

        let ret = unsafe { libc::ioctl(fd, VIDIOC_QUERYBUF, &mut vbuf) };
        if ret < 0 {
            unsafe { libc::close(fd) };
            return Err(format!(
                "VIDIOC_QUERYBUF({}) failed: {}",
                i,
                std::io::Error::last_os_error()
            ));
        }

        let length = vbuf.length as usize;
        let offset = unsafe { vbuf.m.offset } as usize;

        let ptr = unsafe {
            libc::mmap(
                std::ptr::null_mut(),
                length,
                libc::PROT_READ | libc::PROT_WRITE,
                libc::MAP_SHARED,
                fd,
                offset as libc::off_t,
            )
        };
        if ptr == libc::MAP_FAILED {
            unsafe { libc::close(fd) };
            return Err(format!("mmap({}) failed", i));
        }

        let slice = unsafe { std::slice::from_raw_parts_mut(ptr as *mut u8, length) };
        buffers.push((slice.to_vec(), length));
        // Unmap immediately; we'll copy in the capture loop
        unsafe { libc::munmap(ptr, length) };
    }

    // Queue all buffers
    for i in 0..buf_count {
        let mut vbuf: V4l2Buffer = unsafe { std::mem::zeroed() };
        vbuf.type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        vbuf.memory = V4L2_MEMORY_MMAP;
        vbuf.index = i as u32;
        let ret = unsafe { libc::ioctl(fd, VIDIOC_QBUF, &mut vbuf) };
        if ret < 0 {
            unsafe { libc::close(fd) };
            return Err(format!(
                "VIDIOC_QBUF({}) failed: {}",
                i,
                std::io::Error::last_os_error()
            ));
        }
    }

    // Start streaming
    let mut type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    let ret = unsafe { libc::ioctl(fd, VIDIOC_STREAMON, &mut type_) };
    if ret < 0 {
        unsafe { libc::close(fd) };
        return Err(format!(
            "VIDIOC_STREAMON failed: {}",
            std::io::Error::last_os_error()
        ));
    }

    eprintln!("[camera] streaming started from {}", device);

    let (frame_tx, frame_rx) = mpsc::sync_channel::<CameraFrame>(2); // bounded: drop stale frames
    let (control_tx, control_rx) = mpsc::channel::<CameraControl>();

    // Clone the values we need for the thread
    let device_name = device.to_string();
    let actual_w = actual_w;
    let actual_h = actual_h;
    let bpl = bpl;
    let fd_clone = fd;

    let handle = thread::Builder::new()
        .name("camera-capture".into())
        .spawn(move || {
            // Re-map buffers in the thread
            let mut mapped: Vec<*mut libc::c_void> = Vec::with_capacity(buf_count);
            let mut lengths: Vec<usize> = Vec::with_capacity(buf_count);
            for i in 0..buf_count {
                let mut vbuf: V4l2Buffer = unsafe { std::mem::zeroed() };
                vbuf.type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                vbuf.memory = V4L2_MEMORY_MMAP;
                vbuf.index = i as u32;
                let ret = unsafe { libc::ioctl(fd_clone, VIDIOC_QUERYBUF, &mut vbuf) };
                if ret < 0 {
                    eprintln!("[camera] re-querybuf({}) failed, stopping", i);
                    break;
                }
                let length = vbuf.length as usize;
                let offset = unsafe { vbuf.m.offset } as usize;
                let ptr = unsafe {
                    libc::mmap(
                        std::ptr::null_mut(),
                        length,
                        libc::PROT_READ | libc::PROT_WRITE,
                        libc::MAP_SHARED,
                        fd_clone,
                        offset as libc::off_t,
                    )
                };
                if ptr == libc::MAP_FAILED {
                    eprintln!("[camera] re-mmap({}) failed, stopping", i);
                    break;
                }
                mapped.push(ptr);
                lengths.push(length);
            }

            if mapped.len() != buf_count {
                // Cleanup partial mappings
                for ptr in &mapped {
                    unsafe { libc::munmap(*ptr, 1) };
                }
                return;
            }

            let capture_fd = fd_clone;
            let mut drop_count = 0u64;

            loop {
                // Check for shutdown
                match control_rx.try_recv() {
                    Ok(CameraControl::Shutdown) | Err(TryRecvError::Disconnected) => break,
                    Err(TryRecvError::Empty) => {}
                }

                // Dequeue next buffer
                let mut vbuf: V4l2Buffer = unsafe { std::mem::zeroed() };
                vbuf.type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                vbuf.memory = V4L2_MEMORY_MMAP;

                let ret = unsafe { libc::ioctl(capture_fd, VIDIOC_DQBUF, &mut vbuf) };
                if ret < 0 {
                    // EAGAIN is normal when no frame ready yet
                    let err = std::io::Error::last_os_error();
                    if err.raw_os_error() == Some(libc::EAGAIN) {
                        std::thread::sleep(std::time::Duration::from_millis(16));
                        continue;
                    }
                    eprintln!("[camera] DQBUF failed: {}, stopping", err);
                    break;
                }

                let idx = vbuf.index as usize;
                if idx < mapped.len() {
                    let slice =
                        unsafe { std::slice::from_raw_parts(mapped[idx] as *const u8, lengths[idx]) };

                    // Downscale to 256x256
                    let pixels = downscale_yuyv_to_256x256(slice, actual_w, actual_h, bpl);

                    // Only send if receiver is not full (drop frames to avoid lag)
                    // Use a bounded channel to avoid blocking; if full, skip.
                    match frame_tx.try_send(CameraFrame { pixels }) {
                        Ok(()) => {}
                        Err(std::sync::mpsc::TrySendError::Full(_)) => {
                            drop_count += 1;
                            if drop_count % 100 == 0 {
                                eprintln!("[camera] dropped {} frames (receiver slow)", drop_count);
                            }
                        }
                        Err(std::sync::mpsc::TrySendError::Disconnected(_)) => {
                            // Receiver gone, thread should wind down
                            break;
                        }
                    }
                }

                // Re-queue the buffer
                let ret = unsafe { libc::ioctl(capture_fd, VIDIOC_QBUF, &mut vbuf) };
                if ret < 0 {
                    eprintln!("[camera] QBUF failed, stopping");
                    break;
                }
            }

            // Stop streaming
            let mut type_ = V4L2_BUF_TYPE_VIDEO_CAPTURE;
            unsafe { libc::ioctl(capture_fd, VIDIOC_STREAMOFF, &mut type_) };

            // Unmap
            for (ptr, len) in mapped.iter().zip(lengths.iter()) {
                unsafe { libc::munmap(*ptr, *len) };
            }

            unsafe { libc::close(capture_fd) };
            eprintln!("[camera] stopped ({})", device_name);
        })
        .map_err(|e| format!("Failed to spawn camera thread: {}", e))?;

    Ok(CameraHandle {
        thread: Some(handle),
        control_tx: Some(control_tx),
        frame_rx,
    })
}
