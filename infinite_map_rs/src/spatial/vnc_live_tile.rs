//! VNC Live Tile - Real-time VNC framebuffer streaming to Spatial Grid
//!
//! Implements RFB 3.8 protocol client for connecting to VNC servers and
//! streaming framebuffer updates directly into the Geometry OS spatial grid.
//! Used for displaying VM desktops as "Live Tiles" on the infinite canvas.

use std::io::Read;
use std::io::Write;
use std::net::TcpStream;
use std::time::Duration;

use crate::spatial::process_scheduler::ProcessRegion;
use crate::spatial_grid::CellState;

/// RFB protocol message types
const RFB_SET_PIXEL_FORMAT: u8 = 0;
const RFB_SET_ENCODINGS: u8 = 2;
const RFB_FRAMEBUFFER_UPDATE_REQUEST: u8 = 3;
const RFB_FRAMEBUFFER_UPDATE: u8 = 0;

/// VNC rectangle data
#[derive(Debug)]
pub struct VncRectangle {
    pub x: u16,
    pub y: u16,
    pub width: u16,
    pub height: u16,
    pub encoding: i32,
    pub data: Vec<u8>,
}

/// Minimal VNC client
pub struct VncClient {
    stream: TcpStream,
    width: u16,
    height: u16,
}

impl VncClient {
    /// Connect to VNC server on localhost:port
    pub fn connect(port: u16) -> Result<Self, String> {
        let addr = format!("127.0.0.1:{}", port);
        let mut stream = TcpStream::connect(&addr)
            .map_err(|e| format!("Failed to connect to VNC server at {}: {}", addr, e))?;

        // Set timeout for reads (prevents hanging - increased for slow VNC servers)
        stream
            .set_read_timeout(Some(Duration::from_secs(5)))
            .map_err(|e| format!("Failed to set read timeout: {}", e))?;

        // Protocol handshake: send version
        let rfb_version = b"RFB 003.008\n";
        stream
            .write_all(rfb_version)
            .map_err(|e| format!("Failed to send RFB version: {}", e))?;

        // Read server version
        let mut version_buffer = [0u8; 12];
        stream
            .read_exact(&mut version_buffer)
            .map_err(|e| format!("Failed to read server version: {}", e))?;

        // Verify server supports our version
        if !version_buffer.starts_with(b"RFB 003.") {
            return Err(format!(
                "Unsupported RFB version: {}",
                String::from_utf8_lossy(&version_buffer)
            ));
        }

        // Security handshake
        let mut sec_buffer = [0u8; 2];
        stream
            .read_exact(&mut sec_buffer)
            .map_err(|e| format!("Failed to read security types: {}", e))?;

        let sec_count = sec_buffer[0];
        let security_types = if sec_count > 1 {
            let mut types = vec![0u8; sec_count as usize];
            stream
                .read_exact(&mut types)
                .map_err(|e| format!("Failed to read security type list: {}", e))?;
            types
        } else {
            vec![sec_buffer[1]]
        };

        // Use None auth if available
        if security_types.contains(&1) {
            stream
                .write_all(&[1])
                .map_err(|e| format!("Failed to send security type: {}", e))?;
        } else {
            return Err(format!(
                "VNC server requires unsupported authentication. Available types: {:?}",
                security_types
            ));
        }

        // Read security result
        let mut security_result = [0u8; 4];
        stream
            .read_exact(&mut security_result)
            .map_err(|e| format!("Failed to read security result: {}", e))?;

        let security_status = u32::from_be_bytes(security_result);
        if security_status != 0 {
            return Err(format!(
                "VNC authentication failed (status {})",
                security_status
            ));
        }

        // ClientInit: send shared flag (0 = don't share)
        stream
            .write_all(&[0])
            .map_err(|e| format!("Failed to send ClientInit: {}", e))?;

        // ServerInit: read framebuffer dimensions
        let mut server_init = [0u8; 4];
        stream
            .read_exact(&mut server_init)
            .map_err(|e| format!("Failed to read framebuffer size: {}", e))?;

        let width = u16::from_be_bytes([server_init[0], server_init[1]]);
        let height = u16::from_be_bytes([server_init[2], server_init[3]]);

        // Read pixel format (16 bytes) - ignore since we set our own
        let mut _pixel_format = [0u8; 16];
        stream
            .read_exact(&mut _pixel_format)
            .map_err(|e| format!("Failed to read pixel format: {}", e))?;

        // Read server name length and name
        let mut name_len_buffer = [0u8; 4];
        stream
            .read_exact(&mut name_len_buffer)
            .map_err(|e| format!("Failed to read name length: {}", e))?;

        let name_len = u32::from_be_bytes(name_len_buffer);
        if name_len > 0 {
            let mut _name_buffer = vec![0u8; name_len as usize];
            stream
                .read_exact(&mut _name_buffer)
                .map_err(|e| format!("Failed to read server name: {}", e))?;
        }

        // Set pixel format to 32-bit BGRA
        stream
            .write_all(&VncClient::build_set_pixel_format())
            .map_err(|e| format!("Failed to send SetPixelFormat: {}", e))?;

        // Set encodings to RAW only
        stream
            .write_all(&VncClient::build_set_encodings())
            .map_err(|e| format!("Failed to send SetEncodings: {}", e))?;

        Ok(VncClient {
            stream,
            width,
            height,
        })
    }

