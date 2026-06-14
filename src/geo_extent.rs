//! geo_extent.rs -- Extent-based block allocator for GeoFS
//!
//! Replaces the fixed spatial grid with a dynamic allocator:
//! - Files are linked lists of 64x64 pixel blocks (extents)
//! - Directories are hash tables stored in blocks
//! - A superblock at the root tracks allocation state
//!
//! Block layout (64x64 pixels each):
//!   Row 0 = header (magic, next_block, byte_count, etc.)
//!   Row 1 = name / continuation
//!   Rows 2-63 = data (62 rows × 64 cols = 3968 pixels = 15872 bytes)
//!
//! Coordinate space: TileStore uses i32 world coordinates.
//! Blocks are 64x64, so block coords = world coords / 64.

use crate::pixel::BootMode;
use crate::tile_store::TileStore;

// ── Constants ──────────────────────────────────────────────────────────

/// Block size matches chunk size for natural TileStore alignment.
pub const BLOCK_SIZE: i32 = 64;

/// Rows reserved for block header (magic + next pointer + metadata).
pub const HEADER_ROWS: i32 = 2;

/// Data rows per block.
pub const DATA_ROWS: i32 = BLOCK_SIZE - HEADER_ROWS; // 62

/// Usable data pixels per block (each pixel = 4 bytes via RGBA).
pub const DATA_PIXELS: usize = (DATA_ROWS as usize) * (BLOCK_SIZE as usize); // 3968

/// Usable data bytes per block.
pub const DATA_BYTES: usize = DATA_PIXELS * 4; // 15872

/// Magic pixel for extent blocks (file data).
const MAGIC_EXTENT: u32 = 0xE000_0001;

/// Magic pixel for directory blocks (hash table).
const MAGIC_DIR: u32 = 0xE000_0002;

/// Magic pixel for the superblock.
const MAGIC_SUPER: u32 = 0xE000_0003;

/// Magic pixel for symlink blocks (target path stored as file data).
const MAGIC_SYMLINK: u32 = 0xE000_0004;

/// Maximum file name length (stored in row 1 of first block).
const MAX_NAME_LEN: usize = 64;

/// Hash table entries per directory block.
/// Each entry = 4 pixels (name_hash, child_x, child_y, child_type).
/// Rows 1-63 = 63 rows × 64 cols / 4 = 1008 entries per block.
const DIR_ENTRIES_PER_BLOCK: usize = (DATA_ROWS as usize) * (BLOCK_SIZE as usize) / 4;

/// Sentinel value for "no next block".
const NO_NEXT: (i32, i32) = (0, 0);

// ── Types ──────────────────────────────────────────────────────────────

/// Block type discriminator.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum BlockKind {
    File,
    Directory,
    Symlink,
}

/// A pointer to a block in world coordinates.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Default)]
pub struct BlockAddr {
    pub x: i32,
    pub y: i32,
}

impl BlockAddr {
    pub fn new(x: i32, y: i32) -> Self {
        Self { x, y }
    }

    pub fn is_null(&self) -> bool {
        self.x == 0 && self.y == 0
    }

    pub fn none() -> Self {
        Self { x: 0, y: 0 }
    }
}

/// Header of a data block (stored in row 0).
#[derive(Clone, Debug)]
pub struct BlockHeader {
    pub magic: u32,
    pub next: BlockAddr,
    pub byte_count: u32,
}

impl BlockHeader {
    /// Read block header from TileStore.
    pub fn read(store: &mut TileStore, addr: BlockAddr) -> Option<Self> {
        let magic = store.get_pixel(addr.x, addr.y);
        if magic != MAGIC_EXTENT
            && magic != MAGIC_DIR
            && magic != MAGIC_SUPER
            && magic != MAGIC_SYMLINK
        {
            return None;
        }
        let next_x = store.get_pixel(addr.x + 1, addr.y) as i32;
        let next_y = store.get_pixel(addr.x + 2, addr.y) as i32;
        let byte_count = store.get_pixel(addr.x + 3, addr.y);
        Some(Self {
            magic,
            next: BlockAddr::new(next_x, next_y),
            byte_count,
        })
    }

    /// Write block header to TileStore.
    pub fn write(&self, store: &mut TileStore, addr: BlockAddr) {
        store.set_pixel(addr.x, addr.y, self.magic);
        store.set_pixel(addr.x + 1, addr.y, self.next.x as u32);
        store.set_pixel(addr.x + 2, addr.y, self.next.y as u32);
        store.set_pixel(addr.x + 3, addr.y, self.byte_count);
    }

    pub fn kind(&self) -> Option<BlockKind> {
        match self.magic {
            MAGIC_EXTENT => Some(BlockKind::File),
            MAGIC_DIR => Some(BlockKind::Directory),
            MAGIC_SYMLINK => Some(BlockKind::Symlink),
            _ => None,
        }
    }
}

/// Superblock -- allocation state stored at the filesystem root.
#[derive(Clone, Debug)]
pub struct Superblock {
    /// Origin of the filesystem (where the superblock lives).
    pub origin: BlockAddr,
    /// Next block to allocate (monotonic cursor).
    pub next_alloc: BlockAddr,
    /// Total blocks allocated.
    pub total_blocks: u64,
    /// Total bytes stored.
    pub total_bytes: u64,
    /// Root directory block address.
    pub root_dir: BlockAddr,
    /// Head of the free block list (0,0 = empty).
    pub free_list_head: BlockAddr,
}

