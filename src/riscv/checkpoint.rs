// checkpoint.rs -- RISC-V VM state checkpoint/restore for Memory Palace
// Phase 201: Checkpointing and Spatial Version Control

use serde::{Deserialize, Serialize};
use std::fs;
use std::time::{SystemTime, UNIX_EPOCH};

/// A snapshot of VM state at a moment in time.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Checkpoint {
    /// Unix timestamp when this checkpoint was created.
    pub timestamp: u64,
    /// Optional parent checkpoint ID for version branching.
    pub parent_id: Option<u64>,
    /// Human-readable description.
    pub description: Option<String>,

    // CPU state
    pub pc: u32,
    pub registers: [u32; 32],
    pub mtvec: u32,
    pub mscratch: u32,

    // Memory state
    pub ram_bytes: Vec<u8>,

    // Contexts (for cooperative multi-processing)
    pub contexts: Vec<ContextSnapshot>,
    pub current_context: usize,
    pub next_context_id: usize,

    // Block cache
    pub block_cache_entries: Vec<BlockCacheEntry>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContextSnapshot {
    pub context_id: usize,
    pub registers: [u32; 32],
    pub pc: u32,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BlockCacheEntry {
    pub pc: u32,
    pub end_pc: u32,
    pub instructions: Vec<u8>,
}

/// Checkpoint error types.
#[derive(Debug)]
pub enum CheckpointError {
    Io(String),
    Serialize(String),
    Deserialize(String),
    NotFound(String),
    Invalid(String),
}

impl std::fmt::Display for CheckpointError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CheckpointError::Io(e) => write!(f, "IO error: {}", e),
            CheckpointError::Serialize(e) => write!(f, "Serialization error: {}", e),
            CheckpointError::Deserialize(e) => write!(f, "Deserialization error: {}", e),
            CheckpointError::NotFound(e) => write!(f, "Not found: {}", e),
            CheckpointError::Invalid(e) => write!(f, "Invalid data: {}", e),
        }
    }
}

impl std::error::Error for CheckpointError {}

impl From<std::io::Error> for CheckpointError {
    fn from(e: std::io::Error) -> Self {
        CheckpointError::Io(e.to_string())
    }
}

/// Create checkpoint directory if it doesn't exist.
pub fn ensure_checkpoint_dir() -> Result<std::path::PathBuf, CheckpointError> {
    let dir = std::path::PathBuf::from(".geometry_os/checkpoints");
    fs::create_dir_all(&dir)?;
    Ok(dir)
}

/// Generate a unique checkpoint ID based on current timestamp.
pub fn generate_checkpoint_id() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_secs()
}

/// Save checkpoint to JSON file.
pub fn save_checkpoint(
    checkpoint: &Checkpoint,
    checkpoint_dir: &std::path::Path,
) -> Result<String, CheckpointError> {
    let filename = format!("checkpoint_{:016x}.json", checkpoint.timestamp);
    let path = checkpoint_dir.join(&filename);
    let json = serde_json::to_string_pretty(checkpoint)
        .map_err(|e| CheckpointError::Serialize(e.to_string()))?;
    fs::write(&path, json)?;
    Ok(filename)
}

/// Load checkpoint from JSON file.
pub fn load_checkpoint(
    filename: &str,
    checkpoint_dir: &std::path::Path,
) -> Result<Checkpoint, CheckpointError> {
    let path = checkpoint_dir.join(filename);
    if !path.exists() {
        return Err(CheckpointError::NotFound(format!(
            "Checkpoint file not found: {}",
            filename
        )));
    }
    let json = fs::read_to_string(&path)?;
    serde_json::from_str(&json).map_err(|e| CheckpointError::Deserialize(e.to_string()))
}

/// List all checkpoint files in the directory.
pub fn list_checkpoints(checkpoint_dir: &std::path::Path) -> Result<Vec<String>, CheckpointError> {
    if !checkpoint_dir.exists() {
        return Ok(Vec::new());
    }
    let mut checkpoints = Vec::new();
    for entry in fs::read_dir(checkpoint_dir)? {
        let entry = entry?;
        let filename = entry.file_name();
        let filename_str = filename.to_string_lossy();
        if filename_str.starts_with("checkpoint_") && filename_str.ends_with(".json") {
            checkpoints.push(filename_str.to_string());
        }
    }
    checkpoints.sort();
    checkpoints.reverse(); // Newest first
    Ok(checkpoints)
}

/// Delete a checkpoint file.
pub fn delete_checkpoint(
    filename: &str,
    checkpoint_dir: &std::path::Path,
) -> Result<(), CheckpointError> {
    let path = checkpoint_dir.join(filename);
    if !path.exists() {
        return Err(CheckpointError::NotFound(format!(
            "Checkpoint file not found: {}",
            filename
        )));
    }
    fs::remove_file(&path)?;
    Ok(())
}