    fn build_set_pixel_format() -> Vec<u8> {
        let mut msg = [0u8; 20];
        msg[0] = RFB_SET_PIXEL_FORMAT;
        // padding 3 bytes
        msg[4] = 32; // bits-per-pixel
        msg[5] = 24; // depth
        msg[6] = 0; // little-endian
        msg[7] = 1; // true-color
        msg[8] = 0;
        msg[9] = 255; // red-max
        msg[10] = 0;
        msg[11] = 255; // green-max
        msg[12] = 0;
        msg[13] = 255; // blue-max
        msg[14] = 16; // red-shift
        msg[15] = 8; // green-shift
        msg[16] = 0; // blue-shift
        msg[17..20].copy_from_slice(&[0, 0, 0]);
        msg.to_vec()
    }

    fn build_set_encodings() -> Vec<u8> {
        let mut msg = [0u8; 8];
        msg[0] = RFB_SET_ENCODINGS;
        // padding 2 bytes
        msg[3] = 1; // encoding count
        msg[4..8].copy_from_slice(&0i32.to_be_bytes()); // encoding (RAW = 0)
        msg.to_vec()
    }

    pub fn dimensions(&self) -> (u16, u16) {
        (self.width, self.height)
    }

    pub fn request_full_update(&mut self) -> Result<(), String> {
        let mut msg = [0u8; 10];
        msg[0] = RFB_FRAMEBUFFER_UPDATE_REQUEST;
        msg[1] = 0; // incremental = 0 (full update)
        // x, y (0, 0)
        msg[2..4].copy_from_slice(&0u16.to_be_bytes());
        msg[4..6].copy_from_slice(&0u16.to_be_bytes());
        // width, height
        msg[6..8].copy_from_slice(&self.width.to_be_bytes());
        msg[8..10].copy_from_slice(&self.height.to_be_bytes());

        self.stream
            .write_all(&msg)
            .map_err(|e| format!("Failed to send FramebufferUpdateRequest: {}", e))
    }

    pub fn request_incremental_update(&mut self) -> Result<(), String> {
        let mut msg = [0u8; 10];
        msg[0] = RFB_FRAMEBUFFER_UPDATE_REQUEST;
        msg[1] = 1; // incremental = 1
        // x, y (0, 0)
        msg[2..4].copy_from_slice(&0u16.to_be_bytes());
        msg[4..6].copy_from_slice(&0u16.to_be_bytes());
        // width, height
        msg[6..8].copy_from_slice(&self.width.to_be_bytes());
        msg[8..10].copy_from_slice(&self.height.to_be_bytes());

        self.stream
            .write_all(&msg)
            .map_err(|e| format!("Failed to send FramebufferUpdateRequest: {}", e))
    }

