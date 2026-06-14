//! vast_directory.rs -- Hierarchical directory support for Vast Tiled PixelFS
//!
//! Implements directory management using the Vast Substrate:
//! - Directories are Inodes with mode flag S_IFDIR
//! - Directory entries stored as extents packed into 256-pixel blocks
//! - Each entry: name_hash (u32) | inode_addr_low (u32) | inode_addr_high (u32) | flags (u32)
//! - Inode index stored as u64 Hilbert index (split into two u32 pixels)
//! - Path parsing with / and .. support
//! - readdir for listing directory entries

use crate::tile_store::TileStore;
use crate::vm::vast_geometry::*;
use crate::vm::vast_pixelfs::*;

/// Directory mode flag
pub const S_IFDIR: u32 = 0o040000;

/// Maximum directory entries per 256-pixel block
/// Each entry = 4 u32 pixels. 256 pixels = 64 entries per block.
pub const DIR_ENTRIES_PER_BLOCK: usize = 64;

/// Directory entry structure (stored as 4 consecutive pixels in Hilbert curve)
#[derive(Clone, Copy, Debug)]
struct DirEntry {
    name_hash: u32,
    inode_index_low: u32,
    inode_index_high: u32,
    flags: u32,
}

/// Read a directory entry from a block at the given offset using Hilbert indices
fn read_dir_entry(store: &mut TileStore, block_start: u64, entry_idx: usize) -> Option<DirEntry> {
    let pixel_base = block_start + (entry_idx * 4) as u64;

    let p0 = store.get_pixel_at_index(pixel_base);
    let p1 = store.get_pixel_at_index(pixel_base + 1);
    let p2 = store.get_pixel_at_index(pixel_base + 2);
    let p3 = store.get_pixel_at_index(pixel_base + 3);

    if p0 == 0 && p1 == 0 && p2 == 0 && p3 == 0 {
        return None;
    }
    Some(DirEntry {
        name_hash: p0,
        inode_index_low: p1,
        inode_index_high: p2,
        flags: p3,
    })
}

/// Write a directory entry to a block at the given offset using Hilbert indices
fn write_dir_entry(store: &mut TileStore, block_start: u64, entry_idx: usize, entry: &DirEntry) {
    let pixel_base = block_start + (entry_idx * 4) as u64;

    store.set_pixel_at_index(pixel_base, entry.name_hash);
    store.set_pixel_at_index(pixel_base + 1, entry.inode_index_low);
    store.set_pixel_at_index(pixel_base + 2, entry.inode_index_high);
    store.set_pixel_at_index(pixel_base + 3, entry.flags);
}

/// Clear a directory entry (zero out) at the given offset
fn clear_dir_entry(store: &mut TileStore, block_start: u64, entry_idx: usize) {
    let pixel_base = block_start + (entry_idx * 4) as u64;
    for i in 0..4 {
        store.set_pixel_at_index(pixel_base + i, 0);
    }
}

/// Find a free slot in a directory's extent blocks
fn find_free_slot(store: &mut TileStore, inode: &VastInode) -> Option<(u64, usize)> {
    for extent in &inode.extents {
        for block_in_extent in 0..extent.count {
            let block_start = extent.start + (block_in_extent as u64 * 256);
            for entry_idx in 0..DIR_ENTRIES_PER_BLOCK {
                if read_dir_entry(store, block_start, entry_idx).is_none() {
                    return Some((block_start, entry_idx));
                }
            }
        }
    }
    None
}

