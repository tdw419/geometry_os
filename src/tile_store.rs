//! tile_store.rs -- Infinite tile map for Geometry OS
//!
//! A chunked 2D pixel store that extends beyond the 256x256 VM framebuffer.
//! Chunks are 64x64 pixels (8x8 tiles of 8px each). Only chunks near the
//! camera are kept in memory; the rest can be flushed to disk.
//!
//! World coordinates: pixels. A chunk at key (cx, cy) covers pixels
//! [cx*64 .. cx*64+63] x [cy*64 .. cy*64+63].
//!
//! The camera position is read from VM RAM[0x7800-0x7801] as tile
//! coordinates (8px per tile), matching the existing viewport system.

use std::collections::HashMap;

/// Pixels per chunk edge.
pub const CHUNK_SIZE: usize = 64;
/// Pixels per tile edge (matches viewport::TILE_SIZE).
pub const TILE_SIZE: usize = 8;
/// Tiles per chunk edge.
pub const TILES_PER_CHUNK: usize = CHUNK_SIZE / TILE_SIZE; // 8

/// A single 64x64 chunk of the infinite map.
#[derive(Debug, Clone)]
pub struct Chunk {
    /// RGBA-like pixel data, 64*64 entries. 0x00RRGGBB format (matches VM screen).
    pub pixels: Vec<u32>,
    /// Whether this chunk has been modified since last disk flush.
    pub dirty: bool,
}

impl Chunk {
    pub fn new() -> Self {
        Self {
            pixels: vec![0u32; CHUNK_SIZE * CHUNK_SIZE],
            dirty: false,
        }
    }

    /// Get pixel at local (x, y) within the chunk. Returns 0 for out-of-bounds.
    pub fn get(&self, x: usize, y: usize) -> u32 {
        if x < CHUNK_SIZE && y < CHUNK_SIZE {
            self.pixels[y * CHUNK_SIZE + x]
        } else {
            0
        }
    }

    /// Set pixel at local (x, y) within the chunk.
    pub fn set(&mut self, x: usize, y: usize, color: u32) {
        if x < CHUNK_SIZE && y < CHUNK_SIZE {
            self.pixels[y * CHUNK_SIZE + x] = color;
            self.dirty = true;
        }
    }
}

/// The infinite tile map. Stores chunks keyed by (chunk_x, chunk_y).
/// Chunks are loaded on demand and can be flushed to disk.
pub struct TileStore {
    /// Active chunks in memory.
    chunks: HashMap<(i32, i32), Chunk>,
    /// Maximum chunks to keep in memory (LRU eviction).
    max_chunks: usize,
    /// Directory for disk persistence (None = no persistence).
    persist_dir: Option<String>,
    /// Total pixels written (stats).
    pub write_count: u64,
}

impl TileStore {
    pub fn new() -> Self {
        Self {
            chunks: HashMap::new(),
            max_chunks: 256, // 256 chunks = 256 * 64 * 64 * 4 bytes = ~4 MB
            persist_dir: None,
            write_count: 0,
        }
    }

    /// Create with a persistence directory.
    pub fn with_persistence(dir: &str) -> Self {
        let mut store = Self::new();
        store.persist_dir = Some(dir.to_string());
        // Ensure directory exists
        let _ = std::fs::create_dir_all(dir);
        store
    }

    /// Convert world pixel coordinates to chunk key.
    pub fn world_to_chunk(wx: i32, wy: i32) -> (i32, i32) {
        (
            wx.div_euclid(CHUNK_SIZE as i32),
            wy.div_euclid(CHUNK_SIZE as i32),
        )
    }

    /// Convert world pixel coordinates to local chunk coordinates.
    pub fn world_to_local(wx: i32, wy: i32) -> (usize, usize) {
        let lx = wx.rem_euclid(CHUNK_SIZE as i32) as usize;
        let ly = wy.rem_euclid(CHUNK_SIZE as i32) as usize;
        (lx, ly)
    }

