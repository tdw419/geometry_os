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

use crate::epl::EplManager;
use std::collections::{HashMap, VecDeque};
use std::io::Cursor;
use std::path::Path;

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
    /// Access heatmap (luminosity pulses). Stores frame ID of last access.
    pub heatmap: Vec<u32>,
    /// Whether this chunk has been modified since last disk flush.
    pub dirty: bool,
}

impl Chunk {
    pub fn new() -> Self {
        Self {
            pixels: vec![0u32; CHUNK_SIZE * CHUNK_SIZE],
            heatmap: vec![0u32; CHUNK_SIZE * CHUNK_SIZE],
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
    pub fn set(&mut self, x: usize, y: usize, color: u32, frame: u32) {
        if x < CHUNK_SIZE && y < CHUNK_SIZE {
            let idx = y * CHUNK_SIZE + x;
            self.pixels[idx] = color;
            self.heatmap[idx] = frame;
            self.dirty = true;
        }
    }

    /// Record a read access for the heatmap.
    pub fn touch(&mut self, x: usize, y: usize, frame: u32) {
        if x < CHUNK_SIZE && y < CHUNK_SIZE {
            self.heatmap[y * CHUNK_SIZE + x] = frame;
        }
    }

    /// Convert u32 pixels to u8 bytes for EPL storage
    pub fn to_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::with_capacity(self.pixels.len() * 4);
        for &p in &self.pixels {
            bytes.extend_from_slice(&p.to_le_bytes());
        }
        bytes
    }

    /// Load pixels from u8 bytes
    pub fn from_bytes(bytes: &[u8]) -> Self {
        let mut pixels = Vec::with_capacity(CHUNK_SIZE * CHUNK_SIZE);
        for i in 0..(bytes.len() / 4) {
            let p = u32::from_le_bytes(bytes[i * 4..(i + 1) * 4].try_into().unwrap());
            pixels.push(p);
        }
        Self {
            pixels,
            heatmap: vec![0u32; CHUNK_SIZE * CHUNK_SIZE],
            dirty: false,
        }
    }

    /// Convert chunk to standard RGBA PNG bytes.
    pub fn to_png_bytes(&self) -> Vec<u8> {
        let mut png_data = Vec::new();
        {
            let mut encoder =
                png::Encoder::new(&mut png_data, CHUNK_SIZE as u32, CHUNK_SIZE as u32);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);
            let mut writer = encoder.write_header().unwrap();

            // Convert 0x00RRGGBB to [R, G, B, 0xFF]
            let mut rgba_pixels = Vec::with_capacity(CHUNK_SIZE * CHUNK_SIZE * 4);
            for &p in &self.pixels {
                let r = ((p >> 16) & 0xFF) as u8;
                let g = ((p >> 8) & 0xFF) as u8;
                let b = (p & 0xFF) as u8;
                rgba_pixels.push(r);
                rgba_pixels.push(g);
                rgba_pixels.push(b);
                rgba_pixels.push(0xFF);
            }
            writer.write_image_data(&rgba_pixels).unwrap();
        }
        png_data
    }

    /// Load chunk from standard RGBA PNG bytes.
    pub fn from_png_bytes(bytes: &[u8]) -> Result<Self, String> {
        let decoder = png::Decoder::new(Cursor::new(bytes));
        let mut reader = decoder.read_info().map_err(|e| e.to_string())?;
        let mut buf = vec![
            0u8;
            reader
                .output_buffer_size()
                .unwrap_or(CHUNK_SIZE * CHUNK_SIZE * 4)
        ];
        let info = reader.next_frame(&mut buf).map_err(|e| e.to_string())?;

        if info.width != CHUNK_SIZE as u32 || info.height != CHUNK_SIZE as u32 {
            return Err(format!(
                "Invalid PNG dimensions: {}x{}, expected {}x{}",
                info.width, info.height, CHUNK_SIZE, CHUNK_SIZE
            ));
        }

        let mut pixels = Vec::with_capacity(CHUNK_SIZE * CHUNK_SIZE);
        match info.color_type {
            png::ColorType::Rgba => {
                for i in 0..CHUNK_SIZE * CHUNK_SIZE {
                    let r = buf[i * 4] as u32;
                    let g = buf[i * 4 + 1] as u32;
                    let b = buf[i * 4 + 2] as u32;
                    // Format: 0x00RRGGBB
                    pixels.push((r << 16) | (g << 8) | b);
                }
            },
            png::ColorType::Rgb => {
                for i in 0..CHUNK_SIZE * CHUNK_SIZE {
                    let r = buf[i * 3] as u32;
                    let g = buf[i * 3 + 1] as u32;
                    let b = buf[i * 3 + 2] as u32;
                    pixels.push((r << 16) | (g << 8) | b);
                }
            },
            _ => return Err(format!("Unsupported PNG color type: {:?}", info.color_type)),
        }

        Ok(Self {
            pixels,
            heatmap: vec![0u32; CHUNK_SIZE * CHUNK_SIZE],
            dirty: false,
        })
    }
}