impl Superblock {
    /// Initialize a new superblock at the given origin.
    pub fn format(store: &mut TileStore, origin: BlockAddr) -> Self {
        // Write superblock header (row 0)
        store.set_pixel(origin.x, origin.y, MAGIC_SUPER);
        store.set_pixel(origin.x + 1, origin.y, 0); // reserved
        store.set_pixel(origin.x + 2, origin.y, 0); // reserved
        store.set_pixel(origin.x + 3, origin.y, 0); // total_blocks (low)
        store.set_pixel(origin.x + 4, origin.y, 0); // total_blocks (high)
        store.set_pixel(origin.x + 5, origin.y, 0); // total_bytes (low)
        store.set_pixel(origin.x + 6, origin.y, 0); // total_bytes (high)

        // First alloc starts at the block AFTER the superblock.
        let first_alloc = BlockAddr::new(origin.x + BLOCK_SIZE, origin.y);

        // Store state on row 1 of superblock for persistence
        store.set_pixel(origin.x, origin.y + 1, first_alloc.x as u32);
        store.set_pixel(origin.x + 1, origin.y + 1, first_alloc.y as u32);
        store.set_pixel(origin.x + 2, origin.y + 1, 0); // free_list_head_x
        store.set_pixel(origin.x + 3, origin.y + 1, 0); // free_list_head_y
        store.set_pixel(origin.x + 4, origin.y + 1, 0); // root_dir_x
        store.set_pixel(origin.x + 5, origin.y + 1, 0); // root_dir_y

        Self {
            origin,
            next_alloc: first_alloc,
            total_blocks: 0,
            total_bytes: 0,
            root_dir: BlockAddr::none(),
            free_list_head: BlockAddr::none(),
        }
    }

    /// Read superblock from TileStore.
    pub fn read(store: &mut TileStore, origin: BlockAddr) -> Option<Self> {
        let magic = store.get_pixel(origin.x, origin.y);
        if magic != MAGIC_SUPER {
            return None;
        }
        let next_x = store.get_pixel(origin.x, origin.y + 1) as i32;
        let next_y = store.get_pixel(origin.x + 1, origin.y + 1) as i32;
        let free_x = store.get_pixel(origin.x + 2, origin.y + 1) as i32;
        let free_y = store.get_pixel(origin.x + 3, origin.y + 1) as i32;
        let root_x = store.get_pixel(origin.x + 4, origin.y + 1) as i32;
        let root_y = store.get_pixel(origin.x + 5, origin.y + 1) as i32;

        let total_blocks = store.get_pixel(origin.x + 3, origin.y) as u64
            | ((store.get_pixel(origin.x + 4, origin.y) as u64) << 32);
        let total_bytes = store.get_pixel(origin.x + 5, origin.y) as u64
            | ((store.get_pixel(origin.x + 6, origin.y) as u64) << 32);

        Some(Self {
            origin,
            next_alloc: BlockAddr::new(next_x, next_y),
            total_blocks,
            total_bytes,
            root_dir: BlockAddr::new(root_x, root_y),
            free_list_head: BlockAddr::new(free_x, free_y),
        })
    }

    /// Persist superblock state back to TileStore.
    pub fn flush(&self, store: &mut TileStore) {
        store.set_pixel(self.origin.x, self.origin.y + 1, self.next_alloc.x as u32);
        store.set_pixel(
            self.origin.x + 1,
            self.origin.y + 1,
            self.next_alloc.y as u32,
        );
        store.set_pixel(
            self.origin.x + 2,
            self.origin.y + 1,
            self.free_list_head.x as u32,
        );
        store.set_pixel(
            self.origin.x + 3,
            self.origin.y + 1,
            self.free_list_head.y as u32,
        );
        store.set_pixel(self.origin.x + 4, self.origin.y + 1, self.root_dir.x as u32);
        store.set_pixel(self.origin.x + 5, self.origin.y + 1, self.root_dir.y as u32);

        store.set_pixel(
            self.origin.x + 3,
            self.origin.y,
            (self.total_blocks & 0xFFFFFFFF) as u32,
        );
        store.set_pixel(
            self.origin.x + 4,
            self.origin.y,
            (self.total_blocks >> 32) as u32,
        );
        store.set_pixel(
            self.origin.x + 5,
            self.origin.y,
            (self.total_bytes & 0xFFFFFFFF) as u32,
        );
        store.set_pixel(
            self.origin.x + 6,
            self.origin.y,
            (self.total_bytes >> 32) as u32,
        );
    }
}

// ── Extent Allocator ───────────────────────────────────────────────────

/// The extent-based filesystem allocator.
pub struct GeoExtent {
    pub sb: Superblock,
}