    pub fn read_framebuffer_update(&mut self) -> Option<Result<Vec<VncRectangle>, String>> {
        // Read first byte to check for message
        let mut first_byte = [0u8; 1];
        match self.stream.read(&mut first_byte) {
            Ok(0) => return None,
            Ok(_) => {},
            Err(ref e)
                if e.kind() == std::io::ErrorKind::WouldBlock
                    || e.kind() == std::io::ErrorKind::TimedOut =>
            {
                return None
            }
            Err(e) => return Some(Err(format!("Read error: {}", e))),
        }

        // First byte should be FramebufferUpdate message type
        if first_byte[0] != RFB_FRAMEBUFFER_UPDATE {
            return Some(Err(format!("Unexpected message type: {}", first_byte[0])));
        }

        // Read the rest of the header (padding + rectangle count)
        let mut header = [0u8; 3];
        if let Err(e) = self.stream.read_exact(&mut header) {
            return Some(Err(format!("Failed to read header: {}", e)));
        }

        let rect_count = u16::from_be_bytes([header[1], header[2]]) as usize;
        let mut rectangles = Vec::with_capacity(rect_count);

        for _ in 0..rect_count {
            // Read rectangle header (x, y, w, h, encoding)
            let mut rect_header = [0u8; 12];
            if let Err(e) = self.stream.read_exact(&mut rect_header) {
                return Some(Err(format!("Failed to read rectangle header: {}", e)));
            }

            let x = u16::from_be_bytes([rect_header[0], rect_header[1]]);
            let y = u16::from_be_bytes([rect_header[2], rect_header[3]]);
            let w = u16::from_be_bytes([rect_header[4], rect_header[5]]);
            let h = u16::from_be_bytes([rect_header[6], rect_header[7]]);
            let encoding = i32::from_be_bytes([
                rect_header[8], rect_header[9], rect_header[10], rect_header[11],
            ]);

            // Only support RAW encoding (0)
            if encoding != 0 {
                return Some(Err(format!(
                    "Unsupported encoding: {} (only RAW/0 supported)",
                    encoding
                )));
            }

            // Read pixel data (BGRA, 4 bytes per pixel)
            let data_len = (w as usize) * (h as usize) * 4;
            let mut data = vec![0u8; data_len];
            if let Err(e) = self.stream.read_exact(&mut data) {
                return Some(Err(format!("Failed to read pixel data: {}", e)));
            }

            rectangles.push(VncRectangle {
                x,
                y,
                width: w,
                height: h,
                encoding,
                data,
            });
        }

        Some(Ok(rectangles))
    }
}

/// VNC Live Tile - streaming VNC framebuffer to spatial grid
pub struct VncLiveTile {
    client: VncClient,
    pid: u32,
    region: ProcessRegion,
    vnc_port: u16,
    fb_width: u16,
    fb_height: u16,
}

impl VncLiveTile {
    /// Connect to VNC server and create live tile with retry logic
    pub fn connect(
        vnc_port: u16,
        pid: u32,
        region: ProcessRegion,
    ) -> Result<Self, String> {
        let mut last_error = String::from("No attempts made");
        let max_attempts = 5;

        for attempt in 0..max_attempts {
            match VncClient::connect(vnc_port) {
                Ok(mut client) => {
                    let (width, height) = client.dimensions();

                    // Request full framebuffer update
                    if let Err(e) = client.request_full_update() {
                        last_error = format!("Failed to request framebuffer update: {}", e);
                        log::warn!("VNC attempt {} failed: {}", attempt + 1, last_error);
                        std::thread::sleep(Duration::from_millis(500 * (1 << attempt)));
                        continue;
                    }

                    log::info!(
                        "VNC LiveTile {} connected to port {} ({}x{}) after attempt {}",
                        pid,
                        vnc_port,
                        width,
                        height,
                        attempt + 1
                    );

                    return Ok(VncLiveTile {
                        client,
                        pid,
                        region,
                        vnc_port,
                        fb_width: width,
                        fb_height: height,
                    });
                }
                Err(e) => {
                    last_error = e.clone();
                    log::warn!("VNC attempt {} failed: {}", attempt + 1, e);
                    std::thread::sleep(Duration::from_millis(500 * (1 << attempt)));
                }
            }
        }

        Err(format!(
            "VNC connection failed after {} attempts: {}",
            max_attempts, last_error
        ))
    }

    /// Read framebuffer updates and apply to spatial grid
    pub fn tick(&mut self, grid: &mut [CellState], grid_w: usize) -> Result<(), String> {
        // Read framebuffer updates
        if let Some(rectangles) = self.client.read_framebuffer_update() {
            let rects = rectangles.map_err(|e| format!("Framebuffer update failed: {}", e))?;

            // Apply each rectangle to grid
            for rect in &rects {
                self.blit_rectangle_to_grid(rect, grid, grid_w)?;
            }

            // Request next incremental update
            self.client.request_incremental_update()?;
        }

        Ok(())
    }