/// Parse a path string into components, handling "/" and ".."
///
/// # Examples
///
/// ```
/// let components = parse_path("/home/user/file.txt");
/// assert_eq!(components, vec!["home", "user", "file.txt"]);
///
/// let components = parse_path("/home/user/..");
/// assert_eq!(components, vec!["home"]);
///
/// let components = parse_path("../relative/path");
/// assert_eq!(components, vec!["..", "relative", "path"]);
///
/// let components = parse_path("/home/user/./file.txt");
/// assert_eq!(components, vec!["home", "user", "file.txt"]);
/// ```
pub fn parse_path(path: &str) -> Vec<&str> {
    let mut components = Vec::new();

    // Handle empty path
    if path.is_empty() {
        return components;
    }

    // Check if path is absolute
    let is_absolute = path.starts_with('/');

    // Split by "/" and filter out empty components (from leading/trailing/multiple slashes)
    let parts: Vec<&str> = path.split('/').filter(|p| !p.is_empty()).collect();

    let mut first = true;
    for part in parts {
        if part == ".." {
            // Pop if possible (works for both absolute and relative paths)
            if !components.is_empty() {
                components.pop();
            }
            // For relative paths, if we can't pop, keep ".."
            else if !is_absolute {
                components.push(part);
            }
            // For absolute paths at root, ".." does nothing
        } else if part == "." {
            // Preserve "." if it's the first component of a relative path
            if first && !is_absolute {
                components.push(part);
            }
            // Otherwise, skip "."
        } else {
            components.push(part);
        }
        first = false;
    }

    components
}

/// Add directory management methods to VastPixelFS
impl VastPixelFS {
    /// Create a directory at the given path (as a string).
    /// Parent directory must exist. Returns Inode index on success, None on error.
    pub fn mkdir_str(&mut self, store: &mut TileStore, path: &str, mode: u32) -> Option<u64> {
        let components = parse_path(path);
        self.mkdir(store, &components, mode)
    }

    /// Remove a directory at the given path (as a string).
    /// Directory must be empty. Returns true on success.
    pub fn rmdir_str(&mut self, store: &mut TileStore, path: &str) -> Option<bool> {
        let components = parse_path(path);
        self.rmdir(store, &components)
    }

    /// Look up a path string and return the inode index.
    pub fn lookup_path_str(&self, store: &mut TileStore, path: &str) -> Option<u64> {
        let components = parse_path(path);
        self.lookup_path_index(store, &components)
    }

    /// Create a file at the given path (as a string).
    /// Parent directory must exist. Returns Inode index on success, None on error.
    pub fn create_file_str(&mut self, store: &mut TileStore, path: &str, mode: u32) -> Option<u64> {
        let components = parse_path(path);
        if components.is_empty() {
            return None;
        }

        let filename = *components.last()?;
        let file_hash = VastPixelFS::hash_name(filename);

        // Find parent directory
        let parent_idx = if components.len() == 1 {
            // Create in root
            self.find_root_dir_index(store)?
        } else {
            let parent_path = &components[..components.len() - 1];
            self.lookup_path_index(store, parent_path)?
        };

        // Check for duplicate
        let parent_inode = VastInode::read(store, parent_idx)?;
        if let Some((_, entry_idx)) = self.find_entry_by_hash(store, &parent_inode, file_hash) {
            let entry = read_dir_entry(
                store,
                self.get_entry_block_start(&parent_inode, entry_idx)?,
                entry_idx,
            )?;
            let existing_idx =
                (entry.inode_index_low as u64) | ((entry.inode_index_high as u64) << 32);

            // If it's not a directory, it's a file collision
            let existing_inode = VastInode::read(store, existing_idx)?;
            if existing_inode.mode & S_IFDIR == 0 {
                return None; // File already exists
            }
            // It's a directory with this name - also a collision
            return None;
        }

        // Create file inode
        let file_inode_idx = self.create_file(store, filename, mode)?;

        // Add entry to parent directory
        self.add_dir_entry(store, parent_idx, file_hash, file_inode_idx, mode)
            .or_else(|| {
                // Clean up on failure
                let _ = self.delete_file(store, file_inode_idx);
                None
            })?;

        Some(file_inode_idx)
    }