impl GeoExtent {
    /// Format a new filesystem at the given origin.
    pub fn format(store: &mut TileStore, origin: BlockAddr) -> Self {
        let sb = Superblock::format(store, origin);
        let mut geo = Self { sb };

        // Allocate and initialize root directory
        let root_dir = geo.alloc_block(store);
        let header = BlockHeader {
            magic: MAGIC_DIR,
            next: BlockAddr::none(),
            byte_count: 0,
        };
        header.write(store, root_dir);
        Self::write_name(store, root_dir, "/");
        // Zero hash table area
        for dy in HEADER_ROWS..BLOCK_SIZE {
            for dx in 0..BLOCK_SIZE {
                store.set_pixel(root_dir.x + dx, root_dir.y + dy, 0);
            }
        }
        geo.sb.root_dir = root_dir;
        geo.sb.flush(store);
        geo
    }

    /// Mount an existing filesystem.
    pub fn mount(store: &mut TileStore, origin: BlockAddr) -> Option<Self> {
        let sb = Superblock::read(store, origin)?;
        let mut geo = Self { sb };
        // Backwards compat: if root_dir not set, assume first block after superblock
        if geo.sb.root_dir.is_null() {
            geo.sb.root_dir = BlockAddr::new(origin.x + BLOCK_SIZE, origin.y);
        }
        Some(geo)
    }

    /// Push a block onto the free list.
    fn free_block(&mut self, store: &mut TileStore, addr: BlockAddr) {
        // Write current head into the block's first two pixels
        store.set_pixel(addr.x, addr.y, self.sb.free_list_head.x as u32);
        store.set_pixel(addr.x + 1, addr.y, self.sb.free_list_head.y as u32);
        self.sb.free_list_head = addr;
        self.sb.flush(store);
    }

    /// Allocate a block, preferring the free list over the monotonic cursor.
    fn alloc_block(&mut self, store: &mut TileStore) -> BlockAddr {
        if !self.sb.free_list_head.is_null() {
            let addr = self.sb.free_list_head;
            // Pop: read next pointer stored in first two pixels of this block
            let next_x = store.get_pixel(addr.x, addr.y) as i32;
            let next_y = store.get_pixel(addr.x + 1, addr.y) as i32;
            self.sb.free_list_head = BlockAddr::new(next_x, next_y);
            // Zero the entire block before reuse
            for dy in 0..BLOCK_SIZE {
                for dx in 0..BLOCK_SIZE {
                    store.set_pixel(addr.x + dx, addr.y + dy, 0);
                }
            }
            self.sb.flush(store);
            addr
        } else {
            let addr = self.sb.next_alloc;
            let nx = addr.x + BLOCK_SIZE;
            let ny = addr.y;
            self.sb.next_alloc = BlockAddr::new(nx, ny);
            self.sb.total_blocks += 1;
            self.sb.flush(store);
            addr
        }
    }

    // ── File Operations ────────────────────────────────────────────

    /// Create a new file. Returns the address of the first block.
    pub fn create_file(&mut self, store: &mut TileStore, name: &str) -> BlockAddr {
        let addr = self.alloc_block(store);

        // Write header
        let header = BlockHeader {
            magic: MAGIC_EXTENT,
            next: BlockAddr::none(),
            byte_count: 0,
        };
        header.write(store, addr);

        // Write name in row 1
        Self::write_name(store, addr, name);

        // Mark boot pixel at block origin for GeoFS compatibility
        // Use extent magic as boot pixel -- GeoFS.ls() will see it
        store.set_pixel(addr.x, addr.y, MAGIC_EXTENT);

        addr
    }

    /// Write data to a file, appending new blocks as needed.
    /// Returns total bytes written.
    pub fn write_file(
        &mut self,
        store: &mut TileStore,
        first_block: BlockAddr,
        data: &[u8],
    ) -> usize {
        let mut remaining = data;
        let mut current = first_block;
        let mut total_written = 0;

        loop {
            // Read current header
            let mut header =
                BlockHeader::read(store, current).expect("write_file: block header missing");

            // Calculate how much fits in this block's data area
            let offset = header.byte_count as usize;
            let available = DATA_BYTES.saturating_sub(offset);
            let chunk_len = remaining.len().min(available);

            if chunk_len > 0 {
                // Write data pixels (row by row, starting at data offset)
                Self::write_data_at(store, current, offset, &remaining[..chunk_len]);
                total_written += chunk_len;
                remaining = &remaining[chunk_len..];
                header.byte_count = (offset + chunk_len) as u32;
            }

            if remaining.is_empty() {
                // All data written, update header
                header.write(store, current);
                break;
            }

            // Need another block
            if header.next.is_null() {
                let next = self.alloc_block(store);
                let next_header = BlockHeader {
                    magic: MAGIC_EXTENT,
                    next: BlockAddr::none(),
                    byte_count: 0,
                };
                next_header.write(store, next);
                header.next = next;
            }

            header.write(store, current);
            current = header.next;
        }

        self.sb.total_bytes += total_written as u64;
        self.sb.flush(store);
        total_written
    }

    /// Read all data from a file (follows extent chain).
    pub fn read_file(&self, store: &mut TileStore, first_block: BlockAddr) -> Vec<u8> {
        let mut result = Vec::new();
        let mut current = first_block;

        while !current.is_null() {
            let header = match BlockHeader::read(store, current) {
                Some(h) => h,
                None => break,
            };

            let data = Self::read_data(store, current, header.byte_count as usize);
            result.extend_from_slice(&data);

            current = header.next;
        }

        result
    }

