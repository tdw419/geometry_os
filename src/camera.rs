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
                        },
                        Ok(n) => bytes_read += n,
                        Err(e) => {
                            if e.kind() == std::io::ErrorKind::Interrupted {
                                continue;
                            }
                            eprintln!("[camera] read error: {}", e);
                            return;
                        },
                    }
                }

                let pixels = rgb24_to_pixels(&buf);
                let frame = CameraFrame { pixels };

                // Send frame, drop if receiver is full (don't block on slow consumer)
                match frame_tx.try_send(frame) {
                    Ok(()) => {},
                    Err(mpsc::TrySendError::Full(_)) => {
                        drop_count += 1;
                        if drop_count % 100 == 0 {
                            eprintln!("[camera] dropped {} frames (receiver slow)", drop_count);
                        }
                    },
                    Err(mpsc::TrySendError::Disconnected(_)) => {
                        eprintln!("[camera] receiver disconnected");
                        return;
                    },
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

#[cfg(test)]
mod tests {
    use super::*;

    // ── rgb24_to_pixels ──

    #[test]
    fn test_rgb24_single_pixel() {
        let rgb = [0xFF, 0x00, 0x00]; // pure red
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels.len(), 1);
        // Format: 0x00RRGGBB
        assert_eq!(pixels[0], 0x00FF0000);
    }

    #[test]
    fn test_rgb24_pure_green() {
        let rgb = [0x00, 0xFF, 0x00];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels[0], 0x0000FF00);
    }

    #[test]
    fn test_rgb24_pure_blue() {
        let rgb = [0x00, 0x00, 0xFF];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels[0], 0x000000FF);
    }

    #[test]
    fn test_rgb24_black() {
        let rgb = [0x00, 0x00, 0x00];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels[0], 0x00000000);
    }

    #[test]
    fn test_rgb24_white() {
        let rgb = [0xFF, 0xFF, 0xFF];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels[0], 0x00FFFFFF);
    }

    #[test]
    fn test_rgb24_multiple_pixels() {
        let rgb = [
            0x12, 0x34, 0x56, // pixel 0: R=0x12, G=0x34, B=0x56
            0xAB, 0xCD, 0xEF, // pixel 1: R=0xAB, G=0xCD, B=0xEF
        ];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels.len(), 2);
        assert_eq!(pixels[0], 0x00123456);
        assert_eq!(pixels[1], 0x00ABCDEF);
    }

    #[test]
    fn test_rgb24_empty_input() {
        let rgb: &[u8] = &[];
        let pixels = rgb24_to_pixels(rgb);
        assert!(pixels.is_empty());
    }

    #[test]
    fn test_rgb24_frame_size() {
        // Simulate a 2x2 frame (4 pixels)
        let rgb = [0u8; 12]; // 4 pixels * 3 bytes
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels.len(), 4);
    }

    #[test]
    fn test_rgb24_preserves_channel_values() {
        // Verify each channel lands in the correct byte position
        for r in &[0x00, 0x55, 0xAA, 0xFF] {
            for g in &[0x00, 0x55, 0xAA, 0xFF] {
                for b in &[0x00, 0x55, 0xAA, 0xFF] {
                    let rgb = [*r, *g, *b];
                    let pixels = rgb24_to_pixels(&rgb);
                    assert_eq!(pixels.len(), 1);
                    assert_eq!(
                        pixels[0],
                        (*r as u32) << 16 | (*g as u32) << 8 | *b as u32,
                        "R={:02X} G={:02X} B={:02X} -> {:08X}",
                        r,
                        g,
                        b,
                        pixels[0]
                    );
                }
            }
        }
    }

    #[test]
    fn test_rgb24_full_256x256_frame() {
        // Verify the pixel count for a full 256x256 RGB24 frame
        let frame_size = 256 * 256 * 3;
        let rgb = vec![0u8; frame_size];
        let pixels = rgb24_to_pixels(&rgb);
        assert_eq!(pixels.len(), 256 * 256);
    }

    // ── CameraFrame struct ──

    #[test]
    fn test_camera_frame_debug() {
        let frame = CameraFrame {
            pixels: vec![0x00FF0000, 0x0000FF00],
        };
        let debug_str = format!("{:?}", frame);
        assert!(debug_str.contains("CameraFrame"));
        assert!(debug_str.contains("pixels"));
    }

    #[test]
    fn test_camera_frame_clone() {
        let frame = CameraFrame {
            pixels: vec![0x00FF0000],
        };
        let cloned = frame.clone();
        assert_eq!(cloned.pixels, frame.pixels);
        // Verify independence
        let mut frame2 = frame.clone();
        frame2.pixels[0] = 0x00000000;
        assert_ne!(frame.pixels[0], frame2.pixels[0]);
    }

    #[test]
    fn test_camera_frame_default_black() {
        let frame = CameraFrame {
            pixels: vec![0u32; 4],
        };
        assert!(frame.pixels.iter().all(|&p| p == 0));
    }

    #[test]
    fn test_rgb24_byte_order_rgb_not_bgr() {
        // Ensure we're using RGB order, not BGR
        let rgb = [0x01, 0x02, 0x03]; // R=1, G=2, B=3
        let pixels = rgb24_to_pixels(&rgb);
        // 0x00RRGGBB = 0x00010203
        assert_eq!(pixels[0], 0x00010203);
    }
}