    /// Get a mutable reference to the chunk containing (wx, wy), loading from disk if needed.
    /// Returns None if the chunk doesn't exist and couldn't be created.
    pub fn get_or_create_chunk(&mut self, wx: i32, wy: i32) -> &mut Chunk {
        let key = Self::world_to_chunk(wx, wy);
        if !self.chunks.contains_key(&key) {
            self.evict_if_needed();
            // Try loading from disk
            let chunk = if let Some(ref dir) = self.persist_dir {
                Self::load_chunk_from_disk(dir, key).unwrap_or_else(Chunk::new)
            } else {
                Chunk::new()
            };
            self.chunks.insert(key, chunk);
        }
        self.chunks.get_mut(&key).unwrap()
    }

    /// Read a pixel from world coordinates. Returns 0 (black) for unloaded areas.
    pub fn get_pixel(&mut self, wx: i32, wy: i32) -> u32 {
        let key = Self::world_to_chunk(wx, wy);
        // Don't create chunk on read -- just check if it exists
        if let Some(chunk) = self.chunks.get(&key) {
            let (lx, ly) = Self::world_to_local(wx, wy);
            chunk.get(lx, ly)
        } else if let Some(ref dir) = self.persist_dir {
            // Try loading from disk for read
            if let Some(chunk) = Self::load_chunk_from_disk(dir, key) {
                self.chunks.insert(key, chunk);
                let (lx, ly) = Self::world_to_local(wx, wy);
                self.chunks.get(&key).map(|c| c.get(lx, ly)).unwrap_or(0)
            } else {
                0
            }
        } else {
            0
        }
    }

    /// Write a pixel to world coordinates.
    pub fn set_pixel(&mut self, wx: i32, wy: i32, color: u32) {
        let chunk = self.get_or_create_chunk(wx, wy);
        let (lx, ly) = Self::world_to_local(wx, wy);
        chunk.set(lx, ly, color);
        self.write_count += 1;
    }

    /// Fill a rectangular region in world coordinates with a color.
    pub fn fill_rect(&mut self, x: i32, y: i32, w: usize, h: usize, color: u32) {
        for py in 0..h {
            for px in 0..w {
                self.set_pixel(x + px as i32, y + py as i32, color);
            }
        }
    }

    /// Fill the entire 256x256 "home" region (matching the VM framebuffer).
    /// This is a convenience for programs that want to fill the traditional screen area.
    pub fn fill_home(&mut self, color: u32) {
        self.fill_rect(0, 0, 256, 256, color);
    }

    /// Copy a region from the infinite map into the VM's 256x256 screen buffer.
    /// `src_x, src_y` = world coordinates on the infinite map.
    /// `dst_x, dst_y` = offset within the 256x256 screen.
    /// `w, h` = dimensions to copy.
    pub fn blit_to_screen(
        &mut self,
        screen: &mut [u32],
        src_x: i32,
        src_y: i32,
        dst_x: usize,
        dst_y: usize,
        w: usize,
        h: usize,
    ) {
        for py in 0..h {
            for px in 0..w {
                let dx = dst_x + px;
                let dy = dst_y + py;
                if dx < 256 && dy < 256 {
                    let color = self.get_pixel(src_x + px as i32, src_y + py as i32);
                    screen[dy * 256 + dx] = color;
                }
            }
        }
    }

    /// Copy a region from the VM's 256x256 screen buffer into the infinite map.
    /// `src_x, src_y` = offset within the 256x256 screen.
    /// `dst_x, dst_y` = world coordinates on the infinite map.
    /// `w, h` = dimensions to copy.
    pub fn blit_from_screen(
        &mut self,
        screen: &[u32],
        src_x: usize,
        src_y: usize,
        dst_x: i32,
        dst_y: i32,
        w: usize,
        h: usize,
    ) {
        for py in 0..h {
            for px in 0..w {
                let sx = src_x + px;
                let sy = src_y + py;
                if sx < 256 && sy < 256 {
                    let color = screen[sy * 256 + sx];
                    if color != 0 {
                        // Only copy non-transparent pixels
                        self.set_pixel(dst_x + px as i32, dst_y + py as i32, color);
                    }
                }
            }
        }
    }

    /// Get the list of chunk keys currently in memory.
    pub fn chunk_keys(&self) -> Vec<(i32, i32)> {
        self.chunks.keys().copied().collect()
    }

    /// Number of chunks currently in memory.
    pub fn chunk_count(&self) -> usize {
        self.chunks.len()
    }

