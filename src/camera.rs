// camera.rs -- Host-side webcam feeder for Geometry OS
//
// Captures frames from a webcam via ffmpeg, downscales to 256x256 RGB,
// and makes them available as the bottom compositor layer. WINSYS windows
// draw on top -- the robot's "thoughts" overlaid on its "eyes".
//
// Usage: geometry_os --camera [--camera-device /dev/video0]
//
// Design: host-side only, not an opcode. The camera is a pixel source,
// not a VM instruction. This keeps the asm surface clean and treats
// the camera as just another background layer the compositor handles.
//
// Implementation: ffmpeg subprocess pumping raw RGB24 frames over a pipe.
// More robust than raw V4L2 ioctl -- handles format negotiation, scaling,
// and driver quirks automatically. ffmpeg is a near-universal dependency.

use std::io::Read;
use std::process::{Child, Command, Stdio};
use std::sync::mpsc::{self, TryRecvError};
use std::thread::{self, JoinHandle};

/// A single 256x256 frame from the camera, in 0x00RRGGBB format (same as minifb).
#[derive(Debug, Clone)]
pub struct CameraFrame {
    /// 256*256 pixels, 0x00RRGGBB.
    pub pixels: Vec<u32>,
}

/// Handle to the camera capture thread.
pub struct CameraHandle {
    thread: Option<JoinHandle<()>>,
    frame_rx: mpsc::Receiver<CameraFrame>,
    /// The ffmpeg child process (killed on drop).
    ffmpeg_child: Child,
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
    fn shutdown(&mut self) {
        // Kill ffmpeg first (closes stdout, which makes the reader thread exit)
        if let Err(e) = self.ffmpeg_child.kill() {
            eprintln!("[camera] kill ffmpeg: {}", e);
        }
        let _ = self.ffmpeg_child.wait();

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

/// Convert raw RGB24 bytes to 0x00RRGGBB u32 pixels.
fn rgb24_to_pixels(rgb: &[u8]) -> Vec<u32> {
    debug_assert_eq!(rgb.len() % 3, 0);
    let count = rgb.len() / 3;
    let mut pixels = Vec::with_capacity(count);
    for i in 0..count {
        let r = rgb[i * 3] as u32;
        let g = rgb[i * 3 + 1] as u32;
        let b = rgb[i * 3 + 2] as u32;
        pixels.push((r << 16) | (g << 8) | b);
    }
    pixels
}

/// Open the camera device via ffmpeg and start capturing frames.
/// Returns a handle that provides frames via try_recv_frame().
///
/// ffmpeg pipeline:
///   /dev/video0 (v4l2) -> rawvideo rgb24 256x256 -> stdout pipe
///
/// This is more robust than raw V4L2 ioctls because ffmpeg handles
/// format negotiation, UVC quirks, and scaling automatically.
pub fn open_camera(device: &str) -> Result<CameraHandle, String> {
    let frame_size = 256 * 256 * 3; // RGB24

    // Spawn ffmpeg: capture from v4l2, output raw RGB24 at 256x256
    // -framerate 10: request ~10fps (low CPU, smooth enough for robot vision)
    let mut ffmpeg_child = Command::new("ffmpeg")
        .args([
            "-f",
            "v4l2",
            "-framerate",
            "10",
            "-video_size",
            "640x480",
            "-i",
            device,
            "-f",
            "rawvideo",
            "-pix_fmt",
            "rgb24",
            "-s",
            "256x256",
            "-an",
            "-y",
            "pipe:1",
        ])
        .stdout(Stdio::piped())
        .stderr(Stdio::null())
        .spawn()
        .map_err(|e| format!("Failed to spawn ffmpeg: {}. Is ffmpeg installed?", e))?;

    let mut stdout = ffmpeg_child
        .stdout
        .take()
        .ok_or("Failed to open ffmpeg stdout")?;

    let (frame_tx, frame_rx) = mpsc::sync_channel::<CameraFrame>(2);

    eprintln!("[camera] ffmpeg capturing from {} -> 256x256 RGB24", device);

    let handle = thread::Builder::new()
        .name("camera-capture".into())
        .spawn(move || {
            let mut buf = vec![0u8; frame_size];
            let mut drop_count = 0u64;

            loop {
                // Read exactly one frame of RGB24 data
                let mut bytes_read = 0;
                while bytes_read < frame_size {
                    match stdout.read(&mut buf[bytes_read..]) {
                        Ok(0) => {
                            eprintln!("[camera] ffmpeg exited (EOF)");
                            return;
                        }
                        Ok(n) => bytes_read += n,
                        Err(e) => {
                            if e.kind() == std::io::ErrorKind::Interrupted {
                                continue;
                            }
                            eprintln!("[camera] read error: {}", e);
                            return;
                        }
                    }
                }

                let pixels = rgb24_to_pixels(&buf);
                let frame = CameraFrame { pixels };

                // Send frame, drop if receiver is full (don't block on slow consumer)
                match frame_tx.try_send(frame) {
                    Ok(()) => {}
                    Err(mpsc::TrySendError::Full(_)) => {
                        drop_count += 1;
                        if drop_count % 100 == 0 {
                            eprintln!("[camera] dropped {} frames (receiver slow)", drop_count);
                        }
                    }
                    Err(mpsc::TrySendError::Disconnected(_)) => {
                        eprintln!("[camera] receiver disconnected");
                        return;
                    }
                }
            }
        })
        .map_err(|e| format!("Failed to spawn camera thread: {}", e))?;

    Ok(CameraHandle {
        thread: Some(handle),
        frame_rx,
        ffmpeg_child,
    })
}
