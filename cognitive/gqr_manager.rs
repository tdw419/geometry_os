// gqr_manager.rs - The Librarian
// 
// Manages the lifecycle of GQR blocks:
// - FETCH: Scan framebuffer for active blocks
// - STORE: Seal new blocks (Ouroboros success)
// - VERIFY: Check shimmer integrity
// - ARCHIVE: Move old blocks to memory sector
// - PROTECT: Prevent overwrites

use std::collections::HashMap;
use std::time::{SystemTime, UNIX_EPOCH};

/// GQR block states
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum GqrState {
    /// Static, stored memory
    Static,
    /// Pending ratification (slow shimmer)
    Pending,
    /// Ratified, awaiting execution
    Ratified,
    /// Currently executing
    Executing,
    /// Corrupted, needs rollback
    Corrupted,
}

/// GQR intent types
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GqrIntent {
    DataConstant,
    ProcessorNode,
    BusPathway,
    ExecutiveOrder,
    MemoryArchive,
    VetoZone,
    ContractProposal,
    Unknown,
}

/// Managed GQR block with full lifecycle tracking
#[derive(Debug, Clone)]
pub struct ManagedGqr {
    /// Unique identifier
    pub id: u64,
    /// Intent type
    pub intent: GqrIntent,
    /// Position in framebuffer
    pub position: [u32; 2],
    /// Size (3x3, 5x5, etc)
    pub size: u32,
    /// Current state
    pub state: GqrState,
    /// Creation timestamp
    pub created: u64,
    /// Last access timestamp
    pub last_accessed: u64,
    /// Access count
    pub access_count: u32,
    /// Priority score (higher = more important)
    pub priority: u32,
    /// Semantic payload
    pub payload: Vec<char>,
    /// Shimmer phase offset
    pub shimmer_phase: f32,
    /// Parent block (if spawned from another)
    pub parent_id: Option<u64>,
    /// Child blocks (if this spawned others)
    pub child_ids: Vec<u64>,
}

/// GQR Manager - The Librarian
pub struct GqrManager {
    /// All managed blocks
    blocks: HashMap<u64, ManagedGqr>,
    /// Next block ID
    next_id: u64,
    /// Memory sector position (where archived blocks go)
    memory_sector: [u32; 2],
    /// Framebuffer dimensions
    fb_width: u32,
    fb_height: u32,
    /// Index by position for fast lookup
    position_index: HashMap<(u32, u32), u64>,
    /// Index by intent for filtered queries
    intent_index: HashMap<GqrIntent, Vec<u64>>,
}

impl GqrManager {
    /// Create new GQR manager
    pub fn new(fb_width: u32, fb_height: u32) -> Self {
        Self {
            blocks: HashMap::new(),
            next_id: 1,
            memory_sector: [fb_width - 100, 0], // Top-right corner
            fb_width,
            fb_height,
            position_index: HashMap::new(),
            intent_index: HashMap::new(),
        }
    }
    
    /// Get current timestamp
    fn now() -> u64 {
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_secs()
    }
    
    /// Store a new GQR block (seal a thought)
    pub fn store(
        &mut self,
        intent: GqrIntent,
        position: [u32; 2],
        payload: Vec<char>,
        priority: u32,
    ) -> u64 {
        let id = self.next_id;
        self.next_id += 1;
        
        let block = ManagedGqr {
            id,
            intent,
            position,
            size: 3,
            state: GqrState::Pending,
            created: Self::now(),
            last_accessed: Self::now(),
            access_count: 0,
            priority,
            payload,
            shimmer_phase: (id as f32 * 0.7).fract(), // Unique phase
            parent_id: None,
            child_ids: Vec::new(),
        };
        
        // Update indices
        self.position_index.insert((position[0], position[1]), id);
        self.intent_index.entry(intent).or_insert_with(Vec::new).push(id);
        
        self.blocks.insert(id, block);
        
        println!("🧬 LIBRARIAN: Thought sealed at ({}, {}). ID: {}", position[0], position[1], id);
        
        id
    }
    
    /// Fetch a block by ID
    pub fn fetch(&mut self, id: u64) -> Option<&ManagedGqr> {
        if let Some(block) = self.blocks.get_mut(&id) {
            block.last_accessed = Self::now();
            block.access_count += 1;
        }
        self.blocks.get(&id)
    }
    
    /// Fetch block at position
    pub fn fetch_at(&mut self, x: u32, y: u32) -> Option<&ManagedGqr> {
        if let Some(&id) = self.position_index.get(&(x, y)) {
            self.fetch(id)
        } else {
            None
        }
    }
    