    /// Get an immutable reference to a chunk by key.
    pub fn get_chunk(&self, key: &(i32, i32)) -> Option<&Chunk> {
        self.chunks.get(key)
    }

    /// Evict the oldest chunk if we're at capacity.
    /// Simple strategy: evict the first non-dirty chunk, or the first chunk.
    fn evict_if_needed(&mut self) {
        if self.chunks.len() >= self.max_chunks {
            // Find a non-dirty chunk to evict first
            let evict_key = self
                .chunks
                .iter()
                .find(|(_, c)| !c.dirty)
                .map(|(k, _)| *k)
                .or_else(|| self.chunks.keys().next().copied());

            if let Some(key) = evict_key {
                // Flush to disk before evicting if dirty
                if let Some(ref dir) = self.persist_dir {
                    if let Some(chunk) = self.chunks.get(&key) {
                        if chunk.dirty {
                            let _ = Self::save_chunk_to_disk(dir, key, chunk);
                        }
                    }
                }
                self.chunks.remove(&key);
            }
        }
    }

    /// Save all dirty chunks to disk.
    pub fn flush(&mut self) {
        if let Some(ref dir) = self.persist_dir {
            for (key, chunk) in &self.chunks {
                if chunk.dirty {
                    let _ = Self::save_chunk_to_disk(dir, *key, chunk);
                }
            }
        }
    }

    /// Load a chunk from disk.
    fn load_chunk_from_disk(dir: &str, key: (i32, i32)) -> Option<Chunk> {
        let path = Self::chunk_path(dir, key);
        let data = std::fs::read(&path).ok()?;
        if data.len() != CHUNK_SIZE * CHUNK_SIZE * 4 {
            return None;
        }
        let mut pixels = Vec::with_capacity(CHUNK_SIZE * CHUNK_SIZE);
        for i in 0..CHUNK_SIZE * CHUNK_SIZE {
            let off = i * 4;
            let r = data[off] as u32;
            let g = data[off + 1] as u32;
            let b = data[off + 2] as u32;
            // 0x00RRGGBB
            pixels.push((r << 16) | (g << 8) | b);
        }
        Some(Chunk {
            pixels,
            dirty: false,
        })
    }

    /// Save a chunk to disk.
    fn save_chunk_to_disk(dir: &str, key: (i32, i32), chunk: &Chunk) -> std::io::Result<()> {
        let path = Self::chunk_path(dir, key);
        let mut data = Vec::with_capacity(CHUNK_SIZE * CHUNK_SIZE * 4);
        for &pixel in &chunk.pixels {
            let r = ((pixel >> 16) & 0xFF) as u8;
            let g = ((pixel >> 8) & 0xFF) as u8;
            let b = (pixel & 0xFF) as u8;
            data.push(r);
            data.push(g);
            data.push(b);
            data.push(0); // alpha placeholder
        }
        std::fs::write(path, &data)?;
        Ok(())
    }

    /// Generate the file path for a chunk.
    fn chunk_path(dir: &str, key: (i32, i32)) -> String {
        format!("{dir}/chunk_{kx}_{ky}.bin", kx = key.0, ky = key.1)
    }

