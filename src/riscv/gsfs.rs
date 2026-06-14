// riscv/gsfs.rs -- GeOS Simple Filesystem (Phase 379)
//
// A minimal flat filesystem that layers on top of the SPI SD block device.
// Designed for simplicity and testability, not performance.
//
// Layout on the SD card image:
//   Sector 0:       Superblock (magic, version, geometry, free pointer)
//   Sectors 1-7:    Directory (up to 112 entries, 64 bytes each = 7 sectors)
//   Sectors 8+:     Data area (files stored contiguously)
//
// Directory entry format (64 bytes):
//   Bytes 0-55:   Filename (null-terminated ASCII, max 55 chars)
//   Bytes 56-59:  Start sector (u32 LE)
//   Bytes 60-63:  File size in bytes (u32 LE)
//
// Superblock format (512 bytes, sector 0):
//   Offset 0:   Magic "GSFS" (0x47534653)
//   Offset 4:   Version (u32 LE, currently 1)
//   Offset 8:   Total sectors (u32 LE)
//   Offset 12:  Directory sector start (u32 LE, always 1)
//   Offset 16:  Directory sector count (u32 LE, always 7)
//   Offset 20:  Data area start sector (u32 LE, always 8)
//   Offset 24:  First free sector (u32 LE)
//   Offset 28:  File count (u32 LE)
//
// Operations are provided as host-side methods on Gsfs struct.
// Guest code accesses the filesystem via the SPI SD block read/write
// operations directly -- the guest driver interprets the on-disk format.

use super::spi_sd::{SpiSd, BLOCK_SIZE};

/// A block device that can be formatted and accessed as GSFS.
/// Implemented by SpiSd (SD card) and VirtioBlk (VirtIO disk) so the
/// same filesystem code works on both backing stores.
pub trait BlockDevice {
    /// Read one or more 512-byte blocks starting at `start_block`.
    fn read_blocks(&mut self, start_block: u64, count: u32) -> Option<Vec<u8>>;
    /// Write data to one or more 512-byte blocks starting at `start_block`.
    /// Data length must be a multiple of 512.
    fn write_blocks(&mut self, start_block: u64, data: &[u8]) -> bool;
    /// Total number of 512-byte blocks available.
    fn block_count(&self) -> u32;
}

/// Bridge: SpiSd implements BlockDevice for backward compat with existing GSFS code.
impl BlockDevice for SpiSd {
    fn read_blocks(&mut self, start_block: u64, count: u32) -> Option<Vec<u8>> {
        self.read_sectors_direct(start_block, count)
    }
    fn write_blocks(&mut self, start_block: u64, data: &[u8]) -> bool {
        self.write_sectors_direct(start_block, data)
    }
    fn block_count(&self) -> u32 {
        self.sector_count()
    }
}

/// GSFS Magic number: "GSFS"
pub const GSFS_MAGIC: u32 = 0x47534653;
/// Current filesystem version.
pub const GSFS_VERSION: u32 = 1;
/// Directory starts at sector 1 (sector 0 = superblock).
pub const DIR_SECTOR_START: u32 = 1;
/// Directory occupies 7 sectors (7 * 512 = 3584 bytes / 64 bytes per entry = 56 entries).
pub const DIR_SECTOR_COUNT: u32 = 7;
/// Data area starts at sector 8.
pub const DATA_SECTOR_START: u32 = 8;
/// Maximum directory entries.
pub const MAX_FILES: usize = 56;
/// Size of a directory entry in bytes.
pub const DIRENT_SIZE: usize = 64;
/// Maximum filename length (excluding null terminator).
pub const MAX_FILENAME_LEN: usize = 55;

/// Superblock structure (decoded from sector 0).
#[derive(Debug, Clone)]
pub struct Superblock {
    pub magic: u32,
    pub version: u32,
    pub total_sectors: u32,
    pub dir_sector_start: u32,
    pub dir_sector_count: u32,
    pub data_sector_start: u32,
    pub first_free_sector: u32,
    pub file_count: u32,
}