    /// Get the name of a file (stored in row 1 of first block).
    pub fn read_name(store: &mut TileStore, addr: BlockAddr) -> String {
        let mut name = String::new();
        for i in 0..MAX_NAME_LEN {
            let p = store.get_pixel(addr.x + i as i32, addr.y + 1);
            let c = (p & 0xFF) as u8;
            if c == 0 {
                break;
            }
            name.push(c as char);
        }
        name
    }

    /// Get the file size by walking the extent chain.
    pub fn file_size(&self, store: &mut TileStore, first_block: BlockAddr) -> u64 {
        let mut total: u64 = 0;
        let mut current = first_block;

        while !current.is_null() {
            let header = match BlockHeader::read(store, current) {
                Some(h) => h,
                None => break,
            };
            total += header.byte_count as u64;
            current = header.next;
        }

        total
    }

    /// Truncate a file to zero bytes, freeing all chained blocks except the first.
    pub fn truncate_file(&mut self, store: &mut TileStore, first_block: BlockAddr) {
        let old_size = self.file_size(store, first_block);
        let header = match BlockHeader::read(store, first_block) {
            Some(h) => h,
            None => return,
        };
        let mut current = header.next;

        // Free all blocks after the first
        while !current.is_null() {
            let h = match BlockHeader::read(store, current) {
                Some(hh) => hh,
                None => break,
            };
            let next = h.next;
            self.free_block(store, current);
            current = next;
        }

        // Reset first block header
        let new_header = BlockHeader {
            magic: MAGIC_EXTENT,
            next: BlockAddr::none(),
            byte_count: 0,
        };
        new_header.write(store, first_block);

        self.sb.total_bytes = self.sb.total_bytes.saturating_sub(old_size);
        self.sb.flush(store);
    }

    /// Overwrite a file with new data (truncate then write).
    pub fn overwrite_file(
        &mut self,
        store: &mut TileStore,
        first_block: BlockAddr,
        data: &[u8],
    ) -> usize {
        self.truncate_file(store, first_block);
        self.write_file(store, first_block, data)
    }

    /// Delete a file by freeing all blocks in the chain.
    pub fn delete_file(&mut self, store: &mut TileStore, first_block: BlockAddr) {
        let mut current = first_block;

        while !current.is_null() {
            let header = match BlockHeader::read(store, current) {
                Some(h) => h,
                None => break,
            };
            let next = header.next;
            self.free_block(store, current);
            current = next;
        }

        self.sb.total_bytes = self
            .sb
            .total_bytes
            .saturating_sub(self.file_size(store, first_block));
        self.sb.flush(store);
    }

    /// Delete a directory by freeing all blocks in its chain.
    pub fn delete_dir(&mut self, store: &mut TileStore, first_block: BlockAddr) {
        self.delete_file(store, first_block);
    }

    // ── Directory Operations ───────────────────────────────────────

    /// Create a new directory. Returns the address of the dir block.
    pub fn create_dir(&mut self, store: &mut TileStore, name: &str) -> BlockAddr {
        let addr = self.alloc_block(store);

        let header = BlockHeader {
            magic: MAGIC_DIR,
            next: BlockAddr::none(),
            byte_count: 0, // entry_count
        };
        header.write(store, addr);

        Self::write_name(store, addr, name);

        // Zero out hash table area
        for dy in HEADER_ROWS..BLOCK_SIZE {
            for dx in 0..BLOCK_SIZE {
                store.set_pixel(addr.x + dx, addr.y + dy, 0);
            }
        }

        addr
    }

    /// Insert an entry into a directory.
    pub fn dir_insert(
        &mut self,
        store: &mut TileStore,
        dir_addr: BlockAddr,
        name: &str,
        child: BlockAddr,
        kind: BlockKind,
    ) -> Result<(), String> {
        let hash = Self::hash_name(name);
        let mut current = dir_addr;

        // Walk overflow chain
        loop {
            let header =
                BlockHeader::read(store, current).ok_or("dir_insert: invalid dir block")?;

            if header.magic != MAGIC_DIR {
                return Err("dir_insert: not a directory block".into());
            }

            // Try to find an empty slot in this block's hash table
            let start_idx = (hash as usize) % DIR_ENTRIES_PER_BLOCK;
            for i in 0..DIR_ENTRIES_PER_BLOCK {
                let idx = (start_idx + i) % DIR_ENTRIES_PER_BLOCK;
                let (px, py) = Self::dir_entry_pixel(current, idx);

                let existing_hash = store.get_pixel(px, py);
                if existing_hash == 0 {
                    // Empty slot -- insert here
                    let type_flag = match kind {
                        BlockKind::File => 1u32,
                        BlockKind::Directory => 2u32,
                        BlockKind::Symlink => 3u32,
                    };
                    store.set_pixel(px, py, hash);
                    store.set_pixel(px + 1, py, child.x as u32);
                    store.set_pixel(px + 2, py, child.y as u32);
                    store.set_pixel(px + 3, py, type_flag);

                    // Update entry count
                    let mut hdr = BlockHeader::read(store, current).unwrap();
                    hdr.byte_count += 1;
                    hdr.write(store, current);

                    return Ok(());
                }
            }

            // This block is full -- follow overflow chain
            if header.next.is_null() {
                // Allocate overflow block
                let overflow = self.alloc_block(store);
                let overflow_header = BlockHeader {
                    magic: MAGIC_DIR,
                    next: BlockAddr::none(),
                    byte_count: 0,
                };
                overflow_header.write(store, overflow);

                // Zero hash table area
                for dy in HEADER_ROWS..BLOCK_SIZE {
                    for dx in 0..BLOCK_SIZE {
                        store.set_pixel(overflow.x + dx, overflow.y + dy, 0);
                    }
                }

                // Link from current
                let mut hdr = BlockHeader::read(store, current).unwrap();
                hdr.next = overflow;
                hdr.write(store, current);
                current = overflow;
            } else {
                current = header.next;
            }
        }
    }