    /// Create a directory and all intermediate parent directories if they don't exist.
    /// Returns Inode index on success, None on error.
    /// Fails if: (1) final component already exists (duplicate), (2) intermediate component is a file
    pub fn mkdir_recursive_str(
        &mut self,
        store: &mut TileStore,
        path: &str,
        mode: u32,
    ) -> Option<u64> {
        let components = parse_path(path);

        // A directory must have execute permission bits to be traversable
        if mode & 0o111 == 0 {
            return None;
        }

        // Reject paths containing ".." - can't create parent references
        if components.iter().any(|c| *c == "..") {
            return None;
        }

        if components.is_empty() {
            return None; // Can't create empty path
        }

        // Build the path one component at a time, creating each if it doesn't exist
        let mut current_path = Vec::new();

        for (i, component) in components.iter().enumerate() {
            current_path.push(*component);
            let is_final = i == components.len() - 1;

            // Check if current component exists
            if let Some(existing_idx) = self.lookup_path_index(store, &current_path) {
                if let Some(existing_inode) = VastInode::read(store, existing_idx) {
                    // If this is the final component and it already exists, return None (duplicate)
                    if is_final {
                        return None;
                    }

                    // If intermediate component is not a directory, can't proceed
                    if existing_inode.mode & S_IFDIR == 0 {
                        return None; // Not a directory - path blocked by file
                    }
                    // Component exists and is a directory - continue
                } else {
                    return None; // Can't read inode - error
                }
            } else {
                // Try to create this directory level
                if self.mkdir(store, &current_path, mode).is_none() {
                    return None; // Failed to create
                }
            }
        }

        // Return the index of the final component
        self.lookup_path_index(store, &current_path)
    }

    /// Read all directory entries for a directory.
    /// Returns a Vec of (name_hash, inode_index, flags) tuples.
    pub fn readdir(&self, store: &mut TileStore, inode_index: u64) -> Option<Vec<(u32, u64, u32)>> {
        let inode = VastInode::read(store, inode_index)?;
        let mut entries = Vec::new();

        for extent in &inode.extents {
            for block_in_extent in 0..extent.count {
                let block_start = extent.start + (block_in_extent as u64 * 256);
                for entry_idx in 0..DIR_ENTRIES_PER_BLOCK {
                    if let Some(entry) = read_dir_entry(store, block_start, entry_idx) {
                        let inode_idx = (entry.inode_index_low as u64)
                            | ((entry.inode_index_high as u64) << 32);
                        entries.push((entry.name_hash, inode_idx, entry.flags));
                    }
                }
            }
        }

        Some(entries)
    }

    /// Get the name of a directory entry by inode index and hash.
    /// Returns the name string if found, None otherwise.
    pub fn get_dir_entry_name(
        &self,
        store: &mut TileStore,
        inode_index: u64,
        name_hash: u32,
    ) -> Option<String> {
        let inode = VastInode::read(store, inode_index)?;
        let (_, entry_idx) = self.find_entry_by_hash(store, &inode, name_hash)?;

        let block_start = self.get_entry_block_start(&inode, entry_idx)?;
        let entry = read_dir_entry(store, block_start, entry_idx)?;

        // We only have the hash, not the actual name. This is a limitation.
        // In a real filesystem, we'd store names directly or use a hash table.
        // For now, return None since we can't reconstruct the name from just the hash.
        None
    }

    /// Get the block start address for an entry in a directory.
    fn get_entry_block_start(&self, inode: &VastInode, entry_idx: usize) -> Option<u64> {
        for extent in &inode.extents {
            for block_in_extent in 0..extent.count {
                let block_start = extent.start + (block_in_extent as u64 * 256);
                if entry_idx >= (block_in_extent as usize) * DIR_ENTRIES_PER_BLOCK
                    && entry_idx < ((block_in_extent + 1) as usize) * DIR_ENTRIES_PER_BLOCK
                {
                    return Some(block_start);
                }
            }
        }
        None
    }