/// Directory entry (decoded from directory sectors).
#[derive(Debug, Clone)]
pub struct DirEntry {
    pub name: String,
    pub start_sector: u32,
    pub size_bytes: u32,
}

/// Filesystem mount state.
#[derive(Debug, Clone, PartialEq)]
pub enum MountState {
    /// Filesystem not mounted or no valid superblock found.
    Unmounted,
    /// Filesystem mounted and ready.
    Mounted,
    /// Block device has no filesystem (needs format).
    NoFilesystem,
}

/// GeOS Simple Filesystem. Operates on top of an SpiSd controller.
pub struct Gsfs {
    /// Mount state.
    pub state: MountState,
    /// Cached superblock (valid only when Mounted).
    pub superblock: Option<Superblock>,
    /// Cached directory entries (valid only when Mounted).
    pub directory: Vec<DirEntry>,
}

impl Default for Gsfs {
    fn default() -> Self {
        Self::new()
    }
}

impl Gsfs {
    /// Create a new unmounted filesystem handle.
    pub fn new() -> Self {
        Gsfs {
            state: MountState::Unmounted,
            superblock: None,
            directory: Vec::new(),
        }
    }

    /// Format the block device with a fresh GSFS filesystem.
    /// Writes superblock and empty directory sectors.
    /// Returns true on success.
    pub fn format(&mut self, dev: &mut dyn BlockDevice) -> bool {
        let total_sectors = dev.block_count();

        // Build superblock
        let mut sb_sector = [0u8; BLOCK_SIZE];
        sb_sector[0..4].copy_from_slice(&GSFS_MAGIC.to_le_bytes());
        sb_sector[4..8].copy_from_slice(&GSFS_VERSION.to_le_bytes());
        sb_sector[8..12].copy_from_slice(&total_sectors.to_le_bytes());
        sb_sector[12..16].copy_from_slice(&DIR_SECTOR_START.to_le_bytes());
        sb_sector[16..20].copy_from_slice(&DIR_SECTOR_COUNT.to_le_bytes());
        sb_sector[20..24].copy_from_slice(&DATA_SECTOR_START.to_le_bytes());
        sb_sector[24..28].copy_from_slice(&DATA_SECTOR_START.to_le_bytes()); // first_free = data start
        sb_sector[28..32].copy_from_slice(&0u32.to_le_bytes()); // file_count = 0

        // Write superblock to sector 0
        dev.write_blocks(0, &sb_sector);

        // Write empty directory sectors (1-7)
        let empty_dir = [0u8; BLOCK_SIZE];
        for i in 0..DIR_SECTOR_COUNT {
            dev.write_blocks(DIR_SECTOR_START as u64 + i as u64, &empty_dir);
        }

        // Update internal state
        self.superblock = Some(Superblock {
            magic: GSFS_MAGIC,
            version: GSFS_VERSION,
            total_sectors,
            dir_sector_start: DIR_SECTOR_START,
            dir_sector_count: DIR_SECTOR_COUNT,
            data_sector_start: DATA_SECTOR_START,
            first_free_sector: DATA_SECTOR_START,
            file_count: 0,
        });
        self.directory.clear();
        self.state = MountState::Mounted;

        true
    }