    /// Render the visible chunks into a buffer.
    ///
    /// `buffer` is the output framebuffer (WIDTH x HEIGHT).
    /// `cam_x`, `cam_y` are camera position in TILE coordinates.
    /// `zoom` determines scale factor (pixels per VM pixel).
    /// `map_offset_x`, `map_offset_y` offset the map on screen.
    /// `visible_w`, `visible_h` are the map area dimensions on screen.
    ///
    /// Only chunks within the visible region are rendered.
    pub fn render_visible(
        &mut self,
        buffer: &mut [u32],
        buffer_w: usize,
        cam_x: i32,
        cam_y: i32,
        scale: u32,
        map_offset_x: i32,
        map_offset_y: i32,
        visible_w: i32,
        visible_h: i32,
    ) {
        // Camera in world pixel coordinates
        let cam_px = cam_x * TILE_SIZE as i32;
        let cam_py = cam_y * TILE_SIZE as i32;

        // World pixel range visible on screen
        let world_left = cam_px - (map_offset_x / scale as i32);
        let world_top = cam_py - (map_offset_y / scale as i32);
        let world_right = world_left + (visible_w / scale as i32);
        let world_bottom = world_top + (visible_h / scale as i32);

        // Chunk range that overlaps the visible area
        let chunk_left = Self::world_to_chunk(world_left, world_top).0;
        let chunk_top = Self::world_to_chunk(world_left, world_top).1;
        let chunk_right = Self::world_to_chunk(world_right, world_bottom).0;
        let chunk_bottom = Self::world_to_chunk(world_right, world_bottom).1;

        let scale_i = scale as i32;

        for cy in chunk_top..=chunk_bottom {
            for cx in chunk_left..=chunk_right {
                let key = (cx, cy);
                // Try to get chunk (don't create on render)
                let chunk = if let Some(c) = self.chunks.get(&key) {
                    c
                } else if let Some(ref dir) = self.persist_dir {
                    if let Some(c) = Self::load_chunk_from_disk(dir, key) {
                        self.chunks.insert(key, c);
                        self.chunks.get(&key).unwrap()
                    } else {
                        continue;
                    }
                } else {
                    continue;
                };

                // Render this chunk's pixels
                let chunk_world_x = cx * CHUNK_SIZE as i32;
                let chunk_world_y = cy * CHUNK_SIZE as i32;

                for local_y in 0..CHUNK_SIZE {
                    let world_y = chunk_world_y + local_y as i32;
                    // Screen Y
                    let screen_y_base = map_offset_y + (world_y - cam_py) * scale_i;
                    if screen_y_base + scale_i <= 0 || screen_y_base >= visible_h {
                        continue;
                    }

                    for local_x in 0..CHUNK_SIZE {
                        let world_x = chunk_world_x + local_x as i32;
                        let screen_x_base = map_offset_x + (world_x - cam_px) * scale_i;
                        if screen_x_base + scale_i <= 0 || screen_x_base >= visible_w {
                            continue;
                        }

                        let color = chunk.get(local_x, local_y);
                        if color == 0 {
                            continue; // Skip black/transparent pixels
                        }

                        // Blit with scale
                        for dy in 0..scale_i {
                            for dx in 0..scale_i {
                                let px = (screen_x_base + dx) as usize;
                                let py = (screen_y_base + dy) as usize;
                                if px < buffer_w && py < buffer.len() / buffer_w {
                                    buffer[py * buffer_w + px] = color;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /// Render a grid overlay showing chunk boundaries (debug visualization).
    pub fn render_chunk_grid(
        &mut self,
        buffer: &mut [u32],
        buffer_w: usize,
        cam_x: i32,
        cam_y: i32,
        scale: u32,
        map_offset_x: i32,
        map_offset_y: i32,
        visible_w: i32,
        visible_h: i32,
        grid_color: u32,
    ) {
        let cam_px = cam_x * TILE_SIZE as i32;
        let cam_py = cam_y * TILE_SIZE as i32;
        let scale_i = scale as i32;

        // World pixel range
        let world_left = cam_px - (map_offset_x / scale_i);
        let world_top = cam_py - (map_offset_y / scale_i);
        let world_right = world_left + (visible_w / scale_i);
        let world_bottom = world_top + (visible_h / scale_i);

        // Draw vertical chunk boundary lines
        let first_chunk_x = (world_left / CHUNK_SIZE as i32) * CHUNK_SIZE as i32;
        let mut wx = first_chunk_x;
        while wx <= world_right {
            let sx = map_offset_x + (wx - cam_px) * scale_i;
            if sx >= 0 && sx < visible_w {
                for sy in 0..visible_h {
                    let px = sx as usize;
                    let py = sy as usize;
                    if px < buffer_w && py < buffer.len() / buffer_w {
                        buffer[py * buffer_w + px] = grid_color;
                    }
                }
            }
            wx += CHUNK_SIZE as i32;
        }

        // Draw horizontal chunk boundary lines
        let first_chunk_y = (world_top / CHUNK_SIZE as i32) * CHUNK_SIZE as i32;
        let mut wy = first_chunk_y;
        while wy <= world_bottom {
            let sy = map_offset_y + (wy - cam_py) * scale_i;
            if sy >= 0 && sy < visible_h {
                for sx in 0..visible_w {
                    let px = sx as usize;
                    let py = sy as usize;
                    if px < buffer_w && py < buffer_w && py < buffer.len() / buffer_w {
                        buffer[py * buffer_w + px] = grid_color;
                    }
                }
            }
            wy += CHUNK_SIZE as i32;
        }
    }

    /// Get statistics about the tile store.
    pub fn stats(&self) -> TileStoreStats {
        let dirty_count = self.chunks.values().filter(|c| c.dirty).count();
        let loaded_count = self.chunks.len();
        let loaded_bytes = loaded_count * CHUNK_SIZE * CHUNK_SIZE * 4;
        TileStoreStats {
            loaded_chunks: loaded_count,
            dirty_chunks: dirty_count,
            max_chunks: self.max_chunks,
            loaded_bytes,
            total_writes: self.write_count,
        }
    }
}

/// Statistics about the tile store.
#[derive(Debug, Clone)]
pub struct TileStoreStats {
    pub loaded_chunks: usize,
    pub dirty_chunks: usize,
    pub max_chunks: usize,
    pub loaded_bytes: usize,
    pub total_writes: u64,
}

impl std::fmt::Display for TileStoreStats {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "TileStore: {}/{} chunks ({}KB), {} dirty, {} writes",
            self.loaded_chunks,
            self.max_chunks,
            self.loaded_bytes / 1024,
            self.dirty_chunks,
            self.total_writes
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_chunk_basics() {
        let mut chunk = Chunk::new();
        assert_eq!(chunk.get(0, 0), 0);
        assert_eq!(chunk.get(63, 63), 0);

        chunk.set(10, 20, 0x00FF0000);
        assert_eq!(chunk.get(10, 20), 0x00FF0000);
        assert!(chunk.dirty);
    }

    #[test]
    fn test_chunk_bounds() {
        let mut chunk = Chunk::new();
        // Out of bounds writes are silently ignored
        chunk.set(64, 0, 0xFF);
        chunk.set(0, 64, 0xFF);
        assert_eq!(chunk.get(64, 0), 0);
        assert_eq!(chunk.get(0, 64), 0);
    }

    #[test]
    fn test_world_to_chunk() {
        assert_eq!(TileStore::world_to_chunk(0, 0), (0, 0));
        assert_eq!(TileStore::world_to_chunk(63, 63), (0, 0));
        assert_eq!(TileStore::world_to_chunk(64, 0), (1, 0));
        assert_eq!(TileStore::world_to_chunk(0, 64), (0, 1));
        assert_eq!(TileStore::world_to_chunk(-1, -1), (-1, -1));
        assert_eq!(TileStore::world_to_chunk(-64, -64), (-1, -1));
        assert_eq!(TileStore::world_to_chunk(-65, -65), (-2, -2));
    }

    #[test]
    fn test_world_to_local() {
        assert_eq!(TileStore::world_to_local(0, 0), (0, 0));
        assert_eq!(TileStore::world_to_local(63, 63), (63, 63));
        assert_eq!(TileStore::world_to_local(64, 0), (0, 0));
        assert_eq!(TileStore::world_to_local(-1, -1), (63, 63));
        assert_eq!(TileStore::world_to_local(-64, -64), (0, 0));
    }

    #[test]
    fn test_set_get_pixel() {
        let mut store = TileStore::new();
        assert_eq!(store.get_pixel(100, 200), 0);

        store.set_pixel(100, 200, 0x00FF0000);
        assert_eq!(store.get_pixel(100, 200), 0x00FF0000);
        assert_eq!(store.write_count, 1);
    }

    #[test]
    fn test_fill_rect() {
        let mut store = TileStore::new();
        store.fill_rect(10, 20, 5, 3, 0x0000FF00);

        assert_eq!(store.get_pixel(10, 20), 0x0000FF00);
        assert_eq!(store.get_pixel(14, 22), 0x0000FF00);
        // Outside the rect should still be 0
        assert_eq!(store.get_pixel(9, 20), 0);
        assert_eq!(store.get_pixel(15, 22), 0);
    }

    #[test]
    fn test_fill_home() {
        let mut store = TileStore::new();
        store.fill_home(0x00FFFFFF);

        // Check corners of 256x256 region
        assert_eq!(store.get_pixel(0, 0), 0x00FFFFFF);
        assert_eq!(store.get_pixel(255, 255), 0x00FFFFFF);
        // Just outside
        assert_eq!(store.get_pixel(256, 0), 0);
    }

    #[test]
    fn test_chunk_count() {
        let mut store = TileStore::new();
        assert_eq!(store.chunk_count(), 0);

        store.set_pixel(0, 0, 0xFF);
        assert_eq!(store.chunk_count(), 1);

        store.set_pixel(64, 0, 0xFF);
        assert_eq!(store.chunk_count(), 2);

        store.set_pixel(0, 64, 0xFF);
        assert_eq!(store.chunk_count(), 3);
    }

    #[test]
    fn test_eviction() {
        let mut store = TileStore::new();
        store.max_chunks = 3;

        // Fill 3 chunks
        store.set_pixel(0, 0, 0xFF); // chunk (0,0)
        store.set_pixel(64, 0, 0xFF); // chunk (1,0)
        store.set_pixel(128, 0, 0xFF); // chunk (2,0)
        assert_eq!(store.chunk_count(), 3);

        // Adding a 4th chunk should trigger eviction
        store.set_pixel(192, 0, 0xFF); // chunk (3,0)
        assert_eq!(store.chunk_count(), 3);
    }

    #[test]
    fn test_negative_coordinates() {
        let mut store = TileStore::new();
        store.set_pixel(-100, -200, 0x00FF0000);
        assert_eq!(store.get_pixel(-100, -200), 0x00FF0000);
        assert_eq!(store.chunk_count(), 1);
    }

    #[test]
    fn test_stats() {
        let mut store = TileStore::new();
        store.set_pixel(10, 10, 0xFF);
        store.set_pixel(20, 20, 0xFF);

        let stats = store.stats();
        assert_eq!(stats.loaded_chunks, 1); // Both pixels in same chunk
        assert_eq!(stats.dirty_chunks, 1);
        assert_eq!(stats.total_writes, 2);
    }

    #[test]
    fn test_render_visible() {
        let mut store = TileStore::new();
        // Draw a red pixel at world (32, 32)
        store.set_pixel(32, 32, 0x00FF0000);

        // Render with camera at tile (0,0), scale 1, no offset
        let mut buffer = vec![0u32; 100 * 100];
        store.render_visible(
            &mut buffer,
            100,
            0,   // cam_x (tile)
            0,   // cam_y (tile)
            1,   // scale
            0,   // map_offset_x
            0,   // map_offset_y
            100, // visible_w
            100, // visible_h
        );

        // The red pixel should appear at (32, 32) in the buffer
        assert_eq!(buffer[32 * 100 + 32], 0x00FF0000);
    }

    #[test]
    fn test_persistence_roundtrip() {
        let dir = "/tmp/geos_tilestore_test";
        let _ = std::fs::remove_dir_all(dir);

        {
            let mut store = TileStore::with_persistence(dir);
            store.set_pixel(100, 200, 0x00FF0000);
            store.set_pixel(-50, -30, 0x0000FF00);
            store.flush();
        }

        // Reload and verify
        let mut store = TileStore::with_persistence(dir);
        assert_eq!(store.get_pixel(100, 200), 0x00FF0000);
        assert_eq!(store.get_pixel(-50, -30), 0x0000FF00);

        let _ = std::fs::remove_dir_all(dir);
    }

    #[test]
    fn test_blit_from_screen() {
        let mut store = TileStore::new();
        let mut screen = vec![0u32; 256 * 256];
        // Draw a green square at (10,10)-(19,19) on the screen
        for y in 10..20 {
            for x in 10..20 {
                screen[y * 256 + x] = 0x0000FF00;
            }
        }

        // Blit screen region to world coordinates (500, 500)
        store.blit_from_screen(&screen, 10, 10, 500, 500, 10, 10);

        assert_eq!(store.get_pixel(500, 500), 0x0000FF00);
        assert_eq!(store.get_pixel(509, 509), 0x0000FF00);
        assert_eq!(store.get_pixel(510, 510), 0); // Outside blit region
    }
}