    /// Add a directory entry to a parent directory.
    fn add_dir_entry(
        &mut self,
        store: &mut TileStore,
        parent_idx: u64,
        name_hash: u32,
        child_idx: u64,
        flags: u32,
    ) -> Option<()> {
        let mut parent_inode = VastInode::read(store, parent_idx)?;
        let (block_start, entry_idx) = match find_free_slot(store, &parent_inode) {
            Some(slot) => slot,
            None => {
                // Fix: Allocate 256 units (1 full pixel block) to avoid overlap
                let (new_block_start, _) = self.allocator.allocate_extent(1)?; // 1 block = 256 units
                parent_inode.extents.push(VastExtent {
                    start: new_block_start,
                    count: 1,
                });
                parent_inode.size += 1024;
                parent_inode.write(store, parent_idx);

                // Zero out the new block
                for i in 0..256 {
                    store.set_pixel_at_index(new_block_start + i as u64, 0);
                }

                find_free_slot(store, &parent_inode)?
            }
        };

        let idx_low = (child_idx & 0xFFFFFFFF) as u32;
        let idx_high = (child_idx >> 32) as u32;
        write_dir_entry(
            store,
            block_start,
            entry_idx,
            &DirEntry {
                name_hash,
                inode_index_low: idx_low,
                inode_index_high: idx_high,
                flags,
            },
        );
        parent_inode.write(store, parent_idx);
        Some(())
    }

    /// Remove a directory entry from a parent directory.
    fn remove_dir_entry(
        &mut self,
        store: &mut TileStore,
        parent_idx: u64,
        name_hash: u32,
    ) -> Option<()> {
        let parent_inode = VastInode::read(store, parent_idx)?;
        let (block_start, entry_idx) = self.find_entry_by_hash(store, &parent_inode, name_hash)?;
        clear_dir_entry(store, block_start, entry_idx);
        Some(())
    }

    /// Find an entry by name hash in a directory.
    fn find_entry_by_hash(
        &self,
        store: &mut TileStore,
        inode: &VastInode,
        name_hash: u32,
    ) -> Option<(u64, usize)> {
        for extent in &inode.extents {
            for block_in_extent in 0..extent.count {
                let block_start = extent.start + (block_in_extent as u64 * 256);
                for entry_idx in 0..DIR_ENTRIES_PER_BLOCK {
                    if let Some(entry) = read_dir_entry(store, block_start, entry_idx) {
                        if entry.name_hash == name_hash {
                            return Some((block_start, entry_idx));
                        }
                    }
                }
            }
        }
        None
    }

    /// Look up a child inode by name hash in a directory.
    fn lookup_in_dir(
        &self,
        store: &mut TileStore,
        parent: &VastInode,
        name_hash: u32,
    ) -> Option<Option<u64>> {
        if let Some((block_start, entry_idx)) = self.find_entry_by_hash(store, parent, name_hash) {
            let entry = read_dir_entry(store, block_start, entry_idx)?;
            let child_idx =
                (entry.inode_index_low as u64) | ((entry.inode_index_high as u64) << 32);
            return Some(Some(child_idx));
        }
        Some(None)
    }

    /// Resolve a path component list to an inode index.
    pub fn lookup_path_index(&self, store: &mut TileStore, components: &[&str]) -> Option<u64> {
        let mut current = self.find_root_dir_index(store)?;
        for component in components {
            let current_inode = VastInode::read(store, current)?;
            if current_inode.mode & S_IFDIR == 0 {
                return None;
            }
            let hash = VastPixelFS::hash_name(component);
            current = self.lookup_in_dir(store, &current_inode, hash)??;
        }
        Some(current)
    }

    /// Find the root directory index by scanning the start of the User Data zone.
    fn find_root_dir_index(&self, store: &mut TileStore) -> Option<u64> {
        for i in 0..100 {
            let idx = 65536 + (i as u64 * 256);
            if let Some(inode) = VastInode::read(store, idx) {
                if inode.mode & S_IFDIR != 0 {
                    return Some(idx);
                }
            }
        }
        None
    }