    /// Mount the filesystem: read and verify superblock, load directory.
    /// Returns Ok(()) on success, Err with description on failure.
    pub fn mount(&mut self, dev: &mut dyn BlockDevice) -> Result<MountState, String> {
        // Read superblock (sector 0)
        let sb_data = match dev.read_blocks(0, 1) {
            Some(d) => d,
            None => {
                self.state = MountState::Unmounted;
                return Err("failed to read superblock".to_string());
            },
        };

        let magic = u32::from_le_bytes(sb_data[0..4].try_into().unwrap());
        if magic != GSFS_MAGIC {
            self.state = MountState::NoFilesystem;
            return Ok(MountState::NoFilesystem);
        }

        let version = u32::from_le_bytes(sb_data[4..8].try_into().unwrap());
        if version != GSFS_VERSION {
            self.state = MountState::Unmounted;
            return Err(format!("unsupported version: {}", version));
        }

        let total_sectors = u32::from_le_bytes(sb_data[8..12].try_into().unwrap());
        let dir_sector_start = u32::from_le_bytes(sb_data[12..16].try_into().unwrap());
        let dir_sector_count = u32::from_le_bytes(sb_data[16..20].try_into().unwrap());
        let data_sector_start = u32::from_le_bytes(sb_data[20..24].try_into().unwrap());
        let first_free_sector = u32::from_le_bytes(sb_data[24..28].try_into().unwrap());
        let file_count = u32::from_le_bytes(sb_data[28..32].try_into().unwrap());

        let sb = Superblock {
            magic,
            version,
            total_sectors,
            dir_sector_start,
            dir_sector_count,
            data_sector_start,
            first_free_sector,
            file_count,
        };

        // Read directory
        let dir_data = match dev.read_blocks(dir_sector_start as u64, dir_sector_count) {
            Some(d) => d,
            None => {
                self.state = MountState::Unmounted;
                return Err("failed to read directory".to_string());
            },
        };

        let mut directory = Vec::new();
        let num_entries = file_count as usize;
        for i in 0..num_entries.min(MAX_FILES) {
            let offset = i * DIRENT_SIZE;
            if offset + DIRENT_SIZE > dir_data.len() {
                break;
            }
            let entry = Self::decode_dirent(&dir_data[offset..offset + DIRENT_SIZE]);
            if entry.name.is_empty() {
                continue;
            }
            directory.push(entry);
        }

        self.superblock = Some(sb);
        self.directory = directory;
        self.state = MountState::Mounted;

        Ok(MountState::Mounted)
    }

    /// Unmount: flush any cached state.
    pub fn unmount(&mut self) {
        self.state = MountState::Unmounted;
        self.superblock = None;
        self.directory.clear();
    }

    /// Check if the filesystem is currently mounted.
    pub fn is_mounted(&self) -> bool {
        self.state == MountState::Mounted
    }

    /// Check if a valid GSFS superblock was found (may be unmounted but formatted).
    pub fn is_formatted(&self) -> bool {
        self.superblock.is_some()
    }

    /// Get the total number of inodes (directory entries) possible.
    /// In GSFS, this is limited by the directory sector count.
    pub fn total_inodes(&self) -> u32 {
        // Each dir entry is ~32 bytes, 512 bytes per sector, DIR_SECTOR_COUNT sectors
        (BLOCK_SIZE as u32 / 32) * DIR_SECTOR_COUNT
    }

    /// Get the number of free inodes (remaining directory slots).
    pub fn free_inodes(&self) -> u32 {
        self.total_inodes() - self.directory.len() as u32
    }

    /// Get the number of used data blocks.
    pub fn used_blocks(&self) -> u32 {
        self.directory
            .iter()
            .map(|e| ((e.size_bytes as u64) + BLOCK_SIZE as u64 - 1) / BLOCK_SIZE as u64)
            .sum::<u64>() as u32
    }

    /// List all files in the mounted filesystem.
    /// Returns empty vec if not mounted.
    pub fn list_files(&self) -> &[DirEntry] {
        &self.directory
    }

    /// Read a file by name. Returns the file contents as bytes.
    pub fn read_file(&self, dev: &mut dyn BlockDevice, name: &str) -> Option<Vec<u8>> {
        if self.state != MountState::Mounted {
            return None;
        }
        let sb = self.superblock.as_ref()?;

        // Find file in directory
        let entry = self.directory.iter().find(|e| e.name == name)?;

        // Calculate how many sectors the file spans
        let sectors_needed =
            ((entry.size_bytes as u64) + BLOCK_SIZE as u64 - 1) / BLOCK_SIZE as u64;

        // Read the sectors
        let data = dev.read_blocks(entry.start_sector as u64, sectors_needed as u32)?;

        // Return only the actual file size
        Some(data[..entry.size_bytes as usize].to_vec())
    }

