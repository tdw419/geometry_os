// pixelfs.rs -- Spatial 2D File System for Geometry OS
//
// PixelFS maps files to 2D grid locations (x, y) and uses the temporal
// dimension (frames) for versioning.
//
// "The Screen is the Hard Drive."
//
// Layout on 256x256 grid:
//   Rows 0-3 (pixels 0-1023): BootChain manifest + directory entries
//   Rows 4-255: File data regions (each file = rectangular block)
//
// Directory entry format (3 seeds per file):
//   seed 0: [x:8 | y:8 | w:8 | h:8]  -- spatial location and size
//   seed 1: [data_len:32]              -- exact byte count
//   seed 2: name packed as u32 (up to 4 chars, or use name_seeds for longer)
//
// For names > 4 chars, additional name seeds follow before the next entry.

use crate::pixel::{BiosResolution, BootChain, ChainRegionType};

/// Detailed metrics for a PixelGrid's health and state.
#[derive(Debug, Clone, PartialEq)]
pub struct StorageReport {
    pub total_pixels: usize,
    pub reserved_pixels: usize,
    pub allocated_pixels: usize,
    pub free_pixels: usize,
    pub density_pct: f32,
    pub fragmentation_score: f32,
    pub largest_free_block: usize,
    pub sediment_depth: u8,
    pub allocation_count: usize,
}

impl StorageReport {
    /// Generate a human-readable summary of the report.
    pub fn summarize(&self) -> String {
        let health = if self.fragmentation_score < 0.1 {
            "Excellent"
        } else if self.fragmentation_score < 0.3 {
            "Good"
        } else if self.fragmentation_score < 0.6 {
            "Fragmented"
        } else {
            "Degraded"
        };

        format!(
            "Storage: {:.1}% full | Depth: row {} | Health: {} | Max contiguous free: {}px",
            self.density_pct, self.sediment_depth, health, self.largest_free_block
        )
    }
}

/// A single file in PixelFS.
#[derive(Clone)]
pub struct PixelFile {
    pub name: String,
    pub x: u8,
    pub y: u8,
    pub width: u8,
    pub height: u8,
    pub frame: u32,
    pub data: Vec<u8>,
}

/// The spatial grid representation (256x256).
#[derive(Clone)]
pub struct PixelGrid {
    pub seeds: Vec<u32>, // 256x256 = 65536 seeds
    pub allocation_map: [bool; 65536],
}

impl PixelGrid {
    pub fn new() -> Self {
        let mut allocation_map = [false; 65536];
        // Reserve first 1024 pixels (rows 0-3) for BootChain + directory
        for i in 0..1024 {
            allocation_map[i] = true;
        }
        Self {
            seeds: vec![0; 65536],
            allocation_map,
        }
    }

    /// Find a free rectangular region for a file.
    pub fn find_region(&self, width: u8, height: u8) -> Option<(u8, u8)> {
        for y in 0..(256 - height as u16) {
            for x in 0..(256 - width as u16) {
                let mut free = true;
                for ry in 0..height as u16 {
                    for rx in 0..width as u16 {
                        if self.allocation_map[((y + ry) * 256 + (x + rx)) as usize] {
                            free = false;
                            break;
                        }
                    }
                    if !free {
                        break;
                    }
                }
                if free {
                    return Some((x as u8, y as u8));
                }
            }
        }
        None
    }

    /// Mark a region as allocated.
    pub fn allocate(&mut self, x: u8, y: u8, width: u8, height: u8) {
        for ry in 0..height as u16 {
            for rx in 0..width as u16 {
                self.allocation_map[((y as u16 + ry) * 256 + (x as u16 + rx)) as usize] = true;
            }
        }
    }

    /// Mark a region as free.
    pub fn deallocate(&mut self, x: u8, y: u8, width: u8, height: u8) {
        for ry in 0..height as u16 {
            for rx in 0..width as u16 {
                self.allocation_map[((y as u16 + ry) * 256 + (x as u16 + rx)) as usize] = false;
            }
        }
    }