    /// Find blocks by intent
    pub fn find_by_intent(&self, intent: GqrIntent) -> Vec<&ManagedGqr> {
        if let Some(ids) = self.intent_index.get(&intent) {
            ids.iter().filter_map(|id| self.blocks.get(id)).collect()
        } else {
            Vec::new()
        }
    }
    
    /// Find all pending blocks (awaiting ratification)
    pub fn find_pending(&self) -> Vec<&ManagedGqr> {
        self.blocks.values()
            .filter(|b| b.state == GqrState::Pending)
            .collect()
    }
    
    /// Verify block integrity (check shimmer)
    pub fn verify(&self, id: u64) -> bool {
        if let Some(block) = self.blocks.get(&id) {
            // Check if block is corrupted
            block.state != GqrState::Corrupted
        } else {
            false
        }
    }
    
    /// Ratify a pending block (human approved)
    pub fn ratify(&mut self, id: u64) -> bool {
        if let Some(block) = self.blocks.get_mut(&id) {
            if block.state == GqrState::Pending {
                block.state = GqrState::Ratified;
                println!("✍️ LIBRARIAN: Block {} ratified. State: Pending → Ratified", id);
                return true;
            }
        }
        false
    }
    
    /// Execute a ratified block
    pub fn execute(&mut self, id: u64) -> bool {
        if let Some(block) = self.blocks.get_mut(&id) {
            if block.state == GqrState::Ratified {
                block.state = GqrState::Executing;
                println!("⚡ LIBRARIAN: Block {} executing. State: Ratified → Executing", id);
                return true;
            }
        }
        false
    }
    
    /// Complete execution (block becomes static)
    pub fn complete(&mut self, id: u64) -> bool {
        if let Some(block) = self.blocks.get_mut(&id) {
            if block.state == GqrState::Executing {
                block.state = GqrState::Static;
                println!("✅ LIBRARIAN: Block {} complete. State: Executing → Static", id);
                return true;
            }
        }
        false
    }
    
    /// Veto a block (mark as corrupted)
    pub fn veto(&mut self, id: u64) -> bool {
        if let Some(block) = self.blocks.get_mut(&id) {
            block.state = GqrState::Corrupted;
            println!("🚫 LIBRARIAN: Block {} vetoed. Marked as corrupted", id);
            true
        } else {
            false
        }
    }
    
    /// Archive a block (move to memory sector)
    pub fn archive(&mut self, id: u64) -> bool {
        // Calculate next position in memory sector first
        let archived_count = self.blocks.values()
            .filter(|b| b.intent == GqrIntent::MemoryArchive)
            .count() as u32;
        
        let new_x = self.memory_sector[0] + (archived_count % 10) * 5;
        let new_y = self.memory_sector[1] + (archived_count / 10) * 5;
        
        if let Some(block) = self.blocks.get_mut(&id) {
            // Update position index
            self.position_index.remove(&(block.position[0], block.position[1]));
            self.position_index.insert((new_x, new_y), id);
            
            // Update block
            block.position = [new_x, new_y];
            block.intent = GqrIntent::MemoryArchive;
            block.state = GqrState::Static;
            
            println!("📦 LIBRARIAN: Block {} archived to ({}, {})", id, new_x, new_y);
            return true;
        }
        false
    }
    
    /// Spawn child block from parent
    pub fn spawn_child(
        &mut self,
        parent_id: u64,
        intent: GqrIntent,
        offset: [u32; 2],
        payload: Vec<char>,
    ) -> Option<u64> {
        let parent = self.blocks.get(&parent_id)?;
        let position = [
            parent.position[0] + offset[0],
            parent.position[1] + offset[1],
        ];
        
        let child_id = self.store(intent, position, payload, parent.priority);
        
        // Link parent and child
        if let Some(child) = self.blocks.get_mut(&child_id) {
            child.parent_id = Some(parent_id);
        }
        if let Some(parent) = self.blocks.get_mut(&parent_id) {
            parent.child_ids.push(child_id);
        }
        
        println!("🔗 LIBRARIAN: Child {} spawned from parent {}", child_id, parent_id);
        
        Some(child_id)
    }
    
    /// Get blocks sorted by priority
    pub fn get_priority_queue(&self) -> Vec<&ManagedGqr> {
        let mut blocks: Vec<_> = self.blocks.values().collect();
        blocks.sort_by(|a, b| b.priority.cmp(&a.priority));
        blocks
    }
    