/// The infinite tile map. Stores chunks keyed by (chunk_x, chunk_y).
/// Chunks are loaded on demand and can be flushed to disk via EPL.
pub struct TileStore {
    /// Active chunks in memory.
    chunks: HashMap<(i32, i32), Chunk>,
    /// LRU access order: front = coldest (next to evict), back = hottest.
    access_order: VecDeque<((i32, i32), u64)>,
    /// Current access generation per key. Incremented on each touch.
    access_gen: HashMap<(i32, i32), u64>,
    /// Maximum chunks to keep in memory (LRU eviction).
    max_chunks: usize,
    /// Epigenetic Persistence Layer Manager
    epl: Option<EplManager>,
    /// Total pixels written (stats).
    pub write_count: u64,
    /// Current frame counter for animated terrain (water shimmer, etc.).
    pub frame: u32,
    /// Whether to generate procedural terrain for new chunks.
    pub procedural_enabled: bool,
}

impl TileStore {
    pub fn new() -> Self {
        Self {
            chunks: HashMap::new(),
            access_order: VecDeque::new(),
            access_gen: HashMap::new(),
            max_chunks: 512,
            epl: None,
            write_count: 0,
            frame: 0,
            procedural_enabled: true,
        }
    }

    /// Create with EPL persistence.
    pub fn with_epl(path: &str) -> Self {
        let mut store = Self::new();
        store.epl = EplManager::open(path).ok();
        store
    }