    /// Write (create or overwrite) a file. Returns true on success.
    pub fn write_file(&mut self, dev: &mut dyn BlockDevice, name: &str, data: &[u8]) -> bool {
        if self.state != MountState::Mounted {
            return false;
        }
        let sb = match &self.superblock {
            Some(s) => s.clone(),
            None => return false,
        };

        // Check filename length
        if name.len() > MAX_FILENAME_LEN || name.is_empty() {
            return false;
        }

        // Calculate sectors needed for data
        let sectors_needed: u32 = if data.is_empty() {
            0
        } else {
            (((data.len() as u64) + BLOCK_SIZE as u64 - 1) / BLOCK_SIZE as u64) as u32
        };

        // Check if file already exists (overwrite)
        let existing_idx = self.directory.iter().position(|e| e.name == name);

        let (start_sector, sectors_to_write) = if let Some(idx) = existing_idx {
            // Overwrite: reuse the same sector range if it fits
            let existing = &self.directory[idx];
            let existing_sectors: u32 = if existing.size_bytes == 0 {
                0
            } else {
                (((existing.size_bytes as u64) + BLOCK_SIZE as u64 - 1) / BLOCK_SIZE as u64) as u32
            };

            if sectors_needed <= existing_sectors || sectors_needed == 0 {
                // Fits in existing allocation
                (existing.start_sector, sectors_needed)
            } else {
                // Need new allocation (waste old space -- simple allocator)
                let new_start = sb.first_free_sector;
                if new_start + sectors_needed > sb.total_sectors {
                    return false; // out of space
                }
                (new_start, sectors_needed)
            }
        } else {
            // New file: allocate from free sector pointer
            if self.directory.len() >= MAX_FILES {
                return false; // directory full
            }
            let start = sb.first_free_sector;
            if start + sectors_needed > sb.total_sectors {
                return false; // out of space
            }
            (start, sectors_needed)
        };

        // Write file data (pad to full sectors)
        if sectors_to_write > 0 {
            let mut sector_data = vec![0u8; sectors_to_write as usize * BLOCK_SIZE];
            sector_data[..data.len()].copy_from_slice(data);
            if !dev.write_blocks(start_sector as u64, &sector_data) {
                return false;
            }
        }

        // Update directory entry
        let dir_entry = DirEntry {
            name: name.to_string(),
            start_sector,
            size_bytes: data.len() as u32,
        };

        if let Some(idx) = existing_idx {
            self.directory[idx] = dir_entry;
        } else {
            self.directory.push(dir_entry);
        }

        // Write updated directory to disk
        if !self.flush_directory(dev) {
            return false;
        }

        // Update superblock (free pointer and file count)
        let new_free = if existing_idx.is_none() {
            start_sector + sectors_to_write.max(1) // at least 1 sector for new files
        } else if sectors_to_write > 0 && start_sector + sectors_to_write > sb.first_free_sector {
            start_sector + sectors_to_write
        } else {
            sb.first_free_sector
        };

        self.superblock.as_mut().unwrap().first_free_sector = new_free;
        self.superblock.as_mut().unwrap().file_count = self.directory.len() as u32;

        if !self.flush_superblock(dev) {
            return false;
        }

        true
    }

    /// Delete a file by name. Returns true if the file was found and removed.
    pub fn delete_file(&mut self, dev: &mut dyn BlockDevice, name: &str) -> bool {
        if self.state != MountState::Mounted {
            return false;
        }

        let idx = match self.directory.iter().position(|e| e.name == name) {
            Some(i) => i,
            None => return false,
        };

        self.directory.remove(idx);

        // Write updated directory
        if !self.flush_directory(dev) {
            return false;
        }

        // Update superblock
        self.superblock.as_mut().unwrap().file_count = self.directory.len() as u32;
        self.flush_superblock(dev)
    }