    /// Blit a VNC rectangle to spatial grid cells
    fn blit_rectangle_to_grid(
        &self,
        rect: &VncRectangle,
        grid: &mut [CellState],
        grid_w: usize,
    ) -> Result<(), String> {
        let rect_x = rect.x as usize;
        let rect_y = rect.y as usize;
        let rect_w = rect.width as usize;
        let rect_h = rect.height as usize;

        // Calculate scaling factors (VNC resolution to spatial region)
        let scale_x = self.region.width as f64 / self.fb_width as f64;
        let scale_y = self.region.height as f64 / self.fb_height as f64;

        // Iterate through pixels in the rectangle (4:1 downsampling for performance)
        let mut pixel_idx = 0;
        for py in (0..rect_h).step_by(4) {
            for px in (0..rect_w).step_by(4) {
                let vnc_x = rect_x + px;
                let vnc_y = rect_y + py;

                let grid_x = (self.region.start_x as f64 + (vnc_x as f64) * scale_x) as usize;
                let grid_y = (self.region.start_y as f64 + (vnc_y as f64) * scale_y) as usize;

                // Clamp to grid bounds
                if grid_x < grid_w && grid_y < (grid.len() / grid_w) {
                    let offset = grid_y * grid_w + grid_x;

                    // Read BGRA pixel
                    let b = rect.data[pixel_idx];
                    let g = rect.data[pixel_idx + 1];
                    let r = rect.data[pixel_idx + 2];
                    // alpha is at pixel_idx + 3, ignored

                    // Pack RGB into data_buffer (0x00RRGGBB format)
                    grid[offset].data_buffer = ((r as u32) << 16) | ((g as u32) << 8) | b as u32;
                    grid[offset].is_active = 1;
                }
            }
            pixel_idx += 4;
        }

        Ok(())
    }

    /// Request full framebuffer update
    pub fn request_full(&mut self) -> Result<(), String> {
        self.client.request_full_update()
    }

    /// Get VNC port
    pub fn vnc_port(&self) -> u16 {
        self.vnc_port
    }

    /// Get process ID
    pub fn pid(&self) -> u32 {
        self.pid
    }

    /// Get spatial region
    pub fn region(&self) -> &ProcessRegion {
        &self.region
    }
}

/// Manager for multiple VNC live tiles
pub struct VncLiveTileManager {
    /// Active tiles indexed by PID
    tiles: std::sync::Arc<std::sync::Mutex<std::collections::HashMap<u32, VncLiveTile>>>,
}

impl VncLiveTileManager {
    /// Create new manager
    pub fn new() -> Self {
        VncLiveTileManager {
            tiles: std::sync::Arc::new(std::sync::Mutex::new(std::collections::HashMap::new())),
        }
    }

    /// Create and register a VNC live tile
    pub fn create_tile(
        &self,
        vnc_port: u16,
        pid: u32,
        region: ProcessRegion,
    ) -> Result<(), String> {
        let tile = VncLiveTile::connect(vnc_port, pid, region)?;
        self.tiles.lock().unwrap().insert(pid, tile);
        log::info!(
            "Registered VNC LiveTile for PID {} on port {}",
            pid,
            vnc_port
        );
        Ok(())
    }

    /// Remove a live tile
    pub fn remove_tile(&self, pid: u32) {
        if self.tiles.lock().unwrap().remove(&pid).is_some() {
            log::info!("Removed VNC LiveTile for PID {}", pid);
        }
    }

    /// Update all live tiles and blit to grid
    pub fn tick(&self, grid: &mut [CellState], grid_w: usize) -> Result<(), String> {
        let mut tiles = self.tiles.lock().unwrap();
        for tile in tiles.values_mut() {
            if let Err(e) = tile.tick(grid, grid_w) {
                log::warn!("VNC LiveTile {} tick failed: {}", tile.pid(), e);
            }
        }
        Ok(())
    }

    /// Request full update for all tiles
    pub fn request_all_full(&self) -> Result<(), String> {
        let mut tiles = self.tiles.lock().unwrap();
        for tile in tiles.values_mut() {
            tile.request_full()?;
        }
        Ok(())
    }
}

impl Default for VncLiveTileManager {
    fn default() -> Self {
        Self::new()
    }
}