    /// Look up an entry in a directory by name.
    pub fn dir_lookup(
        &self,
        store: &mut TileStore,
        dir_addr: BlockAddr,
        name: &str,
    ) -> Option<(BlockAddr, BlockKind)> {
        let hash = Self::hash_name(name);
        let mut current = dir_addr;

        while !current.is_null() {
            let header = BlockHeader::read(store, current)?;

            let start_idx = (hash as usize) % DIR_ENTRIES_PER_BLOCK;
            for i in 0..DIR_ENTRIES_PER_BLOCK {
                let idx = (start_idx + i) % DIR_ENTRIES_PER_BLOCK;
                let (px, py) = Self::dir_entry_pixel(current, idx);

                let existing_hash = store.get_pixel(px, py);
                if existing_hash == 0 {
                    // Empty slot = end of probe sequence
                    return None;
                }
                if existing_hash == hash {
                    // Potential match -- verify name
                    let child_x = store.get_pixel(px + 1, py) as i32;
                    let child_y = store.get_pixel(px + 2, py) as i32;
                    let type_flag = store.get_pixel(px + 3, py);

                    let child_addr = BlockAddr::new(child_x, child_y);
                    let child_name = Self::read_name(store, child_addr);
                    if child_name == name {
                        let kind = match type_flag {
                            1 => BlockKind::File,
                            2 => BlockKind::Directory,
                            3 => BlockKind::Symlink,
                            _ => BlockKind::File,
                        };
                        return Some((child_addr, kind));
                    }
                }
            }

            current = header.next;
        }

        None
    }

    /// Remove an entry from a directory by name.
    pub fn dir_remove(
        &mut self,
        store: &mut TileStore,
        dir_addr: BlockAddr,
        name: &str,
    ) -> Result<(), String> {
        let hash = Self::hash_name(name);
        let mut current = dir_addr;

        while !current.is_null() {
            let header =
                BlockHeader::read(store, current).ok_or("dir_remove: invalid dir block")?;

            if header.magic != MAGIC_DIR {
                return Err("dir_remove: not a directory block".into());
            }

            let start_idx = (hash as usize) % DIR_ENTRIES_PER_BLOCK;
            for i in 0..DIR_ENTRIES_PER_BLOCK {
                let idx = (start_idx + i) % DIR_ENTRIES_PER_BLOCK;
                let (px, py) = Self::dir_entry_pixel(current, idx);

                let existing_hash = store.get_pixel(px, py);
                if existing_hash == 0 {
                    continue; // empty slot, keep probing
                }
                if existing_hash == hash {
                    let child_x = store.get_pixel(px + 1, py) as i32;
                    let child_y = store.get_pixel(px + 2, py) as i32;
                    let child_addr = BlockAddr::new(child_x, child_y);
                    let child_name = Self::read_name(store, child_addr);

                    if child_name == name {
                        // Found it — zero the entry
                        store.set_pixel(px, py, 0);
                        store.set_pixel(px + 1, py, 0);
                        store.set_pixel(px + 2, py, 0);
                        store.set_pixel(px + 3, py, 0);

                        // Decrement entry count
                        let mut hdr = BlockHeader::read(store, current).unwrap();
                        hdr.byte_count = hdr.byte_count.saturating_sub(1);
                        hdr.write(store, current);

                        return Ok(());
                    }
                }
            }

            current = header.next;
        }

        Err("dir_remove: entry not found".into())
    }

    /// List all entries in a directory.
    pub fn dir_list(
        &self,
        store: &mut TileStore,
        dir_addr: BlockAddr,
    ) -> Vec<(String, BlockAddr, BlockKind)> {
        let mut entries = Vec::new();
        let mut current = dir_addr;

        while !current.is_null() {
            let header = match BlockHeader::read(store, current) {
                Some(h) => h,
                None => break,
            };

            for idx in 0..DIR_ENTRIES_PER_BLOCK {
                let (px, py) = Self::dir_entry_pixel(current, idx);
                let existing_hash = store.get_pixel(px, py);
                if existing_hash == 0 {
                    continue;
                }

                let child_x = store.get_pixel(px + 1, py) as i32;
                let child_y = store.get_pixel(px + 2, py) as i32;
                let type_flag = store.get_pixel(px + 3, py);

                let child_addr = BlockAddr::new(child_x, child_y);
                let child_name = Self::read_name(store, child_addr);
                let kind = match type_flag {
                    1 => BlockKind::File,
                    2 => BlockKind::Directory,
                    _ => BlockKind::File,
                };

                entries.push((child_name, child_addr, kind));
            }

            current = header.next;
        }

        entries
    }