    /// Generate a storage report for this grid.
    pub fn report(&self) -> StorageReport {
        let total = 65536;
        let reserved = 1024;
        let mut allocated = 0;
        let mut current_free_run = 0;
        let mut largest_free_block = 0;
        let mut max_y_allocated = 0;
        let mut in_allocation = false;
        let mut allocation_count = 0;
        let mut gaps = 0;

        for i in reserved..total {
            if self.allocation_map[i] {
                allocated += 1;
                let y = (i / 256) as u8;
                if y > max_y_allocated {
                    max_y_allocated = y;
                }
                if !in_allocation {
                    allocation_count += 1;
                    in_allocation = true;
                }
                current_free_run = 0;
            } else {
                if in_allocation {
                    in_allocation = false;
                }
                current_free_run += 1;
                if current_free_run > largest_free_block {
                    largest_free_block = current_free_run;
                }
                // Check for gaps (free space between allocations)
                if i > reserved && self.allocation_map[i - 1] {
                    gaps += 1;
                }
            }
        }

        let usable_total = total - reserved;
        let density_pct = (allocated as f32 / usable_total as f32) * 100.0;

        // Fragmentation score: ratio of gaps to total allocations
        let fragmentation_score = if allocation_count > 1 {
            (gaps as f32 / allocation_count as f32).min(1.0)
        } else {
            0.0
        };

        StorageReport {
            total_pixels: total,
            reserved_pixels: reserved,
            allocated_pixels: allocated,
            free_pixels: usable_total - allocated,
            density_pct,
            fragmentation_score,
            largest_free_block,
            sediment_depth: max_y_allocated,
            allocation_count,
        }
    }

    /// Render the allocation map as a 256x256 framebuffer (0x00RRGGBB pixels).
    /// If `highlight_file` is provided, those pixels are rendered in Cyan.
    pub fn render_allocation_map(&self, highlight_file: Option<&PixelFile>) -> Vec<u32> {
        const COLOR_RESERVED: u32 = 0x00FF0000; // Red
        const COLOR_ALLOCATED: u32 = 0x00FFFFFF; // White
        const COLOR_FREE: u32 = 0x00000000; // Black
        const COLOR_HIGHLIGHT: u32 = 0x0000FFFF; // Cyan

        let mut fb = vec![COLOR_FREE; 65536];

        for i in 0..65536 {
            if i < 1024 {
                fb[i] = COLOR_RESERVED;
            } else if self.allocation_map[i] {
                fb[i] = COLOR_ALLOCATED;
            }
        }

        // Apply highlight if requested
        if let Some(file) = highlight_file {
            for ry in 0..file.height as u16 {
                for rx in 0..file.width as u16 {
                    let idx = ((file.y as u16 + ry) * 256 + (file.x as u16 + rx)) as usize;
                    if idx < 65536 {
                        fb[idx] = COLOR_HIGHLIGHT;
                    }
                }
            }
        }

        fb
    }
}

/// Pack a name string into seeds (public for testing).
pub fn pack_name(name: &str) -> Vec<u32> {
    let bytes = name.as_bytes();
    let seed_count = if bytes.len() <= 3 {
        1
    } else {
        1 + (bytes.len() - 3 + 3) / 4
    };
    let mut seeds = Vec::with_capacity(seed_count);
    for i in 0..seed_count {
        let mut seed = 0u32;
        let max_j = if i == 0 { 3 } else { 4 };
        let base = if i == 0 { 0 } else { 3 + (i - 1) * 4 };
        for j in 0..max_j {
            let b_idx = base + j;
            if b_idx < bytes.len() {
                seed |= (bytes[b_idx] as u32) << (j * 8);
            }
        }
        if i == 0 {
            seed |= (bytes.len() as u32) << 24;
        }
        seeds.push(seed);
    }
    seeds
}

/// Unpack a name from seeds (public for testing).
pub fn unpack_name(name_seeds: &[u32]) -> String {
    if name_seeds.is_empty() {
        return String::new();
    }
    let name_len = ((name_seeds[0] >> 24) & 0xFF) as usize;
    if name_len == 0 {
        return String::new();
    }
    let mut bytes = Vec::with_capacity(name_len);

    for j in 0..3 {
        if bytes.len() >= name_len {
            break;
        }
        bytes.push(((name_seeds[0] >> (j * 8)) & 0xFF) as u8);
    }

    for i in 1..name_seeds.len() {
        for j in 0..4 {
            if bytes.len() >= name_len {
                break;
            }
            bytes.push(((name_seeds[i] >> (j * 8)) & 0xFF) as u8);
        }
    }

    String::from_utf8_lossy(&bytes).into_owned()
}

