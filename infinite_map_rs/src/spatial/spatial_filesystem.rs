use std::collections::HashMap;
use crate::geoasm_materializer::CellState;

pub const PERM_READ: u8 = 0b100;
pub const PERM_WRITE: u8 = 0b010;
pub const PERM_EXECUTE: u8 = 0b001;

#[derive(Debug, Clone)]
pub struct FileMetadata {
    pub name: String,
    pub size: usize,
    pub permissions: u8,
    pub start_x: usize,
    pub start_y: usize,
    pub block_width: usize,
    pub block_height: usize,
}

#[derive(Debug, Clone, Copy)]
pub enum FsErrors {
    FileNotFound,
    PermissionDenied,
    OutOfSpace,
    InvalidPath,
}

#[derive(Debug, Default, Clone)]
pub struct FsStats {
    pub files_count: usize,
    pub total_space_used: usize,
    pub read_operations: usize,
    pub write_operations: usize,
}

pub struct SpatialFilesystem {
    pub files: HashMap<String, FileMetadata>,
    pub stats: FsStats,
}

impl SpatialFilesystem {
    pub fn new() -> Self {
        SpatialFilesystem {
            files: HashMap::new(),
            stats: FsStats::default(),
        }
    }

    pub fn create_file(&mut self, name: &str, size: usize, permissions: u8, start_x: usize, start_y: usize, block_width: usize, block_height: usize) -> Result<(), FsErrors> {
        let metadata = FileMetadata {
            name: name.to_string(),
            size,
            permissions,
            start_x,
            start_y,
            block_width,
            block_height,
        };
        self.files.insert(name.to_string(), metadata);
        self.stats.files_count += 1;
        self.stats.total_space_used += size;
        Ok(())
    }

    pub fn read_file(&mut self, name: &str, grid: &[CellState], grid_w: usize) -> Result<Vec<u8>, FsErrors> {
        self.stats.read_operations += 1;
        let metadata = self.files.get(name).ok_or(FsErrors::FileNotFound)?;
        if metadata.permissions & PERM_READ == 0 {
            return Err(FsErrors::PermissionDenied);
        }
        // In a real implementation this would read from the grid
        Ok(Vec::new())
    }

    pub fn write_file(&mut self, name: &str, data: &[u8], grid: &mut Vec<CellState>, grid_w: usize) -> Result<(), FsErrors> {
        self.stats.write_operations += 1;
        let metadata = self.files.get(name).ok_or(FsErrors::FileNotFound)?;
        if metadata.permissions & PERM_WRITE == 0 {
            return Err(FsErrors::PermissionDenied);
        }
        // In a real implementation this would write to the grid
        Ok(())
    }
}