    /// Check if a directory is empty.
    fn is_dir_empty(&self, store: &mut TileStore, inode: &VastInode) -> bool {
        for extent in &inode.extents {
            for block_in_extent in 0..extent.count {
                let block_start = extent.start + (block_in_extent as u64 * 256);
                for entry_idx in 0..DIR_ENTRIES_PER_BLOCK {
                    if read_dir_entry(store, block_start, entry_idx).is_some() {
                        return false;
                    }
                }
            }
        }
        true
    }

    /// Create a directory at the given path (as component slices).
    /// Parent directory must exist. Returns Inode index on success, None on error.
    pub fn mkdir(&mut self, store: &mut TileStore, components: &[&str], mode: u32) -> Option<u64> {
        if components.is_empty() {
            return None;
        }

        let dir_name = *components.last()?;
        let dir_hash = VastPixelFS::hash_name(dir_name);

        // Find parent directory
        let parent_idx = if components.len() == 1 {
            // Create in root
            self.find_root_dir_index(store)?
        } else {
            let parent_path = &components[..components.len() - 1];
            self.lookup_path_index(store, parent_path)?
        };

        // Check for duplicate
        let parent_inode = VastInode::read(store, parent_idx)?;
        if let Some((_, entry_idx)) = self.find_entry_by_hash(store, &parent_inode, dir_hash) {
            // Entry with this hash already exists
            let entry = read_dir_entry(
                store,
                self.get_entry_block_start(&parent_inode, entry_idx)?,
                entry_idx,
            )?;
            let existing_idx =
                (entry.inode_index_low as u64) | ((entry.inode_index_high as u64) << 32);

            // If it's already a directory, return None (duplicate)
            let existing_inode = VastInode::read(store, existing_idx)?;
            if existing_inode.mode & S_IFDIR != 0 {
                return None; // Directory already exists
            }
            // If it's a file, this is also an error (name collision)
            return None;
        }

        // Create directory inode
        let dir_inode_idx = self.create_file(store, dir_name, mode | S_IFDIR)?;

        // Add entry to parent directory
        self.add_dir_entry(store, parent_idx, dir_hash, dir_inode_idx, mode | S_IFDIR)
            .or_else(|| {
                // Clean up on failure
                let _ = self.delete_file(store, dir_inode_idx);
                None
            })?;

        Some(dir_inode_idx)
    }

    /// Remove a directory at the given path (as component slices).
    /// Directory must be empty. Returns true on success, None if not found or error.
    pub fn rmdir(&mut self, store: &mut TileStore, components: &[&str]) -> Option<bool> {
        if components.is_empty() {
            return None;
        }

        let dir_name = *components.last()?;
        let dir_hash = VastPixelFS::hash_name(dir_name);

        // Find parent directory
        let parent_idx = if components.len() == 1 {
            self.find_root_dir_index(store)?
        } else {
            let parent_path = &components[..components.len() - 1];
            self.lookup_path_index(store, parent_path)?
        };

        // Find the directory in parent
        let parent_inode = VastInode::read(store, parent_idx)?;
        let dir_idx = match self.lookup_in_dir(store, &parent_inode, dir_hash)? {
            Some(idx) => idx,
            None => return None, // Not found
        };

        // Verify it's a directory and check if empty
        let dir_inode = VastInode::read(store, dir_idx)?;
        if dir_inode.mode & S_IFDIR == 0 {
            return None; // Not a directory
        }

        if !self.is_dir_empty(store, &dir_inode) {
            return Some(false); // Not empty
        }

        // Remove entry from parent
        self.remove_dir_entry(store, parent_idx, dir_hash)?;

        // Delete directory inode
        self.delete_file(store, dir_idx)?;

        Some(true)
    }
}