    /// Convert chunk key to unique u64 ID
    fn chunk_id(key: (i32, i32)) -> u64 {
        ((key.0 as u64) << 32) | (key.1 as u32 as u64)
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

    /// Get a mutable reference to the chunk containing (wx, wy), loading from EPL or generating.
    pub fn get_or_create_chunk(&mut self, wx: i32, wy: i32) -> &mut Chunk {
        let key = Self::world_to_chunk(wx, wy);
        if !self.chunks.contains_key(&key) {
            self.ensure_chunk(key.0, key.1);
        }
        self.chunks.get_mut(&key).unwrap()
    }
    /// Read a pixel from world coordinates.
    pub fn get_pixel(&mut self, wx: i32, wy: i32) -> u32 {
        let key = Self::world_to_chunk(wx, wy);
        if let Some(chunk) = self.chunks.get_mut(&key) {
            let (lx, ly) = Self::world_to_local(wx, wy);
            chunk.touch(lx, ly, self.frame);
            chunk.get(lx, ly)
        } else {
            self.ensure_chunk(key.0, key.1);
            let (lx, ly) = Self::world_to_local(wx, wy);
            let frame = self.frame;
            self.chunks
                .get_mut(&key)
                .map(|c| {
                    c.touch(lx, ly, frame);
                    c.get(lx, ly)
                })
                .unwrap_or(0)
        }
    }

    /// Read the heatmap value (last access frame) from world coordinates.
    pub fn get_heatmap_at(&self, wx: i32, wy: i32) -> u32 {
        let key = Self::world_to_chunk(wx, wy);
        if let Some(chunk) = self.chunks.get(&key) {
            let (lx, ly) = Self::world_to_local(wx, wy);
            chunk.heatmap[ly * CHUNK_SIZE + lx]
        } else {
            0
        }
    }

    /// Record a chunk access in the LRU deque (move to back = hottest).
    fn touch_lru(&mut self, key: (i32, i32)) {
        let gen = self.access_gen.entry(key).or_insert(0);
        *gen += 1;
        self.access_order.push_back((key, *gen));
    }

    /// Ensure a chunk exists in memory, loading from EPL or generating procedurally.
    pub fn ensure_chunk(&mut self, cx: i32, cy: i32) {
        let key = (cx, cy);
        if self.chunks.contains_key(&key) {
            self.touch_lru(key);
            return;
        }

        self.evict_if_needed();

        // 1. Check exception bitmap (fast, no disk I/O)
        // 2. If bitmap says no delta, skip disk read entirely -> generate from seed
        // 3. If bitmap says has delta, load from journal
        if let Some(ref mut epl) = self.epl {
            let id = Self::chunk_id(key);
            if epl.has_delta(id) {
                if let Ok(Some(bytes)) = epl.load_delta(id) {
                    let chunk = Self::deserialize_chunk(key.0, key.1, &bytes);
                    self.chunks.insert(key, chunk);
                    self.touch_lru(key);
                    return;
                }
                // Bitmap said yes but load failed -- fall through to generation
            }
        }

        if !self.procedural_enabled {
            self.chunks.insert(key, Chunk::new());
            self.touch_lru(key);
            return;
        }

        // Fallback: Procedural Generation (Genome)
        let chunk = crate::world_gen::generate_chunk(cx, cy, self.frame);
        self.chunks.insert(key, chunk);
        self.touch_lru(key);
    }

    /// Write a pixel to world coordinates.
    pub fn set_pixel(&mut self, wx: i32, wy: i32, color: u32) {
        let frame = self.frame;
        let chunk = self.get_or_create_chunk(wx, wy);
        let (lx, ly) = Self::world_to_local(wx, wy);
        chunk.set(lx, ly, color, frame);
        self.write_count += 1;
        // Touch LRU for the chunk containing this pixel
        let (cx, cy) = Self::world_to_chunk(wx, wy);
        self.touch_lru((cx, cy));
    }

    /// Evict the coldest chunk(s) if at capacity. O(1) amortized via LRU deque.
    fn evict_if_needed(&mut self) {
        while self.chunks.len() >= self.max_chunks {
            // Pop from front (coldest). Skip stale entries (generation mismatch).
            let key = loop {
                match self.access_order.pop_front() {
                    Some((k, gen)) => {
                        // Only accept if this is the current generation for the key
                        let current_gen = self.access_gen.get(&k).copied().unwrap_or(0);
                        if gen == current_gen && self.chunks.contains_key(&k) {
                            break k;
                        }
                        // Stale or already-evicted entry -- skip
                    },
                    None => return, // deque empty, nothing to evict
                }
            };

            // Flush dirty chunk to EPL before evicting
            if let Some(ref mut epl) = self.epl {
                if let Some(chunk) = self.chunks.get(&key) {
                    if chunk.dirty {
                        let data = Self::serialize_chunk(
                            self.frame,
                            self.procedural_enabled,
                            key.0,
                            key.1,
                            chunk,
                        );
                        let _ = epl.save_delta(Self::chunk_id(key), &data);
                    }
                }
            }
            self.chunks.remove(&key);
            self.access_gen.remove(&key);
        }
    }

    /// Proactively flush cold chunks to the EPL journal (Tier 3).
    /// Chunks not accessed in the last 5000 frames are considered 'Cold'.
    pub fn thermal_defrag(&mut self) {
        let current_frame = self.frame;
        let mut cold_keys = Vec::new();

        for (key, chunk) in &self.chunks {
            let max_heat = chunk.heatmap.iter().max().copied().unwrap_or(0);
            if current_frame.saturating_sub(max_heat) > 5000 {
                cold_keys.push(*key);
            }
        }

        for key in cold_keys {
            if let Some(ref mut epl) = self.epl {
                if let Some(chunk) = self.chunks.get(&key) {
                    if chunk.dirty {
                        let data = Self::serialize_chunk(
                            self.frame,
                            self.procedural_enabled,
                            key.0,
                            key.1,
                            chunk,
                        );
                        let _ = epl.save_delta(Self::chunk_id(key), &data);
                    }
                }
            }
            self.chunks.remove(&key);
        }
    }

    /// Serialize a chunk for EPL storage.
    /// Uses v2 exception-bitmap encoding if the chunk differs sparsely from
    /// the procedural baseline, otherwise falls back to v1 full-chunk encoding.
    fn serialize_chunk(
        frame: u32,
        procedural_enabled: bool,
        cx: i32,
        cy: i32,
        chunk: &Chunk,
    ) -> Vec<u8> {
        if !procedural_enabled {
            // When procedural generation is disabled, baseline is all zeros.
            // Diffing against generated terrain would mark everything as changed.
            // Fall back to v1 full encoding.
            let mut data = vec![0x00]; // v1 format marker
            data.extend_from_slice(&chunk.to_bytes());
            return data;
        }

        // Generate procedural baseline at current frame
        let baseline = crate::world_gen::generate_chunk(cx, cy, frame);

        // Build exception bitmap
        let mut bitmap = [0u8; CHUNK_SIZE * CHUNK_SIZE / 8]; // 512 bytes
        let mut values = Vec::new();
        let mut diff_count = 0;

        for i in 0..CHUNK_SIZE * CHUNK_SIZE {
            if chunk.pixels[i] != baseline.pixels[i] {
                let byte_idx = i / 8;
                let bit_idx = i % 8;
                bitmap[byte_idx] |= 1 << bit_idx;
                values.extend_from_slice(&chunk.pixels[i].to_le_bytes());
                diff_count += 1;
            }
        }

        // Threshold: v2 is beneficial when raw size < v1 raw size.
        // v1: 1 (marker) + 16384 = 16385 bytes
        // v2: 1 (marker) + 4 (frame) + 512 (bitmap) + 4*N (values) = 517 + 4*N bytes
        // v2 < v1  =>  517 + 4*N < 16385  =>  N < 3967
        // To avoid ambiguity with old v1 entries (exactly 16384 bytes), ensure
        // v2 is never exactly 16384 bytes: use v1 when N >= 3967.
        if diff_count >= 3967 {
            let mut data = vec![0x00]; // v1 format marker
            data.extend_from_slice(&chunk.to_bytes());
            return data;
        }

        // v2 exception bitmap encoding
        let mut data = vec![0x01]; // v2 format marker
        data.extend_from_slice(&frame.to_le_bytes());
        data.extend_from_slice(&bitmap);
        data.extend_from_slice(&values);
        data
    }

    /// Deserialize a chunk from EPL bytes.
    /// Auto-detects old v1 (no marker), new v1 (0x00 marker), and v2 (0x01 marker).
    fn deserialize_chunk(cx: i32, cy: i32, bytes: &[u8]) -> Chunk {
        const EXPECTED_LEN: usize = CHUNK_SIZE * CHUNK_SIZE * 4;

        if bytes.len() == EXPECTED_LEN {
            // Old v1 format: no format marker, raw pixel data only
            Chunk::from_bytes(bytes)
        } else if bytes.is_empty() {
            // Empty data fallback
            Chunk::new()
        } else if bytes[0] == 0x00 {
            // New v1 format: format marker + full pixel data
            Chunk::from_bytes(&bytes[1..])
        } else if bytes[0] == 0x01 {
            // v2 format: format marker + frame + exception bitmap + values
            if bytes.len() < 5 + 512 {
                // Truncated v2 data, fallback to new chunk
                return Chunk::new();
            }
            let frame = u32::from_le_bytes(bytes[1..5].try_into().unwrap());
            let bitmap = &bytes[5..5 + 512];
            let values = &bytes[5 + 512..];

            // Regenerate baseline at the stored frame
            let mut chunk = crate::world_gen::generate_chunk(cx, cy, frame);
            let mut value_idx = 0;
            for byte_idx in 0..512 {
                let byte = bitmap[byte_idx];
                if byte == 0 {
                    continue;
                }
                for bit_idx in 0..8 {
                    if byte & (1 << bit_idx) != 0 {
                        let pixel_idx = byte_idx * 8 + bit_idx;
                        let pixel = u32::from_le_bytes(
                            values[value_idx * 4..(value_idx + 1) * 4]
                                .try_into()
                                .unwrap(),
                        );
                        chunk.pixels[pixel_idx] = pixel;
                        value_idx += 1;
                    }
                }
            }
            chunk
        } else {
            panic!("Unknown chunk format marker: {}", bytes[0]);
        }
    }

    /// Save all dirty chunks to EPL.
    pub fn flush(&mut self) {
        if let Some(ref mut epl) = self.epl {
            for (&key, chunk) in &mut self.chunks {
                if chunk.dirty {
                    let data = Self::serialize_chunk(
                        self.frame,
                        self.procedural_enabled,
                        key.0,
                        key.1,
                        chunk,
                    );
                    let _ = epl.save_delta(Self::chunk_id(key), &data);
                    chunk.dirty = false;
                }
            }
        }
    }

    /// Export a specific chunk to a PNG file.
    pub fn export_chunk_to_png(&mut self, cx: i32, cy: i32, path: &str) -> std::io::Result<()> {
        self.ensure_chunk(cx, cy);
        if let Some(chunk) = self.chunks.get(&(cx, cy)) {
            let bytes = chunk.to_png_bytes();
            std::fs::write(path, bytes)?;
        }
        Ok(())
    }

    /// Import a specific chunk from a PNG file.
    pub fn import_chunk_from_png(&mut self, cx: i32, cy: i32, path: &str) -> Result<(), String> {
        let bytes = std::fs::read(path).map_err(|e| e.to_string())?;
        let mut chunk = Chunk::from_png_bytes(&bytes)?;
        chunk.dirty = true;
        self.chunks.insert((cx, cy), chunk);
        self.touch_lru((cx, cy));
        Ok(())
    }

    /// Export a world region (chunk range) to a directory as structured PNGs.
    pub fn export_region_to_dir(
        &mut self,
        c_x1: i32,
        c_y1: i32,
        c_x2: i32,
        c_y2: i32,
        dir_path: &str,
    ) -> std::io::Result<()> {
        let path = Path::new(dir_path);
        if !path.exists() {
            std::fs::create_dir_all(path)?;
        }

        for cy in c_y1..=c_y2 {
            for cx in c_x1..=c_x2 {
                let filename = format!("chunk_{}_{}.png", cx, cy);
                let chunk_path = path.join(filename);
                self.export_chunk_to_png(cx, cy, chunk_path.to_str().unwrap())?;
            }
        }
        Ok(())
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
    pub fn fill_home(&mut self, color: u32) {
        self.fill_rect(0, 0, 256, 256, color);
    }

    /// Copy a region from the infinite map into the VM's 256x256 screen buffer.
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
                        self.set_pixel(dst_x + px as i32, dst_y + py as i32, color);
                    }
                }
            }
        }
    }

    /// Number of chunks currently in memory.
    pub fn chunk_count(&self) -> usize {
        self.chunks.len()
    }

    /// Phase 257: Convert world pixel coordinates to a Hilbert-mapped local index.
    pub fn world_to_hilbert_index(wx: i32, wy: i32) -> u32 {
        let (lx, ly) = Self::world_to_local(wx, wy);
        crate::vm::hilbert::xy2d_u32(CHUNK_SIZE as u32, lx as u32, ly as u32)
    }

    /// Phase 257: Convert a Hilbert-mapped local index back to world coordinates.
    /// This allows a linear stream of data (like a file) to be written into the 2D chunk
    /// in a way that preserves spatial locality.
    pub fn hilbert_index_to_world(chunk_x: i32, chunk_y: i32, index: u32) -> (i32, i32) {
        let (lx, ly) = crate::vm::hilbert::d2xy_u32(CHUNK_SIZE as u32, index);
        let wx = (chunk_x * CHUNK_SIZE as i32) + lx as i32;
        let wy = (chunk_y * CHUNK_SIZE as i32) + ly as i32;
        (wx, wy)
    }

    /// Phase P: Convert chunk coordinates to a global Hilbert index (1D directory key).
    /// Uses a large order-16 Hilbert curve (65536x65536 chunks).
    pub fn chunk_to_hilbert(cx: i32, cy: i32) -> u64 {
        // Offset by 32768 to handle negative coordinates in the 65536 range
        let ux = (cx + 32768) as u64;
        let uy = (cy + 32768) as u64;
        crate::vm::hilbert::xy2d(65536, ux, uy)
    }

    /// Phase P: Convert a global Hilbert index back to chunk coordinates.
    pub fn hilbert_to_chunk(index: u64) -> (i32, i32) {
        let (ux, uy) = crate::vm::hilbert::d2xy(65536, index);
        (ux as i32 - 32768, uy as i32 - 32768)
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
                // Ensure chunk exists (generate procedurally if missing)
                self.ensure_chunk(cx, cy);
                let chunk = self.chunks.get(&(cx, cy)).unwrap();

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

        let world_left = cam_px - (map_offset_x / scale_i);
        let world_top = cam_py - (map_offset_y / scale_i);
        let world_right = world_left + (visible_w / scale_i);
        let world_bottom = world_top + (visible_h / scale_i);

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

        chunk.set(10, 20, 0x00FF0000, 0);
        assert_eq!(chunk.get(10, 20), 0x00FF0000);
        assert!(chunk.dirty);
    }

    #[test]
    fn test_epl_roundtrip() {
        let path = "/tmp/geos_epl_test.epl";
        let _ = std::fs::remove_file(path);

        {
            let mut store = TileStore::with_epl(path);
            store.set_pixel(100, 200, 0x00FF0000);
            store.set_pixel(-50, -30, 0x0000FF00);
            store.flush();
        }

        // Reload and verify
        let mut store = TileStore::with_epl(path);
        assert_eq!(store.get_pixel(100, 200), 0x00FF0000);
        assert_eq!(store.get_pixel(-50, -30), 0x0000FF00);

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_spatial_locality() {
        // Write sequential data using Hilbert mapping and verify adjacent logical
        // indices stay physically adjacent in world space most of the time.
        let chunk_x = 2;
        let chunk_y = 3;

        // Write 4 logical elements linearly
        for i in 0..4 {
            let (wx, wy) = TileStore::hilbert_index_to_world(chunk_x, chunk_y, i);
            // Reversing the mapping should yield the same index
            assert_eq!(TileStore::world_to_hilbert_index(wx, wy), i);
        }

        // Let's verify specific Hilbert curve properties for N=2 (4 elements)
        // 0 -> (0,0)
        // 1 -> (0,1)
        // 2 -> (1,1)
        // 3 -> (1,0)
        // They should form a 'U' shape, meaning adjacent index = adjacent physical.
        let (x0, y0) = TileStore::hilbert_index_to_world(0, 0, 0);
        let (x1, y1) = TileStore::hilbert_index_to_world(0, 0, 1);
        let (x2, y2) = TileStore::hilbert_index_to_world(0, 0, 2);
        let (x3, y3) = TileStore::hilbert_index_to_world(0, 0, 3);

        // Manhattan distances between sequential logical elements should be 1
        assert_eq!((x0 - x1).abs() + (y0 - y1).abs(), 1);
        assert_eq!((x1 - x2).abs() + (y1 - y2).abs(), 1);
        assert_eq!((x2 - x3).abs() + (y2 - y3).abs(), 1);
    }

    #[test]
    fn test_access_heatmap() {
        let mut store = TileStore::new();
        store.frame = 100;
        store.set_pixel(10, 10, 0xFF);

        let key = TileStore::world_to_chunk(10, 10);
        let (lx, ly) = TileStore::world_to_local(10, 10);

        {
            let chunk = store.chunks.get(&key).unwrap();
            assert_eq!(chunk.heatmap[ly * CHUNK_SIZE + lx], 100);
        }

        store.frame = 200;
        store.get_pixel(10, 10);
        {
            let chunk = store.chunks.get(&key).unwrap();
            assert_eq!(chunk.heatmap[ly * CHUNK_SIZE + lx], 200);
        }
    }

    #[test]
    fn test_png_roundtrip() {
        let mut chunk = Chunk::new();
        // Create a gradient pattern
        for y in 0..CHUNK_SIZE {
            for x in 0..CHUNK_SIZE {
                let color = (y as u32) << 16 | (x as u32) << 8 | ((x + y) as u32 & 0xFF);
                chunk.set(x, y, color, 0);
            }
        }

        let png_bytes = chunk.to_png_bytes();
        let chunk2 = Chunk::from_png_bytes(&png_bytes).expect("Failed to load chunk from PNG");

        for y in 0..CHUNK_SIZE {
            for x in 0..CHUNK_SIZE {
                assert_eq!(
                    chunk.get(x, y),
                    chunk2.get(x, y),
                    "Pixel mismatch at ({}, {})",
                    x,
                    y
                );
            }
        }
    }

    #[test]
    fn test_lru_eviction_order() {
        let mut store = TileStore::new();
        store.procedural_enabled = false;
        store.max_chunks = 3;

        // Touch chunks (0,0), (1,0), (2,0)
        store.ensure_chunk(0, 0);
        store.ensure_chunk(1, 0);
        store.ensure_chunk(2, 0);
        assert_eq!(store.chunks.len(), 3);

        // Access (0,0) again to make it hotter
        store.ensure_chunk(0, 0);

        // Adding a 4th chunk should evict (1,0) -- the oldest untouched
        store.ensure_chunk(3, 0);
        assert_eq!(store.chunks.len(), 3);
        assert!(store.chunks.contains_key(&(0, 0))); // touched again, kept
        assert!(!store.chunks.contains_key(&(1, 0))); // coldest, evicted
        assert!(store.chunks.contains_key(&(2, 0)));
        assert!(store.chunks.contains_key(&(3, 0))); // newly inserted
    }

    #[test]
    fn test_v2_exception_bitmap_roundtrip() {
        let path = "/tmp/geos_epl_v2_test.epl";
        let _ = std::fs::remove_file(path);

        {
            let mut store = TileStore::with_epl(path);
            // Modify exactly 3 pixels in a chunk -- should trigger v2 encoding
            store.set_pixel(10, 10, 0x00FF0000);
            store.set_pixel(11, 10, 0x0000FF00);
            store.set_pixel(10, 11, 0x000000FF);
            store.flush();
        }

        // Reload and verify
        let mut store = TileStore::with_epl(path);
        assert_eq!(store.get_pixel(10, 10), 0x00FF0000);
        assert_eq!(store.get_pixel(11, 10), 0x0000FF00);
        assert_eq!(store.get_pixel(10, 11), 0x000000FF);

        // Verify surrounding pixels are still generated terrain (not black)
        let surrounding = store.get_pixel(20, 20);
        assert_ne!(
            surrounding, 0,
            "Surrounding pixel should be generated terrain"
        );

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_sparse_edit_size_budget() {
        // Goal C: Write 1 pixel to an otherwise-empty chunk, flush to EPL,
        // and verify the on-disk delta is under 1KB.
        // This proves the v2 exception bitmap encoding is working for sparse edits.
        let path = "/tmp/geos_sparse_budget_test.epl";
        let _ = std::fs::remove_file(path);

        {
            let mut store = TileStore::with_epl(path);
            // Write exactly 1 pixel -- the sparsest possible edit
            store.set_pixel(5, 5, 0x00FF0000);
            store.flush();
        }

        let metadata = std::fs::metadata(path).expect("EPL file should exist after flush");
        let file_size = metadata.len() as usize;

        // The file includes the EPL header (32 bytes) plus the v2 exception
        // bitmap delta for one pixel. With v2 encoding this should be well
        // under 1KB. The old v1 full-chunk encoding would be ~16KB.
        assert!(
            file_size < 1024,
            "sparse 1-pixel edit EPL should be < 1KB, got {} bytes",
            file_size
        );

        // Also verify the minimum: must be > 32 (header alone) to have actual data
        assert!(
            file_size > 32,
            "EPL should have data beyond the 32-byte header, got {} bytes",
            file_size
        );

        // Reload and verify the pixel value survived
        let mut store = TileStore::with_epl(path);
        assert_eq!(
            store.get_pixel(5, 5),
            0x00FF0000,
            "pixel value must survive roundtrip"
        );

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_procedural_baseline_eviction_reread() {
        // Write a v2 exception to a chunk, force eviction from LRU,
        // then re-read -- the procedural genome must regenerate the exact
        // same baseline so the exception bitmap still applies correctly.
        let path = "/tmp/geos_procedural_eviction_test.epl";
        let _ = std::fs::remove_file(path);

        {
            let mut store = TileStore::with_epl(path);
            store.procedural_enabled = true;

            // Write a sparse edit to a specific pixel
            store.set_pixel(100, 200, 0x00ABCDEF);
            store.flush();

            // Force eviction: set max_chunks to 0 (everything gets evicted)
            // then access a different chunk to trigger eviction
            let key = TileStore::world_to_chunk(100, 200);
            store.max_chunks = 1; // keep only 1 chunk at a time

            // Touch a far-away chunk to force eviction of our chunk
            store.ensure_chunk(9999, 9999);
            assert!(
                !store.chunks.contains_key(&key),
                "original chunk should be evicted"
            );

            // Re-read the pixel -- should get it back from EPL replay
            let pixel = store.get_pixel(100, 200);
            assert_eq!(
                pixel, 0x00ABCDEF,
                "pixel must survive eviction + re-read (procedural baseline + exception)"
            );
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_cold_mount_journal_replay_latency() {
        // Append many small edits, close, reopen -- measure that
        // TileStore::with_epl() completes in a reasonable time.
        let path = "/tmp/geos_journal_replay_test.epl";
        let _ = std::fs::remove_file(path);

        const NUM_EDITS: usize = 1000;

        // Phase 1: write many small edits
        {
            let mut store = TileStore::with_epl(path);
            for i in 0..NUM_EDITS {
                let x = (i % 64) as i32;
                let y = (i / 64) as i32;
                store.set_pixel(x, y, (i as u32) | 0x00FF0000);
            }
            store.flush();
        }

        let file_size = std::fs::metadata(path).map(|m| m.len()).unwrap_or(0);

        // Phase 2: cold mount (reopen) and verify all pixels
        let start = std::time::Instant::now();
        let mut store = TileStore::with_epl(path);
        let elapsed = start.elapsed();

        // Verify a sample of pixels
        for i in [0, 100, 500, 999] {
            let x = (i % 64) as i32;
            let y = (i / 64) as i32;
            let expected = (i as u32) | 0x00FF0000;
            let actual = store.get_pixel(x, y);
            assert_eq!(
                actual, expected,
                "pixel ({},{}) mismatch after replay",
                x, y
            );
        }

        // Replay should complete in under 1 second for 1000 edits
        assert!(
            elapsed.as_secs() < 1,
            "journal replay took {:?} for {} edits ({} bytes on disk) -- should be < 1s",
            elapsed,
            NUM_EDITS,
            file_size
        );

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_lru_stale_entries_skipped() {
        let mut store = TileStore::new();
        store.procedural_enabled = false;
        store.max_chunks = 2;

        // Create and evict pattern that leaves stale entries in the deque
        store.ensure_chunk(0, 0);
        store.ensure_chunk(1, 0);
        store.ensure_chunk(2, 0); // evicts (0,0)

        // (0,0) has stale entries in access_order but was already removed from chunks.
        // Ensure we can still evict correctly.
        assert_eq!(store.chunks.len(), 2);
        assert!(!store.chunks.contains_key(&(0, 0)));

        store.ensure_chunk(3, 0); // should evict (1,0)
        assert_eq!(store.chunks.len(), 2);
        assert!(store.chunks.contains_key(&(2, 0)));
        assert!(store.chunks.contains_key(&(3, 0)));
    }
}
