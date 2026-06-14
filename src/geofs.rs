use crate::pixel::{BootMode, BootPixel};
use crate::tile_store::TileStore;

/// A file or directory entry on the spatial file system.
pub struct GeoFile {
    pub boot_pixel: BootPixel,
    pub x: i32,
    pub y: i32,
    pub w: i32,
    pub h: i32,
    pub name: String,
    pub children: Vec<GeoFile>,
}

impl GeoFile {
    /// Euclidean distance from this file's center to the FS root.
    pub fn distance_to(&self, root_x: i32, root_y: i32) -> f64 {
        let cx = self.x + self.w / 2;
        let cy = self.y + self.h / 2;
        let dx = (cx - root_x) as f64;
        let dy = (cy - root_y) as f64;
        (dx * dx + dy * dy).sqrt()
    }
}

/// Spatial file system rooted at (root_x, root_y) on the infinite map.
/// Files radiate outward in rings from center.
pub struct GeoFS {
    pub root_x: i32,
    pub root_y: i32,
}

impl GeoFS {
    pub fn new(root_x: i32, root_y: i32) -> Self {
        Self { root_x, root_y }
    }

    // ── String I/O ──────────────────────────────────────────────────

    fn read_string_at(tile_store: &mut TileStore, x: i32, y: i32, max_len: i32) -> String {
        let mut s = String::new();
        for dx in 0..max_len {
            let p = tile_store.get_pixel(x + dx, y);
            let c = (p & 0xFF) as u8;
            if c == 0 {
                break;
            }
            s.push(c as char);
        }
        s
    }

    fn write_string_at(tile_store: &mut TileStore, x: i32, y: i32, name: &str) {
        for (i, b) in name.bytes().enumerate() {
            tile_store.set_pixel(x + i as i32, y, 0xA000_0000 | (b as u32));
        }
        tile_store.set_pixel(x + name.len() as i32, y, 0);
    }

    // ── Write operations ────────────────────────────────────────────

    /// Create a directory BootPixel at (x, y) with region (w, h).
    pub fn mkdir(&self, tile_store: &mut TileStore, x: i32, y: i32, w: i32, h: i32, name: &str) {
        let boot_seed = 0xD000_0000_u32;
        tile_store.set_pixel(x, y, boot_seed);
        Self::write_string_at(tile_store, x, y + 1, name);
        tile_store.set_pixel(x + 1, y, w as u32);
        tile_store.set_pixel(x + 2, y, h as u32);
    }

    /// Create a file BootPixel at (x, y).
    pub fn touch(
        &self,
        tile_store: &mut TileStore,
        x: i32,
        y: i32,
        w: i32,
        h: i32,
        name: &str,
        mode: BootMode,
    ) {
        let mode_bits = match mode {
            BootMode::AsmSource => 0,
            BootMode::RawBytecode => 1,
            BootMode::PixelpackCompressed => 2,
            BootMode::NeuralSubstrate => 3,
            BootMode::ChainBoot => 4,
            BootMode::Directory => 5,
        };
        let boot_seed = (1_u32 << 31) | (mode_bits << 28);
        tile_store.set_pixel(x, y, boot_seed);
        Self::write_string_at(tile_store, x, y + 1, name);
        tile_store.set_pixel(x + 1, y, w as u32);
        tile_store.set_pixel(x + 2, y, h as u32);
    }

    // ── Ring allocator ──────────────────────────────────────────────