    /// Get filesystem info (total/free sectors, file count).
    pub fn fs_info(&self) -> Option<(u32, u32, usize)> {
        let sb = self.superblock.as_ref()?;
        let free_sectors = sb.total_sectors.saturating_sub(sb.first_free_sector);
        Some((sb.total_sectors, free_sectors, self.directory.len()))
    }

    /// Check if a file exists.
    pub fn file_exists(&self, name: &str) -> bool {
        self.directory.iter().any(|e| e.name == name)
    }

    /// Get file size by name.
    pub fn file_size(&self, name: &str) -> Option<u32> {
        self.directory
            .iter()
            .find(|e| e.name == name)
            .map(|e| e.size_bytes)
    }

    // --- Internal methods ---

    /// Decode a directory entry from raw bytes.
    fn decode_dirent(data: &[u8]) -> DirEntry {
        assert!(data.len() >= DIRENT_SIZE);

        // Find null terminator in name field
        let name_end = data[..MAX_FILENAME_LEN + 1]
            .iter()
            .position(|&b| b == 0)
            .unwrap_or(MAX_FILENAME_LEN);
        let name = String::from_utf8_lossy(&data[..name_end]).to_string();

        let start_sector = u32::from_le_bytes(data[56..60].try_into().unwrap());
        let size_bytes = u32::from_le_bytes(data[60..64].try_into().unwrap());

        DirEntry {
            name,
            start_sector,
            size_bytes,
        }
    }

    /// Encode a directory entry to raw bytes.
    fn encode_dirent(entry: &DirEntry) -> [u8; DIRENT_SIZE] {
        let mut buf = [0u8; DIRENT_SIZE];

        // Name (null-terminated, max 55 chars + null)
        let name_bytes = entry.name.as_bytes();
        let copy_len = name_bytes.len().min(MAX_FILENAME_LEN);
        buf[..copy_len].copy_from_slice(&name_bytes[..copy_len]);
        // Rest is already zeros (null terminator + padding)

        // Start sector at offset 56
        buf[56..60].copy_from_slice(&entry.start_sector.to_le_bytes());
        // Size at offset 60
        buf[60..64].copy_from_slice(&entry.size_bytes.to_le_bytes());

        buf
    }

    /// Flush the in-memory directory to the block device.
    fn flush_directory(&self, dev: &mut dyn BlockDevice) -> bool {
        let sb = match &self.superblock {
            Some(s) => s,
            None => return false,
        };

        // Build directory sectors
        let mut dir_data = vec![0u8; DIR_SECTOR_COUNT as usize * BLOCK_SIZE];

        for (i, entry) in self.directory.iter().enumerate() {
            let offset = i * DIRENT_SIZE;
            if offset + DIRENT_SIZE > dir_data.len() {
                break;
            }
            let encoded = Self::encode_dirent(entry);
            dir_data[offset..offset + DIRENT_SIZE].copy_from_slice(&encoded);
        }

        // Write each sector
        for i in 0..DIR_SECTOR_COUNT {
            let sector_start = i as usize * BLOCK_SIZE;
            let sector_end = sector_start + BLOCK_SIZE;
            if sector_end > dir_data.len() {
                break;
            }
            if !dev.write_blocks(
                sb.dir_sector_start as u64 + i as u64,
                &dir_data[sector_start..sector_end],
            ) {
                return false;
            }
        }

        true
    }