    // ── Internal Helpers ───────────────────────────────────────────

    /// Write a file name into row 1 of a block.
    pub fn write_name(store: &mut TileStore, addr: BlockAddr, name: &str) {
        let bytes = name.as_bytes();
        let len = bytes.len().min(MAX_NAME_LEN);
        for i in 0..len {
            store.set_pixel(addr.x + i as i32, addr.y + 1, 0xA000_0000 | bytes[i] as u32);
        }
        // Null terminator
        if len < MAX_NAME_LEN {
            store.set_pixel(addr.x + len as i32, addr.y + 1, 0);
        }
    }

    /// Write data bytes into a block starting at the given byte offset.
    fn write_data_at(store: &mut TileStore, addr: BlockAddr, offset: usize, data: &[u8]) {
        let mut byte_idx = 0;
        let start_pixel = offset / 4;
        let start_byte_in_pixel = offset % 4;

        // Handle partial first pixel
        if start_byte_in_pixel > 0 && byte_idx < data.len() {
            let pixel_idx = start_pixel;
            let row = HEADER_ROWS + (pixel_idx as i32 / BLOCK_SIZE);
            let col = pixel_idx as i32 % BLOCK_SIZE;
            let mut existing = store.get_pixel(addr.x + col, addr.y + row);

            for bi in start_byte_in_pixel..4 {
                if byte_idx >= data.len() {
                    break;
                }
                let shift = bi * 8;
                existing = (existing & !(0xFFu32 << shift)) | ((data[byte_idx] as u32) << shift);
                byte_idx += 1;
            }
            store.set_pixel(addr.x + col, addr.y + row, existing);
        }

        // Write full pixels
        while byte_idx + 4 <= data.len() {
            let pixel_idx = start_pixel + (byte_idx - start_byte_in_pixel) / 4;
            let row = HEADER_ROWS + (pixel_idx as i32 / BLOCK_SIZE);
            let col = pixel_idx as i32 % BLOCK_SIZE;

            if row >= BLOCK_SIZE {
                break; // Block full
            }

            let val = u32::from_le_bytes([
                data[byte_idx],
                data[byte_idx + 1],
                data[byte_idx + 2],
                data[byte_idx + 3],
            ]);
            store.set_pixel(addr.x + col, addr.y + row, val);
            byte_idx += 4;
        }

        // Handle remaining bytes (partial last pixel)
        if byte_idx < data.len() {
            let pixel_idx = start_pixel + (byte_idx - start_byte_in_pixel) / 4;
            let row = HEADER_ROWS + (pixel_idx as i32 / BLOCK_SIZE);
            let col = pixel_idx as i32 % BLOCK_SIZE;

            if row < BLOCK_SIZE {
                let mut val = 0u32;
                for bi in 0..4 {
                    if byte_idx + bi < data.len() {
                        val |= (data[byte_idx + bi] as u32) << (bi * 8);
                    }
                }
                store.set_pixel(addr.x + col, addr.y + row, val);
            }
        }
    }

    /// Read data bytes from a block.
    fn read_data(store: &mut TileStore, addr: BlockAddr, byte_count: usize) -> Vec<u8> {
        let mut result = Vec::with_capacity(byte_count);

        for pixel_idx in 0..DATA_PIXELS {
            let row = HEADER_ROWS + (pixel_idx as i32 / BLOCK_SIZE);
            let col = pixel_idx as i32 % BLOCK_SIZE;

            if row >= BLOCK_SIZE {
                break;
            }

            let val = store.get_pixel(addr.x + col, addr.y + row);
            let bytes = val.to_le_bytes();

            for &b in &bytes {
                if result.len() >= byte_count {
                    return result;
                }
                result.push(b);
            }
        }

        result
    }

    /// Get the (x, y) pixel coordinate of the Nth hash entry in a dir block.
    /// Each entry is 4 pixels: [hash, child_x, child_y, child_type].
    fn dir_entry_pixel(block: BlockAddr, idx: usize) -> (i32, i32) {
        let pixel_offset = idx * 4;
        // Data area starts at row HEADER_ROWS
        let row = HEADER_ROWS + (pixel_offset as i32 / BLOCK_SIZE);
        let col = (pixel_offset as i32) % BLOCK_SIZE;
        (block.x + col, block.y + row)
    }

    /// FNV-1a hash of a name for directory lookup.
    fn hash_name(name: &str) -> u32 {
        let mut hash: u32 = 2166136261;
        for &b in name.as_bytes() {
            hash ^= b as u32;
            hash = hash.wrapping_mul(16777619);
        }
        hash
    }

    /// Create a symlink block. Target path is stored as file data.
    /// Uses MAGIC_SYMLINK so it can be distinguished from regular files.
    pub fn create_symlink(&mut self, store: &mut TileStore, name: &str) -> BlockAddr {
        let addr = self.alloc_block(store);

        let header = BlockHeader {
            magic: MAGIC_SYMLINK,
            next: BlockAddr::none(),
            byte_count: 0,
        };
        header.write(store, addr);
        Self::write_name(store, addr, name);
        store.set_pixel(addr.x, addr.y, MAGIC_SYMLINK);

        addr
    }