/// PixelFS manager.
pub struct PixelFS {
    pub grids: Vec<PixelGrid>, // One grid per frame
    pub files: Vec<PixelFile>,
    undo_stack: Vec<(Vec<PixelGrid>, Vec<PixelFile>)>,
    redo_stack: Vec<(Vec<PixelGrid>, Vec<PixelFile>)>,
}

impl PixelFS {
    pub fn new() -> Self {
        Self {
            grids: vec![PixelGrid::new()],
            files: Vec::new(),
            undo_stack: Vec::new(),
            redo_stack: Vec::new(),
        }
    }

    /// Push current state onto undo stack (call before mutations).
    fn checkpoint(&mut self) {
        const MAX_UNDO: usize = 32;
        self.redo_stack.clear();
        self.undo_stack
            .push((self.grids.clone(), self.files.clone()));
        if self.undo_stack.len() > MAX_UNDO {
            self.undo_stack.remove(0);
        }
    }

    /// Undo the last mutation. Returns true if undone.
    pub fn undo(&mut self) -> bool {
        if let Some((grids, files)) = self.undo_stack.pop() {
            self.redo_stack.push((
                std::mem::take(&mut self.grids),
                std::mem::take(&mut self.files),
            ));
            self.grids = grids;
            self.files = files;
            true
        } else {
            false
        }
    }

    /// Redo the last undone mutation. Returns true if redone.
    pub fn redo(&mut self) -> bool {
        if let Some((grids, files)) = self.redo_stack.pop() {
            self.undo_stack.push((
                std::mem::take(&mut self.grids),
                std::mem::take(&mut self.files),
            ));
            self.grids = grids;
            self.files = files;
            true
        } else {
            false
        }
    }

    pub fn create_file(&mut self, name: &str, data: Vec<u8>) -> Result<(), String> {
        let data_pixels = (data.len() + 3) / 4;
        let total_pixels = 1 + data_pixels;

        let width = total_pixels.min(256) as u8;
        let height = ((total_pixels + 255) / 256) as u8;
        let width = width.max(1);
        let height = height.max(1);

        let frame_idx = self.grids.len() - 1;
        if let Some((x, y)) = self.grids[frame_idx].find_region(width, height) {
            self.grids[frame_idx].allocate(x, y, width, height);

            let file = PixelFile {
                name: name.to_string(),
                x,
                y,
                width,
                height,
                frame: frame_idx as u32,
                data,
            };
            self.files.push(file);
            Ok(())
        } else {
            Err("No space left on grid".into())
        }
    }

    pub fn read_file(&self, name: &str) -> Option<&PixelFile> {
        let frame = self.grids.len() - 1;
        self.files
            .iter()
            .find(|f| f.name == name && f.frame as usize == frame)
    }

    pub fn delete_file(&mut self, name: &str) -> Result<(), String> {
        self.checkpoint();
        let frame = self.grids.len() - 1;
        let idx = self
            .files
            .iter()
            .position(|f| f.name == name && f.frame as usize == frame)
            .ok_or_else(|| format!("File '{}' not found", name))?;

        let file = &self.files[idx];
        self.grids[frame].deallocate(file.x, file.y, file.width, file.height);
        self.files.remove(idx);
        Ok(())
    }

    pub fn move_file(&mut self, name: &str, new_x: u8, new_y: u8) -> Result<(), String> {
        self.checkpoint();
        let frame = self.grids.len() - 1;
        let idx = self
            .files
            .iter()
            .position(|f| f.name == name && f.frame as usize == frame)
            .ok_or_else(|| format!("File '{}' not found", name))?;

        let (old_x, old_y, w, h) = {
            let f = &self.files[idx];
            (f.x, f.y, f.width, f.height)
        };
        self.grids[frame].deallocate(old_x, old_y, w, h);

        let mut free = true;
        for ry in 0..h as u16 {
            for rx in 0..w as u16 {
                let x = new_x as u16 + rx;
                let y = new_y as u16 + ry;
                if x >= 256 || y >= 256 || self.grids[frame].allocation_map[(y * 256 + x) as usize]
                {
                    free = false;
                    break;
                }
            }
            if !free {
                break;
            }
        }

        if free {
            self.grids[frame].allocate(new_x, new_y, w, h);
            let f = &mut self.files[idx];
            f.x = new_x;
            f.y = new_y;
            Ok(())
        } else {
            self.grids[frame].allocate(old_x, old_y, w, h);
            Err(format!("Collision at ({}, {})", new_x, new_y))
        }
    }