    /// Allocate a (w, h) region at the given ring distance from root.
    /// Ring 0 = the 64px band immediately surrounding the root point.
    /// Ring N = the Nth 64px band outward.
    ///
    /// Returns the top-left corner of the first free (w, h) rectangle found.
    pub fn allocate(
        &self,
        tile_store: &mut TileStore,
        w: i32,
        h: i32,
        ring: u32,
    ) -> Result<(i32, i32), String> {
        if w <= 0 || h <= 0 {
            return Err("GeoFS: width and height must be > 0".into());
        }
        let band = 64i32; // ring width
        let inner = (ring as i32) * band;
        let outer = inner + band;

        // Scan the ring band as a rectangular frame around the root.
        // For ring 0: the frame from root±0 to root±64.
        // We scan row by row, column by column, with alignment step.
        let step = 4i32;

        // Scan rows: north band (above root), then south band (below root)
        for row_dir in &[-1i32, 1i32] {
            let y_start = self.root_y + row_dir * inner;
            let y_end = self.root_y + row_dir * outer;
            let (lo, hi) = if y_start < y_end {
                (y_start, y_end)
            } else {
                (y_end, y_start)
            };
            let mut ry = lo;
            while ry + h <= hi {
                let mut rx = self.root_x - outer;
                while rx + w <= self.root_x + outer {
                    if self.region_free(tile_store, rx, ry, w, h) {
                        return Ok((rx, ry));
                    }
                    rx += step;
                }
                ry += step;
            }
        }

        // Scan columns: west band (left of root), east band (right of root)
        for col_dir in &[-1i32, 1i32] {
            let x_start = self.root_x + col_dir * inner;
            let x_end = self.root_x + col_dir * outer;
            let (lo, hi) = if x_start < x_end {
                (x_start, x_end)
            } else {
                (x_end, x_start)
            };
            let mut rx = lo;
            while rx + w <= hi {
                let mut ry = self.root_y - outer;
                while ry + h <= self.root_y + outer {
                    if self.region_free(tile_store, rx, ry, w, h) {
                        return Ok((rx, ry));
                    }
                    ry += step;
                }
                rx += step;
            }
        }

        Err(format!(
            "GeoFS: no free {}x{} region in ring {}",
            w, h, ring
        ))
    }

    /// Auto-place a file in the next available slot at a given ring.
    /// Returns the allocated (x, y) position.
    pub fn auto_touch(
        &self,
        tile_store: &mut TileStore,
        w: i32,
        h: i32,
        name: &str,
        mode: BootMode,
        ring: u32,
    ) -> Result<(i32, i32), String> {
        let (x, y) = self.allocate(tile_store, w, h, ring)?;
        self.touch(tile_store, x, y, w, h, name, mode);
        Ok((x, y))
    }

    /// Auto-place a directory in the next available slot at a given ring.
    pub fn auto_mkdir(
        &self,
        tile_store: &mut TileStore,
        w: i32,
        h: i32,
        name: &str,
        ring: u32,
    ) -> Result<(i32, i32), String> {
        let (x, y) = self.allocate(tile_store, w, h, ring)?;
        self.mkdir(tile_store, x, y, w, h, name);
        Ok((x, y))
    }

    /// Check if a rectangular region is entirely free (all pixels = 0).
    fn region_free(&self, tile_store: &mut TileStore, x: i32, y: i32, w: i32, h: i32) -> bool {
        for dy in 0..h {
            for dx in 0..w {
                if tile_store.get_pixel(x + dx, y + dy) != 0 {
                    return false;
                }
            }
        }
        true
    }

    // ── Read operations ─────────────────────────────────────────────

    /// Read a directory or file starting at (x, y).
    pub fn ls(&self, tile_store: &mut TileStore, x: i32, y: i32) -> Result<GeoFile, String> {
        let raw = tile_store.get_pixel(x, y);
        let boot_pixel = BootPixel::parse(raw).ok_or("Invalid boot pixel")?;

        let w = tile_store.get_pixel(x + 1, y) as i32;
        let h = tile_store.get_pixel(x + 2, y) as i32;

        let w = if w <= 0 || w > 10000 { 64 } else { w };
        let h = if h <= 0 || h > 10000 { 64 } else { h };

        // Names can extend beyond the file's w -- use a fixed max
        let name = Self::read_string_at(tile_store, x, y + 1, 256);

        let mut children = Vec::new();
        if boot_pixel.mode == BootMode::Directory {
            let mut occupied = Vec::new();
            let mut cy = y + 2;
            while cy < y + h {
                let mut cx = x;
                while cx < x + w {
                    let mut in_occupied = false;
                    for &(ox, oy, ow, oh) in &occupied {
                        if cx >= ox && cx < ox + ow && cy >= oy && cy < oy + oh {
                            cx = ox + ow;
                            in_occupied = true;
                            break;
                        }
                    }

                    if in_occupied {
                        continue;
                    }

                    let pixel = tile_store.get_pixel(cx, cy);
                    if BootPixel::parse(pixel).is_some() {
                        if let Ok(child) = self.ls(tile_store, cx, cy) {
                            let cw = child.w.max(1);
                            let ch = child.h.max(1);
                            occupied.push((cx, cy, cw, ch));
                            children.push(child);
                            cx += cw;
                            continue;
                        }
                    }
                    cx += 1;
                }
                cy += 1;
            }
        }

        Ok(GeoFile {
            boot_pixel,
            x,
            y,
            w,
            h,
            name,
            children,
        })
    }