    /// Write target path into a symlink block (uses same data layout as files).
    pub fn write_symlink_target(
        &mut self,
        store: &mut TileStore,
        block: BlockAddr,
        target: &str,
    ) -> usize {
        // Symlink targets are small — truncate + write like overwrite_file.
        self.truncate_file(store, block);
        // Re-write symlink magic since truncate resets it to MAGIC_EXTENT.
        let mut header = BlockHeader::read(store, block).expect("symlink block missing");
        header.magic = MAGIC_SYMLINK;
        header.write(store, block);
        store.set_pixel(block.x, block.y, MAGIC_SYMLINK);

        self.write_file(store, block, target.as_bytes())
    }

    /// Read symlink target from block data.
    pub fn read_symlink_target(&self, store: &mut TileStore, block: BlockAddr) -> String {
        let data = self.read_file(store, block);
        String::from_utf8_lossy(&data).to_string()
    }

    /// In-place write at an arbitrary offset within an existing file.
    /// Only valid when offset + data.len() <= current file_size.
    /// Returns the number of bytes written, or 0 if the write would extend
    /// beyond the current file (caller should fall back to read-modify-write).
    pub fn write_file_at(
        &mut self,
        store: &mut TileStore,
        first_block: BlockAddr,
        offset: usize,
        data: &[u8],
    ) -> usize {
        let file_size = self.file_size(store, first_block) as usize;
        if offset + data.len() > file_size {
            return 0; // would extend — caller should use read-modify-write
        }
        if data.is_empty() {
            return 0;
        }

        // Walk the block chain to find the right block(s).
        let mut byte_offset = offset;
        let mut remaining = data;
        let mut current = first_block;

        while !current.is_null() && !remaining.is_empty() {
            let header = match BlockHeader::read(store, current) {
                Some(h) => h,
                None => break,
            };
            let block_data_len = header.byte_count as usize;

            if byte_offset >= block_data_len {
                // Skip this block entirely.
                byte_offset -= block_data_len;
                current = header.next;
                continue;
            }

            // Write starts in this block.
            let write_start = byte_offset;
            let available = block_data_len - write_start;
            let chunk_len = remaining.len().min(available);

            Self::write_data_at(store, current, write_start, &remaining[..chunk_len]);
            remaining = &remaining[chunk_len..];
            byte_offset = 0; // subsequent blocks write from offset 0

            current = header.next;
        }

        data.len() - remaining.len()
    }
}

