// src/tilestore.rs
// Memory Palace tile storage backend

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Tile {
    pub x: i32,
    pub y: i32,
    pub brick: String,
    pub timestamp: u64,
}

pub struct Tilestore {
    tiles: HashMap<(i32, i32), Tile>,
    texture_size: u32,
    storage_path: PathBuf,
}

impl Tilestore {
    pub fn new(storage_path: PathBuf) -> Self {
        let mut tilestore = Self {
            tiles: HashMap::new(),
            texture_size: 256, // Default 256x256
            storage_path: storage_path.clone(),
        };

        // Load existing data if available
        if let Err(e) = tilestore.load() {
            log::warn!("Failed to load tilestore from {:?}: {}", storage_path, e);
        }

        tilestore
    }

    pub fn get_texture_size(&self) -> u32 {
        self.texture_size
    }

    pub fn get_tile_count(&self) -> usize {
        self.tiles.len()
    }

    pub fn get_tile(&self, x: i32, y: i32) -> Option<Tile> {
        self.tiles.get(&(x, y)).cloned()
    }

    pub fn get_all_tiles(&self) -> Vec<Tile> {
        self.tiles.values().cloned().collect()
    }

    pub fn set_tile(&mut self, x: i32, y: i32, brick: String) {
        let timestamp = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();

        let tile = Tile { x, y, brick, timestamp };
        self.tiles.insert((x, y), tile);
    }

    pub fn save(&self) -> Result<(), Box<dyn std::error::Error>> {
        // Ensure directory exists
        if let Some(parent) = self.storage_path.parent() {
            fs::create_dir_all(parent)?;
        }

        let json = serde_json::to_string_pretty(&self.tiles)?;
        fs::write(&self.storage_path, json)?;

        log::info!("Tilestore saved to {:?}", self.storage_path);
        Ok(())
    }

    fn load(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        if !self.storage_path.exists() {
            return Ok(());
        }

        let content = fs::read_to_string(&self.storage_path)?;
        let tiles: HashMap<(i32, i32), Tile> = serde_json::from_str(&content)?;

        self.tiles = tiles;
        log::info!("Tilestore loaded from {:?} ({} tiles)", self.storage_path, self.tiles.len());

        Ok(())
    }

    pub fn clear(&mut self) {
        self.tiles.clear();
    }
}

impl Drop for Tilestore {
    fn drop(&mut self) {
        if let Err(e) = self.save() {
            log::error!("Failed to save tilestore on drop: {}", e);
        }
    }
}