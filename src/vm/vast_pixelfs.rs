//! vast_pixelfs.rs -- Vast Tiled PixelFS implementation for Geometry OS
//!
//! Scales the extent-based GeoFS to the infinite Hilbert map.
//! Features:
//! - Extent-based allocation: store contiguous block ranges efficiently
//! - Refcount garbage collection: automatic space reclamation
//! - Spatial compaction: defragment Hilbert space when needed

use crate::tile_store::TileStore;
use crate::vm::vast_allocator::VastAllocator;
use crate::vm::vast_geometry::*;

/// Magic pixel for Vast PixelFS Inodes.
pub const MAGIC_INODE: u32 = 0x56494E31; // "VIN1"

/// Inode size in pixels (16x16 = 256 pixels = 1024 bytes).
pub const INODE_PIXELS: usize = 256;

/// Data block size in pixels (16x16 = 256 pixels = 1024 bytes).
pub const BLOCK_PIXELS: usize = 256;

/// An extent represents a contiguous range of data blocks.
#[derive(Clone, Copy, Debug)]
pub struct VastExtent {
    pub start: u64, // Hilbert index of first block
    pub count: u32, // Number of blocks in this extent
}

/// A Vast Inode represents a file or directory in the infinite map.
/// Uses extents for efficient multi-block storage.
pub struct VastInode {
    pub magic: u32,
    pub mode: u32,
    pub size: u64,
    pub extents: Vec<VastExtent>,
    pub name_hash: u32,
}

impl VastInode {
    /// Read an inode from a specific Hilbert index.
    pub fn read(store: &mut TileStore, index: u64) -> Option<Self> {
        let addr = VastAddr::from_hilbert_index(index);
        let magic = store.get_pixel(addr.x as i32, addr.y as i32);
        if magic != MAGIC_INODE {
            return None;
        }

        // Use Hilbert indices for metadata too to avoid 2D collisions
        let mode = store.get_pixel_at_index(index + 1);
        let size_low = store.get_pixel_at_index(index + 2);
        let size_high = store.get_pixel_at_index(index + 3);
        let size = (size_low as u64) | ((size_high as u64) << 32);
        let name_hash = store.get_pixel_at_index(index + 4);

        // Read extents starting from index + 32
        let mut extents = Vec::new();
        const PIXELS_PER_BLOCK: u64 = 256;
        let expected_blocks = (size + (PIXELS_PER_BLOCK * 4) - 1) / (PIXELS_PER_BLOCK * 4);
        let mut blocks_read = 0u64;

        for extent_idx in 0..112 {
            if blocks_read >= expected_blocks {
                break;
            }

            let start = store.get_pixel_at_index(index + 32 + (extent_idx as u64 * 2)) as u64;
            let count = store.get_pixel_at_index(index + 32 + (extent_idx as u64 * 2) + 1);

            if start == 0 && count == 0 {
                break;
            }

            let extent = VastExtent { start, count };
            extents.push(extent);
            blocks_read += count as u64;
        }

        Some(Self {
            magic,
            mode,
            size,
            extents,
            name_hash,
        })
    }

    /// Write inode state back to the substrate.
    pub fn write(&self, store: &mut TileStore, index: u64) {
        let addr = VastAddr::from_hilbert_index(index);
        store.set_pixel(addr.x as i32, addr.y as i32, MAGIC_INODE);
        store.set_pixel_at_index(index + 1, self.mode);
        store.set_pixel_at_index(index + 2, (self.size & 0xFFFFFFFF) as u32);
        store.set_pixel_at_index(index + 3, (self.size >> 32) as u32);
        store.set_pixel_at_index(index + 4, self.name_hash);

        // Clear extents area
        for i in 32..256 {
            store.set_pixel_at_index(index + i as u64, 0);
        }

        // Write extents (2 pixels per extent: start + count)
        for (extent_idx, extent) in self.extents.iter().enumerate() {
            if extent_idx >= 112 {
                break;
            }
            store.set_pixel_at_index(index + 32 + (extent_idx as u64 * 2), extent.start as u32);
            store.set_pixel_at_index(index + 32 + (extent_idx as u64 * 2) + 1, extent.count);
        }
    }
}

/// Helper extension for TileStore to work with Hilbert indices directly.
pub trait TileStoreHilbertExt {
    fn get_pixel_at_index(&mut self, index: u64) -> u32;
    fn set_pixel_at_index(&mut self, index: u64, color: u32);
}

impl TileStoreHilbertExt for TileStore {
    fn get_pixel_at_index(&mut self, index: u64) -> u32 {
        let addr = VastAddr::from_hilbert_index(index);
        self.get_pixel(addr.x as i32, addr.y as i32)
    }

    fn set_pixel_at_index(&mut self, index: u64, color: u32) {
        let addr = VastAddr::from_hilbert_index(index);
        self.set_pixel(addr.x as i32, addr.y as i32, color);
    }
}

/// The Vast PixelFS manager with extent allocation and garbage collection.
pub struct VastPixelFS {
    pub allocator: VastAllocator,
}