    /// Flush the in-memory superblock to the block device.
    fn flush_superblock(&self, dev: &mut dyn BlockDevice) -> bool {
        let sb = match &self.superblock {
            Some(s) => s,
            None => return false,
        };

        let mut buf = [0u8; BLOCK_SIZE];
        buf[0..4].copy_from_slice(&sb.magic.to_le_bytes());
        buf[4..8].copy_from_slice(&sb.version.to_le_bytes());
        buf[8..12].copy_from_slice(&sb.total_sectors.to_le_bytes());
        buf[12..16].copy_from_slice(&sb.dir_sector_start.to_le_bytes());
        buf[16..20].copy_from_slice(&sb.dir_sector_count.to_le_bytes());
        buf[20..24].copy_from_slice(&sb.data_sector_start.to_le_bytes());
        buf[24..28].copy_from_slice(&sb.first_free_sector.to_le_bytes());
        buf[28..32].copy_from_slice(&sb.file_count.to_le_bytes());

        dev.write_blocks(0, &buf)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;
    use tempfile::TempDir;

    fn make_test_fs() -> (TempDir, SpiSd, Gsfs) {
        let dir = TempDir::new().unwrap();
        let path = dir.path().join("test_fs.img");
        // Create a 1MB test image (2048 sectors)
        let sectors = 2048u32;
        let size = sectors as u64 * BLOCK_SIZE as u64;
        SpiSd::create_blank_image(&path, size).unwrap();
        let mut sd = SpiSd::with_path(&path);
        let fs = Gsfs::new();
        (dir, sd, fs)
    }

    #[test]
    fn test_gsfs_format() {
        let (_dir, mut sd, mut fs) = make_test_fs();

        assert!(fs.format(&mut sd));
        assert_eq!(fs.state, MountState::Mounted);

        let sb = fs.superblock.as_ref().unwrap();
        assert_eq!(sb.magic, GSFS_MAGIC);
        assert_eq!(sb.version, GSFS_VERSION);
        assert_eq!(sb.total_sectors, 2048);
        assert_eq!(sb.dir_sector_start, DIR_SECTOR_START);
        assert_eq!(sb.dir_sector_count, DIR_SECTOR_COUNT);
        assert_eq!(sb.data_sector_start, DATA_SECTOR_START);
        assert_eq!(sb.first_free_sector, DATA_SECTOR_START);
        assert_eq!(sb.file_count, 0);
    }

    #[test]
    fn test_gsfs_mount_formatted() {
        let (_dir, mut sd, mut fs) = make_test_fs();

        fs.format(&mut sd);
        fs.unmount();
        assert_eq!(fs.state, MountState::Unmounted);

        let result = fs.mount(&mut sd);
        assert!(result.is_ok());
        assert_eq!(fs.state, MountState::Mounted);

        let sb = fs.superblock.as_ref().unwrap();
        assert_eq!(sb.magic, GSFS_MAGIC);
        assert_eq!(sb.file_count, 0);
    }

    #[test]
    fn test_gsfs_mount_unformatted() {
        let (_dir, mut sd, mut fs) = make_test_fs();

        // Don't format, just try to mount
        let result = fs.mount(&mut sd);
        assert!(result.is_ok());
        assert_eq!(result.unwrap(), MountState::NoFilesystem);
        assert_eq!(fs.state, MountState::NoFilesystem);
    }

    #[test]
    fn test_gsfs_write_read_file() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        // Write a file
        let data = b"Hello, GeOS filesystem!";
        assert!(fs.write_file(&mut sd, "hello.txt", data));

        // Verify file count
        assert_eq!(fs.directory.len(), 1);

        // Read back
        let read_data = fs.read_file(&mut sd, "hello.txt").unwrap();
        assert_eq!(&read_data, data);
    }

    #[test]
    fn test_gsfs_write_multiple_files() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        // Write three files
        assert!(fs.write_file(&mut sd, "file1.txt", b"First file content"));
        assert!(fs.write_file(
            &mut sd,
            "file2.dat",
            b"Second file content, longer than first"
        ));
        assert!(fs.write_file(&mut sd, "config.cfg", b"key=value"));

        assert_eq!(fs.directory.len(), 3);