    /// Get statistics
    pub fn get_stats(&self) -> GqrStats {
        let mut stats = GqrStats::default();
        
        for block in self.blocks.values() {
            stats.total += 1;
            match block.state {
                GqrState::Static => stats.static_count += 1,
                GqrState::Pending => stats.pending_count += 1,
                GqrState::Ratified => stats.ratified_count += 1,
                GqrState::Executing => stats.executing_count += 1,
                GqrState::Corrupted => stats.corrupted_count += 1,
            }
        }
        
        stats
    }
    
    /// Check for position conflicts
    pub fn check_conflict(&self, x: u32, y: u32, size: u32) -> bool {
        for block in self.blocks.values() {
            let bx = block.position[0];
            let by = block.position[1];
            let bs = block.size;
            
            // Check overlap
            if x < bx + bs && x + size > bx && y < by + bs && y + size > by {
                return true;
            }
        }
        false
    }
    
    /// Find next available position
    pub fn find_available_position(&self, size: u32) -> [u32; 2] {
        for y in (0..self.fb_height - size).step_by(size as usize + 1) {
            for x in (0..self.fb_width - size).step_by(size as usize + 1) {
                if !self.check_conflict(x, y, size) {
                    return [x, y];
                }
            }
        }
        [0, 0] // Fallback
    }
}

/// GQR statistics
#[derive(Debug, Default)]
pub struct GqrStats {
    pub total: usize,
    pub static_count: usize,
    pub pending_count: usize,
    pub ratified_count: usize,
    pub executing_count: usize,
    pub corrupted_count: usize,
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_store_and_fetch() {
        let mut manager = GqrManager::new(576, 576);
        
        let id = manager.store(
            GqrIntent::ContractProposal,
            [10, 10],
            vec!['T', 'E', 'S', 'T'],
            5,
        );
        
        assert!(id > 0);
        
        let block = manager.fetch(id);
        assert!(block.is_some());
        assert_eq!(block.unwrap().state, GqrState::Pending);
    }
    
    #[test]
    fn test_ratify_and_execute() {
        let mut manager = GqrManager::new(576, 576);
        
        let id = manager.store(
            GqrIntent::ExecutiveOrder,
            [20, 20],
            vec!['O', 'P', 'T'],
            10,
        );
        
        // Ratify
        assert!(manager.ratify(id));
        let block = manager.fetch(id).unwrap();
        assert_eq!(block.state, GqrState::Ratified);
        
        // Execute
        assert!(manager.execute(id));
        let block = manager.fetch(id).unwrap();
        assert_eq!(block.state, GqrState::Executing);
        
        // Complete
        assert!(manager.complete(id));
        let block = manager.fetch(id).unwrap();
        assert_eq!(block.state, GqrState::Static);
    }
    
    #[test]
    fn test_find_pending() {
        let mut manager = GqrManager::new(576, 576);
        
        manager.store(GqrIntent::ContractProposal, [10, 10], vec!['A'], 5);
        manager.store(GqrIntent::ContractProposal, [20, 10], vec!['B'], 5);
        
        let pending = manager.find_pending();
        assert_eq!(pending.len(), 2);
    }
}

// Demo: GQR Manager lifecycle
fn main() {
    println!("📚 GQR Manager - The Librarian");
    println!("================================\n");
    
    let mut manager = GqrManager::new(576, 576);
    
    // Store some blocks
    println!("Storing blocks:");
    let id1 = manager.store(
        GqrIntent::ContractProposal,
        [10, 10],
        vec!['O', 'P', 'T', 'I', 'M', 'I', 'Z', 'E'],
        8,
    );
    
    let id2 = manager.store(
        GqrIntent::ExecutiveOrder,
        [20, 10],
        vec!['B', 'O', 'O', 'S', 'T'],
        10,
    );
    
    let id3 = manager.store(
        GqrIntent::DataConstant,
        [30, 10],
        vec!['D', 'A', 'T', 'A'],
        5,
    );
    
    println!("\nFinding pending blocks:");
    let pending = manager.find_pending();
    for block in &pending {
        let payload: String = block.payload.iter().collect();
        println!("  [{}] {:?} at ({}, {}) - '{}'", 
            block.id, block.intent, block.position[0], block.position[1], payload);
    }
    
    println!("\nRatifying block {}...", id1);
    manager.ratify(id1);
    
    println!("Executing block {}...", id1);
    manager.execute(id1);
    
    println!("\nStatistics:");
    let stats = manager.get_stats();
    println!("  Total: {}", stats.total);
    println!("  Pending: {}", stats.pending_count);
    println!("  Ratified: {}", stats.ratified_count);
    println!("  Executing: {}", stats.executing_count);
    println!("  Static: {}", stats.static_count);
    
    println!("\nArchiving block {}...", id3);
    manager.archive(id3);
    
    println!("\n✅ Librarian operational");
}