    /// Compact all files toward the top-left, eliminating gaps.
    /// Returns (files_moved, bytes_recovered) where bytes_recovered is the
    /// number of pixels freed below the new deepest allocation.
    pub fn defrag(&mut self) -> (usize, usize) {
        self.checkpoint();
        let frame = self.grids.len() - 1;

        // Collect current-frame files sorted by position (top-left first)
        let mut file_entries: Vec<(String, u8, u8, u8, u8)> = self
            .files
            .iter()
            .filter(|f| f.frame as usize == frame)
            .map(|f| (f.name.clone(), f.x, f.y, f.width, f.height))
            .collect();
        file_entries.sort_by_key(|&(_, x, y, _, _)| (y as u16 * 256 + x as u16));

        // Clear all file allocations from the grid
        for &(_, x, y, w, h) in &file_entries {
            self.grids[frame].deallocate(x, y, w, h);
        }

        // Re-pack files sequentially from row 4 onward (row 0-3 reserved)
        let mut cursor_x: u8 = 0;
        let mut cursor_y: u8 = 4;
        let mut moved = 0;

        for (name, old_x, old_y, w, h) in &file_entries {
            // Does this file fit on the current row?
            if cursor_x as u16 + *w as u16 > 256 {
                // Wrap to next row
                cursor_x = 0;
                cursor_y = cursor_y + *h;
            }

            if old_x != &cursor_x || old_y != &cursor_y {
                moved += 1;
            }

            self.grids[frame].allocate(cursor_x, cursor_y, *w, *h);

            // Update the file record
            if let Some(f) = self
                .files
                .iter_mut()
                .find(|f| &f.name == name && f.frame as usize == frame)
            {
                f.x = cursor_x;
                f.y = cursor_y;
            }

            cursor_x = cursor_x + *w;
        }

        // Count contiguous free pixels below deepest allocation
        let new_depth = self
            .files
            .iter()
            .filter(|f| f.frame as usize == frame)
            .map(|f| f.y as usize + f.height as usize)
            .max()
            .unwrap_or(4);

        let free_pixels = (256 - new_depth) * 256;
        (moved, free_pixels)
    }

    pub fn list_files(&self) -> Vec<&PixelFile> {
        let frame = self.grids.len() - 1;
        self.files
            .iter()
            .filter(|f| f.frame as usize == frame)
            .collect()
    }

    /// Find a file at a specific (x, y) coordinate in the current frame.
    pub fn get_file_at(&self, x: u8, y: u8) -> Option<&PixelFile> {
        let frame = self.grids.len() - 1;
        self.files.iter().find(|f| {
            f.frame as usize == frame
                && x >= f.x
                && x < (f.x + f.width)
                && y >= f.y
                && y < (f.y + f.height)
        })
    }

    pub fn serialize_to_seeds(&self, frame_idx: usize) -> Result<Vec<u32>, String> {
        if frame_idx >= self.grids.len() {
            return Err("Invalid frame index".into());
        }

        let mut seeds = vec![0u32; 65536];
        let mut dir_seeds = Vec::new();
        for file in &self.files {
            if file.frame as usize != frame_idx {
                continue;
            }
            let metadata = (file.x as u32)
                | ((file.y as u32) << 8)
                | ((file.width as u32) << 16)
                | ((file.height as u32) << 24);
            dir_seeds.push(metadata);
            dir_seeds.push(file.data.len() as u32);
            let name_seeds = pack_name(&file.name);
            dir_seeds.extend(name_seeds);
        }

        let byte_count = (dir_seeds.len() * 4) as u32;
        let regions = vec![(ChainRegionType::Directory, dir_seeds.as_slice(), byte_count)];
        let chain_seeds = BootChain::build(crate::pixel::BiosResolution::Classic256, &regions);

        for (i, seed) in chain_seeds.iter().enumerate() {
            if i >= 65536 {
                break;
            }
            seeds[i] = *seed;
        }

        for file in &self.files {
            if file.frame as usize != frame_idx {
                continue;
            }
            let base_idx = (file.y as usize * 256) + file.x as usize;
            let file_boot = 0x8000_0000 | (file.data.len() as u32 & 0x0FFF_FFFF);
            seeds[base_idx] = file_boot;

            for i in 0..((file.data.len() + 3) / 4) {
                let s_idx = base_idx + 1 + i;
                if s_idx >= 65536 {
                    break;
                }
                let mut seed = 0u32;
                for j in 0..4 {
                    let b_idx = i * 4 + j;
                    if b_idx < file.data.len() {
                        seed |= (file.data[b_idx] as u32) << (j * 8);
                    }
                }
                seeds[s_idx] = seed;
            }
        }
        Ok(seeds)
    }