/// Compare two checkpoints and return a structured diff.
pub fn diff_checkpoints(a: &Checkpoint, b: &Checkpoint) -> serde_json::Value {
    serde_json::json!({
        "timestamp_delta": b.timestamp as i64 - a.timestamp as i64,
        "pc_changed": a.pc != b.pc,
        "pc_delta": (b.pc as i64 - a.pc as i64),
        "registers_changed": a.registers.iter().zip(b.registers.iter())
            .enumerate()
            .filter(|(_, (ra, rb))| ra != rb)
            .map(|(i, _)| i)
            .collect::<Vec<_>>(),
        "ram_size_delta": b.ram_bytes.len() as i64 - a.ram_bytes.len() as i64,
        "contexts_count_delta": b.contexts.len() as i64 - a.contexts.len() as i64,
        "block_cache_count_delta": b.block_cache_entries.len() as i64 - a.block_cache_entries.len() as i64,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::TempDir;

    #[test]
    fn test_checkpoint_serialization() {
        let checkpoint = Checkpoint {
            timestamp: 1234567890,
            parent_id: None,
            description: Some("test".to_string()),
            pc: 0x1000,
            registers: [0u32; 32],
            mtvec: 0x80000000,
            mscratch: 0,
            ram_bytes: vec![0u8; 1024],
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 1,
            block_cache_entries: Vec::new(),
        };

        let json = serde_json::to_string(&checkpoint).unwrap();
        let restored: Checkpoint = serde_json::from_str(&json).unwrap();

        assert_eq!(checkpoint.timestamp, restored.timestamp);
        assert_eq!(checkpoint.pc, restored.pc);
    }

    #[test]
    fn test_save_and_load_checkpoint() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        let checkpoint = Checkpoint {
            timestamp: 1234567890,
            parent_id: None,
            description: Some("test checkpoint".to_string()),
            pc: 0x1000,
            registers: [1u32; 32],
            mtvec: 0x80000000,
            mscratch: 0,
            ram_bytes: vec![42u8; 512],
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 1,
            block_cache_entries: Vec::new(),
        };

        let filename = save_checkpoint(&checkpoint, checkpoint_dir).unwrap();
        let restored = load_checkpoint(&filename, checkpoint_dir).unwrap();

        assert_eq!(checkpoint.timestamp, restored.timestamp);
        assert_eq!(checkpoint.pc, restored.pc);
        assert_eq!(checkpoint.ram_bytes, restored.ram_bytes);
    }

    #[test]
    fn test_list_checkpoints() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        assert!(list_checkpoints(checkpoint_dir).unwrap().is_empty());

        let cp1 = Checkpoint {
            timestamp: 1,
            parent_id: None,
            description: None,
            pc: 0,
            registers: [0u32; 32],
            mtvec: 0,
            mscratch: 0,
            ram_bytes: Vec::new(),
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 0,
            block_cache_entries: Vec::new(),
        };

        let cp2 = Checkpoint {
            timestamp: 2,
            parent_id: None,
            description: None,
            pc: 0,
            registers: [0u32; 32],
            mtvec: 0,
            mscratch: 0,
            ram_bytes: Vec::new(),
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 0,
            block_cache_entries: Vec::new(),
        };

        save_checkpoint(&cp1, checkpoint_dir).unwrap();
        save_checkpoint(&cp2, checkpoint_dir).unwrap();

        let list = list_checkpoints(checkpoint_dir).unwrap();
        assert_eq!(list.len(), 2);
        assert!(list[0] > list[1]); // Newest first
    }

    #[test]
    fn test_delete_checkpoint() {
        let temp_dir = TempDir::new().unwrap();
        let checkpoint_dir = temp_dir.path();

        let cp = Checkpoint {
            timestamp: 1,
            parent_id: None,
            description: None,
            pc: 0,
            registers: [0u32; 32],
            mtvec: 0,
            mscratch: 0,
            ram_bytes: Vec::new(),
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 0,
            block_cache_entries: Vec::new(),
        };

        let filename = save_checkpoint(&cp, checkpoint_dir).unwrap();
        assert!(list_checkpoints(checkpoint_dir).unwrap().len() == 1);

        delete_checkpoint(&filename, checkpoint_dir).unwrap();
        assert!(list_checkpoints(checkpoint_dir).unwrap().is_empty());
    }

    #[test]
    fn test_diff_checkpoints() {
        let cp1 = Checkpoint {
            timestamp: 1,
            parent_id: None,
            description: None,
            pc: 0x1000,
            registers: [0u32; 32],
            mtvec: 0x80000000,
            mscratch: 0,
            ram_bytes: vec![0u8; 512],
            contexts: Vec::new(),
            current_context: 0,
            next_context_id: 1,
            block_cache_entries: Vec::new(),
        };

        let mut cp2 = cp1.clone();
        cp2.timestamp = 2;
        cp2.pc = 0x2000;
        cp2.registers[5] = 42;
        cp2.ram_bytes.resize(1024, 0);

        let diff = diff_checkpoints(&cp1, &cp2);
        assert_eq!(diff["timestamp_delta"], 1);
        assert_eq!(diff["pc_changed"], true);
        assert_eq!(diff["pc_delta"], 4096);
        assert_eq!(diff["registers_changed"].as_array().unwrap().len(), 1);
        assert_eq!(diff["ram_size_delta"], 512);
    }
}