// ── Tests ──────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    fn fresh_store() -> TileStore {
        TileStore::new()
    }

    #[test]
    fn test_format_and_mount() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(4096, 4096);

        let fs = GeoExtent::format(&mut store, origin);
        assert_eq!(fs.sb.origin, origin);
        // next_alloc advanced past the root directory block
        assert_eq!(fs.sb.next_alloc.x, origin.x + BLOCK_SIZE * 2);
        assert!(!fs.sb.root_dir.is_null());

        // Mount should succeed
        let mounted = GeoExtent::mount(&mut store, origin).expect("mount");
        assert_eq!(mounted.sb.origin, origin);
        assert_eq!(mounted.sb.next_alloc.x, origin.x + BLOCK_SIZE * 2);
        assert!(!mounted.sb.root_dir.is_null());
    }

    #[test]
    fn test_create_file_and_read_name() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(8192, 8192);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "hello.txt");
        let name = GeoExtent::read_name(&mut store, addr);
        assert_eq!(name, "hello.txt");

        // Verify header
        let header = BlockHeader::read(&mut store, addr).expect("header");
        assert_eq!(header.magic, MAGIC_EXTENT);
        assert!(header.next.is_null());
        assert_eq!(header.byte_count, 0);
    }

    #[test]
    fn test_write_and_read_file() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(12288, 12288);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "data.bin");

        // Write data that fits in one block
        let data: Vec<u8> = (0..100).collect();
        let written = fs.write_file(&mut store, addr, &data);
        assert_eq!(written, 100);

        let read_back = fs.read_file(&mut store, addr);
        assert_eq!(read_back, data);
    }

    #[test]
    fn test_write_multiblock_file() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(16384, 16384);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "big.dat");

        // Write data spanning multiple blocks
        let data: Vec<u8> = (0..(DATA_BYTES * 2 + 500) as u8).collect();
        let written = fs.write_file(&mut store, addr, &data);
        assert_eq!(written, data.len());

        let read_back = fs.read_file(&mut store, addr);
        assert_eq!(read_back.len(), data.len());
        assert_eq!(read_back, data);

        // Verify it used multiple blocks
        let size = fs.file_size(&mut store, addr);
        assert_eq!(size, data.len() as u64);
    }

    #[test]
    fn test_file_size() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(20480, 20480);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "sized.bin");
        assert_eq!(fs.file_size(&mut store, addr), 0);

        let data = vec![0xABu8; 500];
        fs.write_file(&mut store, addr, &data);
        assert_eq!(fs.file_size(&mut store, addr), 500);
    }

    #[test]
    fn test_delete_file() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(24576, 24576);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "deleteme.txt");
        let data = vec![1, 2, 3, 4, 5];
        fs.write_file(&mut store, addr, &data);

        fs.delete_file(&mut store, addr);

        // Header should be gone
        assert!(BlockHeader::read(&mut store, addr).is_none());
    }

    #[test]
    fn test_directory_create_and_insert() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(28672, 28672);
        let mut fs = GeoExtent::format(&mut store, origin);

        let dir = fs.create_dir(&mut store, "mydir");
        let file = fs.create_file(&mut store, "inner.txt");

        fs.dir_insert(&mut store, dir, "inner.txt", file, BlockKind::File)
            .expect("insert");

        // Lookup should find it
        let (found_addr, found_kind) = fs.dir_lookup(&mut store, dir, "inner.txt").expect("lookup");
        assert_eq!(found_addr, file);
        assert_eq!(found_kind, BlockKind::File);
    }

    #[test]
    fn test_directory_list() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(32768, 32768);
        let mut fs = GeoExtent::format(&mut store, origin);

        let dir = fs.create_dir(&mut store, "listdir");

        // Insert 3 files
        let f1 = fs.create_file(&mut store, "a.txt");
        let f2 = fs.create_file(&mut store, "b.txt");
        let f3 = fs.create_file(&mut store, "c.txt");

        fs.dir_insert(&mut store, dir, "a.txt", f1, BlockKind::File)
            .unwrap();
        fs.dir_insert(&mut store, dir, "b.txt", f2, BlockKind::File)
            .unwrap();
        fs.dir_insert(&mut store, dir, "c.txt", f3, BlockKind::File)
            .unwrap();

        let entries = fs.dir_list(&mut store, dir);
        assert_eq!(entries.len(), 3);

        let names: Vec<&str> = entries.iter().map(|(n, _, _)| n.as_str()).collect();
        assert!(names.contains(&"a.txt"));
        assert!(names.contains(&"b.txt"));
        assert!(names.contains(&"c.txt"));
    }

    #[test]
    fn test_directory_nested() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(36864, 36864);
        let mut fs = GeoExtent::format(&mut store, origin);

        let root = fs.create_dir(&mut store, "root");
        let subdir = fs.create_dir(&mut store, "subdir");

        fs.dir_insert(&mut store, root, "subdir", subdir, BlockKind::Directory)
            .unwrap();

        let (found, kind) = fs.dir_lookup(&mut store, root, "subdir").unwrap();
        assert_eq!(found, subdir);
        assert_eq!(kind, BlockKind::Directory);
    }

    #[test]
    fn test_hash_name_deterministic() {
        let h1 = GeoExtent::hash_name("hello.txt");
        let h2 = GeoExtent::hash_name("hello.txt");
        let h3 = GeoExtent::hash_name("other.txt");
        assert_eq!(h1, h2);
        assert_ne!(h1, h3);
    }

    #[test]
    fn test_dir_lookup_missing() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(40960, 40960);
        let mut fs = GeoExtent::format(&mut store, origin);

        let dir = fs.create_dir(&mut store, "emptydir");
        assert!(fs.dir_lookup(&mut store, dir, "nonexistent").is_none());
    }

    #[test]
    fn test_free_list_reuse() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(45056, 45056);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "temp.txt");
        fs.write_file(&mut store, addr, b"some data");
        let alloc_before = fs.sb.next_alloc.x;

        fs.delete_file(&mut store, addr);
        assert!(
            !fs.sb.free_list_head.is_null(),
            "free list should have entry"
        );

        let addr2 = fs.create_file(&mut store, "reuse.txt");
        assert_eq!(addr2, addr, "should reuse freed block");
        assert_eq!(
            fs.sb.next_alloc.x, alloc_before,
            "cursor should not advance"
        );
    }

    #[test]
    fn test_dir_remove() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(49152, 49152);
        let mut fs = GeoExtent::format(&mut store, origin);

        let dir = fs.create_dir(&mut store, "mydir");
        let file = fs.create_file(&mut store, "inner.txt");
        fs.dir_insert(&mut store, dir, "inner.txt", file, BlockKind::File)
            .unwrap();

        // Verify it's there
        assert!(fs.dir_lookup(&mut store, dir, "inner.txt").is_some());

        // Remove it
        fs.dir_remove(&mut store, dir, "inner.txt").unwrap();
        assert!(fs.dir_lookup(&mut store, dir, "inner.txt").is_none());

        // List should be empty
        let entries = fs.dir_list(&mut store, dir);
        assert!(entries.is_empty());
    }

    #[test]
    fn test_truncate_and_overwrite() {
        let mut store = fresh_store();
        let origin = BlockAddr::new(53248, 53248);
        let mut fs = GeoExtent::format(&mut store, origin);

        let addr = fs.create_file(&mut store, "mut.txt");
        fs.write_file(&mut store, addr, b"original content that is long enough");
        assert_eq!(fs.file_size(&mut store, addr), 36);

        // Overwrite with shorter data
        fs.overwrite_file(&mut store, addr, b"short");
        assert_eq!(fs.file_size(&mut store, addr), 5);
        let read_back = fs.read_file(&mut store, addr);
        assert_eq!(&read_back, b"short");
    }
}