impl VastPixelFS {
    pub fn new() -> Self {
        Self {
            allocator: VastAllocator::new(),
        }
    }

    /// Calculate a simple spatial hash for a filename.
    pub fn hash_name(name: &str) -> u32 {
        let mut hash: u32 = 5381;
        for c in name.chars() {
            hash = ((hash << 5).wrapping_add(hash)).wrapping_add(c as u32);
        }
        hash
    }

    /// Implementation of the create_file circuit.
    pub fn create_file(&mut self, store: &mut TileStore, name: &str, mode: u32) -> Option<u64> {
        let name_hash = Self::hash_name(name);
        let inode_index = self.allocator.allocate(256)?;

        // Zero out the inode area
        for i in 0..256 {
            store.set_pixel_at_index(inode_index + i as u64, 0);
        }

        let inode = VastInode {
            magic: MAGIC_INODE,
            mode,
            size: 0,
            extents: Vec::new(),
            name_hash,
        };
        inode.write(store, inode_index);
        Some(inode_index)
    }

    /// Implementation of the write_file circuit using extents.
    pub fn write_file(
        &mut self,
        store: &mut TileStore,
        inode_index: u64,
        data: &[u32],
    ) -> Option<()> {
        // 1. Read the existing Inode
        let mut inode = VastInode::read(store, inode_index)?;

        // 2. Free existing extents
        for extent in &inode.extents {
            self.allocator.free(extent.start, extent.count as u64 * 256); // Count is blocks
        }
        inode.extents.clear();

        // 3. Calculate blocks needed
        let blocks_needed = (data.len() + BLOCK_PIXELS - 1) / BLOCK_PIXELS;

        // 4. Try to allocate as a single extent first
        if let Some((extent_start, _)) = self.allocator.allocate_extent(blocks_needed as u64) {
            inode.extents.push(VastExtent {
                start: extent_start,
                count: blocks_needed as u32,
            });

            // 5. Write data to the extent
            for (i, &pixel) in data.iter().enumerate() {
                store.set_pixel_at_index(extent_start + i as u64, pixel);
            }
        } else {
            // Fallback: allocate multiple extents
            let mut pixels_written = 0;
            while pixels_written < data.len() {
                let pixels_remaining = data.len() - pixels_written;
                let blocks_remaining = (pixels_remaining + BLOCK_PIXELS - 1) / BLOCK_PIXELS;
                let extent_blocks = blocks_remaining.min(32); // Max 32 blocks per extent

                if let Some((extent_start, _)) =
                    self.allocator.allocate_extent(extent_blocks as u64)
                {
                    inode.extents.push(VastExtent {
                        start: extent_start,
                        count: extent_blocks as u32,
                    });

                    let extent_pixels = (extent_blocks * BLOCK_PIXELS).min(pixels_remaining);
                    for i in 0..extent_pixels {
                        store.set_pixel_at_index(extent_start + i as u64, data[pixels_written + i]);
                    }
                    pixels_written += extent_pixels;
                } else {
                    return None;
                }
            }
        }

        // 6. Update and write back Inode
        inode.size = (data.len() * 4) as u64;
        inode.write(store, inode_index);

        Some(())
    }

    /// Implementation of the read_file circuit using extents.
    pub fn read_file(&self, store: &mut TileStore, inode_index: u64) -> Option<Vec<u32>> {
        let inode = VastInode::read(store, inode_index)?;
        let num_pixels = (inode.size / 4) as usize;
        let mut data = Vec::with_capacity(num_pixels);

        let mut pixels_read = 0;
        for extent in &inode.extents {
            let extent_pixels =
                (extent.count as usize * BLOCK_PIXELS).min(num_pixels - pixels_read);
            for i in 0..extent_pixels {
                data.push(store.get_pixel_at_index(extent.start + i as u64));
            }
            pixels_read += extent_pixels;
        }

        Some(data)
    }

    /// Implementation of the delete_file circuit.
    pub fn delete_file(&mut self, store: &mut TileStore, inode_index: u64) -> Option<()> {
        let inode = VastInode::read(store, inode_index)?;
        for extent in &inode.extents {
            self.allocator.free(extent.start, extent.count as u64 * 256);
        }

        // Clear the Inode
        for i in 0..256 {
            store.set_pixel_at_index(inode_index + i as u64, 0);
        }

        if self.allocator.needs_compaction() {
            self.allocator.compact();
        }

        Some(())
    }

    pub fn stats(&self) -> FilesystemStats {
        let allocator_stats = self.allocator.stats();
        FilesystemStats {
            total_free_space: allocator_stats.total_free_space,
            num_free_ranges: allocator_stats.num_free_ranges,
            num_allocated_blocks: allocator_stats.num_allocated_blocks,
            fragmentation_ratio: allocator_stats.fragmentation_ratio,
            cursor_position: allocator_stats.cursor_position,
        }
    }
}

/// Statistics about the filesystem state.
#[derive(Debug, Clone)]
pub struct FilesystemStats {
    pub total_free_space: u64,
    pub num_free_ranges: usize,
    pub num_allocated_blocks: usize,
    pub fragmentation_ratio: f32,
    pub cursor_position: u64,
}