        // Read all back
        assert_eq!(
            &fs.read_file(&mut sd, "file1.txt").unwrap(),
            b"First file content"
        );
        assert_eq!(
            &fs.read_file(&mut sd, "file2.dat").unwrap(),
            b"Second file content, longer than first"
        );
        assert_eq!(&fs.read_file(&mut sd, "config.cfg").unwrap(), b"key=value");
    }

    #[test]
    fn test_gsfs_overwrite_file() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        // Write a file
        assert!(fs.write_file(&mut sd, "data.bin", b"original"));

        // Overwrite with new content
        assert!(fs.write_file(&mut sd, "data.bin", b"updated content here"));

        // Should still be one file
        assert_eq!(fs.directory.len(), 1);

        // Read back the updated content
        let read_data = fs.read_file(&mut sd, "data.bin").unwrap();
        assert_eq!(&read_data, b"updated content here");
    }

    #[test]
    fn test_gsfs_delete_file() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        assert!(fs.write_file(&mut sd, "temp.txt", b"temporary"));
        assert!(fs.write_file(&mut sd, "keep.txt", b"permanent"));
        assert_eq!(fs.directory.len(), 2);

        // Delete temp file
        assert!(fs.delete_file(&mut sd, "temp.txt"));
        assert_eq!(fs.directory.len(), 1);

        // temp should be gone
        assert!(!fs.file_exists("temp.txt"));
        assert!(fs.read_file(&mut sd, "temp.txt").is_none());

        // keep should still be there
        assert!(fs.file_exists("keep.txt"));
        assert_eq!(&fs.read_file(&mut sd, "keep.txt").unwrap(), b"permanent");
    }

    #[test]
    fn test_gsfs_list_files() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        assert!(fs.write_file(&mut sd, "alpha.txt", b"aaa"));
        assert!(fs.write_file(&mut sd, "beta.txt", b"bbb"));

        let files = fs.list_files();
        assert_eq!(files.len(), 2);
        assert_eq!(files[0].name, "alpha.txt");
        assert_eq!(files[1].name, "beta.txt");
    }

    #[test]
    fn test_gsfs_file_exists() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        assert!(!fs.file_exists("nonexistent.txt"));
        assert!(fs.write_file(&mut sd, "real.txt", b"data"));
        assert!(fs.file_exists("real.txt"));
    }

    #[test]
    fn test_gsfs_file_size() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        assert!(fs.write_file(&mut sd, "sized.bin", b"1234567890"));

        assert_eq!(fs.file_size("sized.bin"), Some(10));
        assert_eq!(fs.file_size("missing.bin"), None);
    }

    #[test]
    fn test_gsfs_fs_info() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        let (total, free, file_count) = fs.fs_info().unwrap();
        assert_eq!(total, 2048);
        assert_eq!(free, 2048 - DATA_SECTOR_START); // all sectors beyond data start are free
        assert_eq!(file_count, 0);
    }

    #[test]
    fn test_gsfs_persistence_across_mounts() {
        let (_dir, mut sd, mut fs) = make_test_fs();

        // Format and write
        fs.format(&mut sd);
        assert!(fs.write_file(&mut sd, "persist.txt", b"survives remount"));

        // Unmount
        fs.unmount();
        assert_eq!(fs.state, MountState::Unmounted);

        // Remount and verify
        let mut fs2 = Gsfs::new();
        fs2.mount(&mut sd).unwrap();
        assert_eq!(fs2.state, MountState::Mounted);
        assert_eq!(fs2.directory.len(), 1);
        assert_eq!(
            &fs2.read_file(&mut sd, "persist.txt").unwrap(),
            b"survives remount"
        );
    }

    #[test]
    fn test_gsfs_empty_file() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        // Write an empty file
        assert!(fs.write_file(&mut sd, "empty.txt", b""));

        assert_eq!(fs.directory.len(), 1);
        assert_eq!(fs.file_size("empty.txt"), Some(0));

        let data = fs.read_file(&mut sd, "empty.txt").unwrap();
        assert!(data.is_empty());
    }

    #[test]
    fn test_gsfs_large_file_multi_sector() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        // Write a file larger than one sector (512 bytes)
        let large_data: Vec<u8> = (0..1024).map(|i| (i % 256) as u8).collect();
        assert!(fs.write_file(&mut sd, "large.bin", &large_data));

        let read_data = fs.read_file(&mut sd, "large.bin").unwrap();
        assert_eq!(read_data.len(), 1024);
        assert_eq!(read_data, large_data);
    }

    #[test]
    fn test_gsfs_unmount_clears_state() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);
        assert!(fs.write_file(&mut sd, "test.txt", b"data"));

        assert!(fs.superblock.is_some());
        assert!(!fs.directory.is_empty());

        fs.unmount();

        assert!(fs.superblock.is_none());
        assert!(fs.directory.is_empty());
        assert_eq!(fs.state, MountState::Unmounted);
    }

    #[test]
    fn test_gsfs_read_nonexistent_file() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        fs.format(&mut sd);

        assert!(fs.read_file(&mut sd, "nope.txt").is_none());
    }

    #[test]
    fn test_gsfs_operations_without_mount() {
        let (_dir, mut sd, mut fs) = make_test_fs();
        // Don't format or mount

        assert!(!fs.write_file(&mut sd, "fail.txt", b"data"));
        assert!(fs.read_file(&mut sd, "fail.txt").is_none());
        assert!(!fs.delete_file(&mut sd, "fail.txt"));
        assert!(fs.list_files().is_empty());
        assert!(fs.fs_info().is_none());
    }

    #[test]
    fn test_gsfs_mmio_bus_integration() {
        // Test that GSFS operations work through the bus MMIO interface
        use super::super::bus::Bus;

        let mut bus = Bus::new(0, 64 * 1024 * 1024);

        // Read initial status - should be 0 (idle/not formatted)
        let status = bus.read_word(0x1000_5000).unwrap();
        assert_eq!(status, 0, "initial status should be 0 (idle)");

        // Read block size - should be 512
        let block_size = bus.read_word(0x1000_5004).unwrap();
        assert_eq!(block_size, 512, "block size should be 512");

        // Read block count - should match SD card sector count
        let block_count = bus.read_word(0x1000_5008).unwrap();
        assert!(block_count > 0, "block count should be > 0");

        // Issue format command via MMIO write
        bus.write_word(0x1000_5000, 1).unwrap();

        // Check status - should be 1 (formatted) or 2 (mounted since format auto-mounts)
        let status_after_format = bus.read_word(0x1000_5000).unwrap();
        assert!(
            status_after_format == 1 || status_after_format == 2,
            "status after format should be 1 or 2, got {}",
            status_after_format
        );

        // Check total inodes
        let total_inodes = bus.read_word(0x1000_500C).unwrap();
        assert!(
            total_inodes > 0,
            "total inodes should be > 0, got {}",
            total_inodes
        );

        // Check free inodes (should equal total since no files)
        let free_inodes = bus.read_word(0x1000_5010).unwrap();
        assert_eq!(
            free_inodes, total_inodes,
            "free inodes should equal total (no files)"
        );

        // Check used blocks
        let used_blocks = bus.read_word(0x1000_5014).unwrap();
        assert_eq!(used_blocks, 0, "used blocks should be 0 (no files)");

        // Issue unmount command
        bus.write_word(0x1000_5000, 3).unwrap();
        let status_unmount = bus.read_word(0x1000_5000).unwrap();
        assert_eq!(status_unmount, 0, "status after unmount should be 0");

        // Issue mount command
        bus.write_word(0x1000_5000, 2).unwrap();
        let status_mount = bus.read_word(0x1000_5000).unwrap();
        assert_eq!(status_mount, 2, "status after mount should be 2");
    }
}