    /// List all files in a ring band (for browsing the map).
    /// Scans the ring band for BootPixels and returns them sorted by distance.
    pub fn ls_ring(&self, tile_store: &mut TileStore, ring: u32) -> Vec<GeoFile> {
        let ring_width = 64i32;
        let inner = (ring as i32) * ring_width;
        let outer = inner + ring_width;

        let mut files = Vec::new();
        let step = 4i32; // scan granularity

        // Scan the entire ring band (4 edges of a square)
        // North edge
        let mut y = self.root_y - outer;
        while y < self.root_y - inner {
            let mut x = self.root_x - outer;
            while x < self.root_x + outer {
                let p = tile_store.get_pixel(x, y);
                if BootPixel::parse(p).is_some() {
                    if let Ok(f) = self.ls(tile_store, x, y) {
                        let advance = f.w.max(1);
                        files.push(f);
                        x += advance;
                        continue;
                    }
                }
                x += step;
            }
            y += step;
        }
        // South edge
        y = self.root_y + inner;
        while y < self.root_y + outer {
            let mut x = self.root_x - outer;
            while x < self.root_x + outer {
                let p = tile_store.get_pixel(x, y);
                if BootPixel::parse(p).is_some() {
                    if let Ok(f) = self.ls(tile_store, x, y) {
                        let advance = f.w.max(1);
                        files.push(f);
                        x += advance;
                        continue;
                    }
                }
                x += step;
            }
            y += step;
        }
        // West edge
        let mut x = self.root_x - outer;
        while x < self.root_x - inner {
            let mut y2 = self.root_y - inner;
            while y2 < self.root_y + inner {
                let p = tile_store.get_pixel(x, y2);
                if BootPixel::parse(p).is_some() {
                    if let Ok(f) = self.ls(tile_store, x, y2) {
                        let advance = f.h.max(1);
                        files.push(f);
                        y2 += advance;
                        continue;
                    }
                }
                y2 += step;
            }
            x += step;
        }
        // East edge
        x = self.root_x + inner;
        while x < self.root_x + outer {
            let mut y2 = self.root_y - inner;
            while y2 < self.root_y + inner {
                let p = tile_store.get_pixel(x, y2);
                if BootPixel::parse(p).is_some() {
                    if let Ok(f) = self.ls(tile_store, x, y2) {
                        let advance = f.h.max(1);
                        files.push(f);
                        y2 += advance;
                        continue;
                    }
                }
                y2 += step;
            }
            x += step;
        }

        // Sort by distance from root (closest first)
        files.sort_by(|a, b| {
            a.distance_to(self.root_x, self.root_y)
                .partial_cmp(&b.distance_to(self.root_x, self.root_y))
                .unwrap_or(std::cmp::Ordering::Equal)
        });

        files
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_geofs_mkdir_and_ls() {
        let mut store = TileStore::new();
        let fs = GeoFS::new(128, 128);

        fs.mkdir(&mut store, 128, 128, 20, 20, "root_dir");

        let root = fs.ls(&mut store, 128, 128).expect("ls root");
        assert_eq!(root.name, "root_dir");
        assert_eq!(root.w, 20);
        assert_eq!(root.h, 20);
        assert_eq!(root.boot_pixel.mode, BootMode::Directory);
        assert_eq!(root.children.len(), 0);

        fs.touch(
            &mut store,
            130,
            130,
            10,
            10,
            "file.txt",
            BootMode::AsmSource,
        );
        let root = fs.ls(&mut store, 128, 128).expect("ls root");
        assert_eq!(root.children.len(), 1);
        assert_eq!(root.children[0].name, "file.txt");
        assert_eq!(root.children[0].w, 10);
        assert_eq!(root.children[0].h, 10);
        assert_eq!(root.children[0].boot_pixel.mode, BootMode::AsmSource);
    }

    #[test]
    fn test_ring_allocator_auto_touch() {
        let mut store = TileStore::new();
        // Use root at (4096, 4096) to avoid procedural terrain in ring area
        let fs = GeoFS::new(4096, 4096);

        // Zero-fill ring 0 (64px band) around root so allocate() can find free slots
        let band = 64i32;
        for dy in -band..band {
            for dx in -band..band {
                store.set_pixel(4096 + dx, 4096 + dy, 0);
            }
        }

        // Place root directory at center
        fs.mkdir(&mut store, 4096, 4096, 16, 16, "root");

        // Auto-place files in ring 0 (64px band around root)
        let (x1, y1) = fs
            .auto_touch(&mut store, 8, 8, "editor.asm", BootMode::AsmSource, 0)
            .expect("alloc editor");
        let (x2, y2) = fs
            .auto_touch(&mut store, 8, 8, "shell.asm", BootMode::AsmSource, 0)
            .expect("alloc shell");

        // Both should be in ring 0 (within 64px band around root, but outside root)
        let d1 = ((x1 + 4 - 4096) as f64).hypot((y1 + 4 - 4096) as f64);
        let d2 = ((x2 + 4 - 4096) as f64).hypot((y2 + 4 - 4096) as f64);

        // Should be within ring 0 band (16..80 from center, roughly)
        assert!(d1 > 8.0, "editor should be outside root: d={}", d1);
        assert!(d1 < 128.0, "editor should be in ring 0: d={}", d1);
        assert!(d2 > 8.0, "shell should be outside root: d={}", d2);
        assert!(d2 < 128.0, "shell should be in ring 0: d={}", d2);

        // They should not overlap
        assert!(
            !(x1 == x2 && y1 == y2),
            "files should not be placed at same coords"
        );

        // Both should be readable
        let f1 = fs.ls(&mut store, x1, y1).expect("ls editor");
        assert_eq!(f1.name, "editor.asm");
        let f2 = fs.ls(&mut store, x2, y2).expect("ls shell");
        assert_eq!(f2.name, "shell.asm");
    }

    #[test]
    fn test_ring_separation() {
        let mut store = TileStore::new();
        // Use root at (4096, 4096) to avoid procedural terrain
        let fs = GeoFS::new(4096, 4096);

        // Zero-fill rings 0-1 (128px band) around root
        for dy in -128..128 {
            for dx in -128..128 {
                store.set_pixel(4096 + dx, 4096 + dy, 0);
            }
        }

        // Place files in rings 0 and 1
        let (x0, y0) = fs
            .auto_touch(&mut store, 4, 4, "core.asm", BootMode::AsmSource, 0)
            .expect("ring 0");
        let (x1, y1) = fs
            .auto_touch(&mut store, 4, 4, "game.asm", BootMode::AsmSource, 1)
            .expect("ring 1");

        let d0 = ((x0 - 4096) as f64).hypot((y0 - 4096) as f64);
        let d1 = ((x1 - 4096) as f64).hypot((y1 - 4096) as f64);

        // Ring 1 should be further from center than ring 0
        assert!(
            d1 > d0,
            "ring 1 ({}) should be further than ring 0 ({})",
            d1,
            d0
        );
    }

    #[test]
    fn test_ls_ring() {
        let mut store = TileStore::new();
        // Use root at (4096, 4096) to avoid procedural terrain
        let fs = GeoFS::new(4096, 4096);

        // Zero-fill rings 0-1 (128px band) around root
        for dy in -128..128 {
            for dx in -128..128 {
                store.set_pixel(4096 + dx, 4096 + dy, 0);
            }
        }

        // Place 3 files in ring 0
        fs.auto_touch(&mut store, 4, 4, "a.asm", BootMode::AsmSource, 0)
            .expect("a");
        fs.auto_touch(&mut store, 4, 4, "b.asm", BootMode::AsmSource, 0)
            .expect("b");
        fs.auto_touch(&mut store, 4, 4, "c.asm", BootMode::AsmSource, 0)
            .expect("c");

        // Place 1 file in ring 1
        fs.auto_touch(&mut store, 4, 4, "d.asm", BootMode::AsmSource, 1)
            .expect("d");

        let ring0 = fs.ls_ring(&mut store, 0);
        let ring1 = fs.ls_ring(&mut store, 1);

        assert_eq!(ring0.len(), 3, "ring 0 should have 3 files");
        assert_eq!(ring1.len(), 1, "ring 1 should have 1 file");

        // Ring 1 file should be further out
        let d0_max = ring0
            .iter()
            .map(|f| f.distance_to(4096, 4096))
            .fold(0.0f64, f64::max);
        let d1_min = ring1[0].distance_to(4096, 4096);
        assert!(
            d1_min > d0_max * 0.5,
            "ring 1 min ({}) should be well beyond ring 0 max ({})",
            d1_min,
            d0_max
        );
    }
}