    pub fn deserialize_from_seeds(seeds: &[u32]) -> Result<Self, String> {
        let chain = BootChain::parse(seeds)?;
        let dir_region_idx = chain
            .regions
            .iter()
            .position(|r| r.region_type == ChainRegionType::Directory)
            .ok_or("No Directory region found in BootChain")?;

        let dir_region = &chain.regions[dir_region_idx];
        let dir_start = dir_region.seed_index as usize;
        let dir_end = dir_start + dir_region.seed_count as usize;
        let dir_seeds = &seeds[dir_start..dir_end];
        let mut files = Vec::new();
        let mut pos = 0;

        while pos + 2 < dir_seeds.len() {
            let meta = dir_seeds[pos];
            let x = (meta & 0xFF) as u8;
            let y = ((meta >> 8) & 0xFF) as u8;
            let w = ((meta >> 16) & 0xFF) as u8;
            let h = ((meta >> 24) & 0xFF) as u8;
            pos += 1;

            let data_len = dir_seeds[pos] as usize;
            pos += 1;

            let name_len = ((dir_seeds[pos] >> 24) & 0xFF) as usize;
            let name_seed_count = if name_len <= 3 {
                1
            } else {
                1 + (name_len - 3 + 3) / 4
            };
            let name = unpack_name(&dir_seeds[pos..pos + name_seed_count]);
            pos += name_seed_count;

            let base_idx = (y as usize * 256) + x as usize;
            let data_pixel_count = (data_len + 3) / 4;
            let mut data = Vec::with_capacity(data_len);
            for i in 0..data_pixel_count {
                let s_idx = base_idx + 1 + i;
                if s_idx >= seeds.len() {
                    break;
                }
                let seed = seeds[s_idx];
                for j in 0..4 {
                    if data.len() >= data_len {
                        break;
                    }
                    data.push(((seed >> (j * 8)) & 0xFF) as u8);
                }
            }

            files.push(PixelFile {
                name,
                x,
                y,
                width: w,
                height: h,
                frame: 0,
                data,
            });
        }

        let mut grid = PixelGrid::new();
        for file in &files {
            grid.allocate(file.x, file.y, file.width, file.height);
        }

        Ok(Self {
            grids: vec![grid],
            files,
            undo_stack: Vec::new(),
            redo_stack: Vec::new(),
        })
    }

    pub fn commit_frame(&mut self) -> Vec<u32> {
        let snapshot = self.render_allocation_map(None);
        self.grids.push(PixelGrid::new());
        snapshot
    }

    pub fn diff_frames(&self, f1: usize, f2: usize) -> Result<Vec<u32>, String> {
        if f1 >= self.grids.len() || f2 >= self.grids.len() {
            return Err("Frame index out of bounds".into());
        }
        let fb1 = self.grids[f1].render_allocation_map(None);
        let fb2 = self.grids[f2].render_allocation_map(None);
        let mut diff = vec![0u32; 65536];
        for i in 0..65536 {
            if fb1[i] != fb2[i] {
                diff[i] = 0x0000FF00;
            } else {
                diff[i] = fb1[i];
            }
        }
        Ok(diff)
    }

    pub fn render_allocation_map(&self, highlight_file: Option<&PixelFile>) -> Vec<u32> {
        let frame = self.grids.len() - 1;
        self.grids[frame].render_allocation_map(highlight_file)
    }

    /// Save a specific frame of the filesystem to an RTS PNG file.
    pub fn save_to_png(&self, frame_idx: usize, path: &str) -> Result<(), String> {
        let seeds = self.serialize_to_seeds(frame_idx)?;
        crate::pixel::save_seeds_to_png(path, &seeds, "linear")
    }

    /// Load a PixelFS state from an RTS PNG file.
    /// Note: This replaces the current filesystem state.
    pub fn load_from_png(path: &str) -> Result<Self, String> {
        let seeds = crate::pixel::load_seeds_from_png(path)?;
        Self::deserialize_from_seeds(&seeds)
    }

    /// Generate a storage report for the current frame.
    pub fn report(&self) -> StorageReport {
        let frame = self.grids.len() - 1;
        self.grids[frame].report()
    }
}
