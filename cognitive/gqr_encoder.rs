// gqr_encoder.rs -> Geometry QR: Spatial File System
// 
// GQR Protocol v1.0:
// - 3x3 "Finder Patterns" (hollow frames) at corners
// - Semantic payload in center
// - Parity shimmer for integrity
// - GPU-native, one-cycle recognition

use std::collections::HashMap;

/// GQR Block Types - What kind of logic is sealed
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GqrIntent {
    /// Immutable data constant
    DataConstant,
    /// Active computation zone
    ProcessorNode,
    /// High-speed data corridor
    BusPathway,
    /// Executive directive (priority boost)
    ExecutiveOrder,
    /// Memory archive (long-term storage)
    MemoryArchive,
    /// Veto pattern (inhibition zone)
    VetoZone,
    /// Contract proposal (requires ratification)
    ContractProposal,
}

impl GqrIntent {
    /// Convert intent to semantic glyph (L1 alphabet)
    pub fn to_glyph(&self) -> char {
        match self {
            GqrIntent::DataConstant => 'D',
            GqrIntent::ProcessorNode => 'P',
            GqrIntent::BusPathway => 'B',
            GqrIntent::ExecutiveOrder => 'E',
            GqrIntent::MemoryArchive => 'M',
            GqrIntent::VetoZone => 'X',
            GqrIntent::ContractProposal => 'C',
        }
    }
    
    /// Metadata encoding (version, security, priority)
    pub fn default_metadata(&self) -> u32 {
        match self {
            GqrIntent::DataConstant => 0x0001_0001, // v1, sec=1, pri=0
            GqrIntent::ProcessorNode => 0x0001_0002, // v1, sec=1, pri=2
            GqrIntent::BusPathway => 0x0001_0001,
            GqrIntent::ExecutiveOrder => 0x0001_000F, // v1, sec=1, pri=15
            GqrIntent::MemoryArchive => 0x0002_0001, // v2, sec=1
            GqrIntent::VetoZone => 0x0001_0010, // v1, pri=16
            GqrIntent::ContractProposal => 0x0003_0008, // v3, pri=8
        }
    }
}

/// GQR Block - A sealed logic unit in the framebuffer
#[derive(Debug, Clone)]
pub struct GqrBlock {
    /// Intent type (what this block does)
    pub intent: GqrIntent,
    /// Metadata (version, security, priority)
    pub metadata: u32,
    /// Semantic payload (glyph data)
    pub payload: Vec<char>,
    /// Position in framebuffer (top-left corner)
    pub position: [u32; 2],
    /// Size (default 3x3, can expand)
    pub size: u32,
}

impl GqrBlock {
    /// Create new GQR block with default metadata
    pub fn new(intent: GqrIntent, position: [u32; 2]) -> Self {
        Self {
            intent,
            metadata: intent.default_metadata(),
            payload: vec![intent.to_glyph()],
            position,
            size: 3, // Default 3x3
        }
    }
    
    /// Create GQR block with custom payload
    pub fn with_payload(intent: GqrIntent, position: [u32; 2], payload: Vec<char>) -> Self {
        let size = ((payload.len() as f32).sqrt().ceil() as u32).max(3);
        Self {
            intent,
            metadata: intent.default_metadata(),
            payload,
            position,
            size,
        }
    }
    
    /// Render GQR to framebuffer pixel grid
    /// Returns RGBA pixels (u8 per channel)
    pub fn render(&self) -> Vec<Vec<[u8; 4]>> {
        let mut grid = vec![vec![[0u8; 4]; self.size as usize]; self.size as usize];
        
        // 1. Draw Finder Patterns (corners)
        self.draw_finder_patterns(&mut grid);
        
        // 2. Encode payload in center
        self.draw_payload(&mut grid);
        
        // 3. Apply parity shimmer (integrity check)
        self.apply_parity_shimmer(&mut grid);
        
        grid
    }
    
    /// Draw 3x3 hollow frame finder patterns at corners
    fn draw_finder_patterns(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        
        // Finder pattern colors by intent
        let (r, g, b) = match self.intent {
            GqrIntent::DataConstant => (100, 100, 255),     // Blue
            GqrIntent::ProcessorNode => (100, 255, 100),    // Green
            GqrIntent::BusPathway => (255, 255, 100),       // Yellow
            GqrIntent::ExecutiveOrder => (255, 100, 255),   // Magenta
            GqrIntent::MemoryArchive => (100, 255, 255),    // Cyan
            GqrIntent::VetoZone => (255, 50, 50),           // Red
            GqrIntent::ContractProposal => (200, 150, 255), // Purple
        };
        
        // Top-left finder (always present)
        if s >= 3 {
            // Hollow frame: corners and edges, center empty
            grid[0][0] = [r, g, b, 255]; // Top-left
            grid[0][2] = [r, g, b, 255]; // Top-right
            grid[2][0] = [r, g, b, 255]; // Bottom-left
            grid[2][2] = [r, g, b, 255]; // Bottom-right
            grid[0][1] = [r, g, b, 255]; // Top edge
            grid[2][1] = [r, g, b, 255]; // Bottom edge
            grid[1][0] = [r, g, b, 255]; // Left edge
            grid[1][2] = [r, g, b, 255]; // Right edge
            // Center (1,1) stays empty - this is the "hollow"
        }
        
        // For larger blocks, add corner finders
        if s >= 5 {
            // Top-right finder
            let tr = s - 3;
            grid[0][tr] = [r, g, b, 255];
            grid[0][tr+2] = [r, g, b, 255];
            grid[2][tr] = [r, g, b, 255];
            grid[2][tr+2] = [r, g, b, 255];
            
            // Bottom-left finder
            let bl = s - 3;
            grid[bl][0] = [r, g, b, 255];
            grid[bl][2] = [r, g, b, 255];
            grid[bl+2][0] = [r, g, b, 255];
            grid[bl+2][2] = [r, g, b, 255];
            
            // Bottom-right finder
            grid[bl][tr] = [r, g, b, 255];
            grid[bl][tr+2] = [r, g, b, 255];
            grid[bl+2][tr] = [r, g, b, 255];
            grid[bl+2][tr+2] = [r, g, b, 255];
        }
    }
    
    /// Encode semantic payload into center pixels
    fn draw_payload(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        let center = s / 2;
        
        // For 3x3, payload goes in center
        if s == 3 && !self.payload.is_empty() {
            let glyph = self.payload[0] as u8;
            // Encode glyph as brightness in center pixel
            grid[1][1] = [glyph, glyph, glyph, 255];
        } else {
            // For larger blocks, fill payload row by row
            let mut idx = 0;
            for y in 1..(s-1) {
                for x in 1..(s-1) {
                    if idx < self.payload.len() {
                        let glyph = self.payload[idx] as u8;
                        grid[y][x] = [glyph, glyph, glyph, 255];
                        idx += 1;
                    }
                }
            }
        }
    }
    
    /// Apply parity shimmer - visual checksum for integrity
    fn apply_parity_shimmer(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        
        // XOR all payload values
        let mut parity: u8 = 0;
        for ch in &self.payload {
            parity ^= (*ch as u8);
        }
        
        // Encode parity in corner pixels' alpha channel
        // (doesn't affect visual appearance, but readable by decoder)
        if s >= 3 {
            grid[0][0][3] = parity; // Top-left alpha
            grid[0][s-1][3] = parity ^ 0xFF; // Top-right alpha (inverted)
            grid[s-1][0][3] = parity; // Bottom-left alpha
            grid[s-1][s-1][3] = parity ^ 0xFF; // Bottom-right alpha (inverted)
        }
    }
    
    /// Verify parity (integrity check)
    pub fn verify_parity(&self, grid: &Vec<Vec<[u8; 4]>>) -> bool {
        let s = self.size as usize;
        if s < 3 {
            return false;
        }
        
        // Read parity from corners
        let p1 = grid[0][0][3];
        let p2 = grid[0][s-1][3];
        let p3 = grid[s-1][0][3];
        let p4 = grid[s-1][s-1][3];
        
        // Check XOR relationship
        p1 == p3 && p2 == p4 && p1 ^ p2 == 0xFF
    }
}

/// GQR Encoder - Manages GQR blocks in framebuffer
pub struct GqrEncoder {
    /// Active GQR blocks
    blocks: Vec<GqrBlock>,
    /// Framebuffer dimensions
    fb_width: u32,
    fb_height: u32,
}

impl GqrEncoder {
    /// Create new GQR encoder for given framebuffer size
    pub fn new(fb_width: u32, fb_height: u32) -> Self {
        Self {
            blocks: Vec::new(),
            fb_width,
            fb_height,
        }
    }
    
    /// Seal a new GQR block into the framebuffer
    pub fn seal(&mut self, intent: GqrIntent, position: [u32; 2]) -> usize {
        let block = GqrBlock::new(intent, position);
        self.blocks.push(block);
        self.blocks.len() - 1
    }
    
    /// Seal a GQR block with custom payload
    pub fn seal_with_payload(
        &mut self,
        intent: GqrIntent,
        position: [u32; 2],
        payload: Vec<char>,
    ) -> usize {
        let block = GqrBlock::with_payload(intent, position, payload);
        self.blocks.push(block);
        self.blocks.len() - 1
    }
    
    /// Render all GQR blocks to framebuffer
    pub fn render_to_framebuffer(&self, fb: &mut Vec<u8>) {
        for block in &self.blocks {
            let grid = block.render();
            let x0 = block.position[0] as usize;
            let y0 = block.position[1] as usize;
            
            for (y, row) in grid.iter().enumerate() {
                for (x, pixel) in row.iter().enumerate() {
                    let fb_x = x0 + x;
                    let fb_y = y0 + y;
                    
                    if fb_x < self.fb_width as usize && fb_y < self.fb_height as usize {
                        let idx = (fb_y * self.fb_width as usize + fb_x) * 4;
                        if idx + 3 < fb.len() {
                            fb[idx] = pixel[0];
                            fb[idx + 1] = pixel[1];
                            fb[idx + 2] = pixel[2];
                            fb[idx + 3] = pixel[3];
                        }
                    }
                }
            }
        }
    }
    
    /// Find GQR block by position
    pub fn find_at(&self, x: u32, y: u32) -> Option<&GqrBlock> {
        self.blocks.iter().find(|b| {
            let bx = b.position[0];
            let by = b.position[1];
            let s = b.size;
            x >= bx && x < bx + s && y >= by && y < by + s
        })
    }
    
    /// Scramble a GQR block (veto action)
    pub fn scramble(&mut self, index: usize) -> bool {
        if index < self.blocks.len() {
            // Mark as vetoed by changing intent
            self.blocks[index].intent = GqrIntent::VetoZone;
            self.blocks[index].metadata = GqrIntent::VetoZone.default_metadata();
            true
        } else {
            false
        }
    }
    
    /// List all sealed blocks
    pub fn list(&self) -> &Vec<GqrBlock> {
        &self.blocks
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_gqr_block_creation() {
        let block = GqrBlock::new(GqrIntent::DataConstant, [10, 10]);
        assert_eq!(block.size, 3);
        assert_eq!(block.intent, GqrIntent::DataConstant);
    }
    
    #[test]
    fn test_gqr_render() {
        let block = GqrBlock::new(GqrIntent::ProcessorNode, [0, 0]);
        let grid = block.render();
        
        // Check size
        assert_eq!(grid.len(), 3);
        assert_eq!(grid[0].len(), 3);
        
        // Check finder pattern (corners should be green)
        assert_eq!(grid[0][0][1], 255); // Green channel
        assert_eq!(grid[0][2][1], 255);
        assert_eq!(grid[2][0][1], 255);
        assert_eq!(grid[2][2][1], 255);
    }
    
    #[test]
    fn test_gqr_parity() {
        let block = GqrBlock::new(GqrIntent::DataConstant, [0, 0]);
        let grid = block.render();
        
        assert!(block.verify_parity(&grid));
    }
    
    #[test]
    fn test_gqr_encoder() {
        let mut encoder = GqrEncoder::new(640, 480);
        
        let idx1 = encoder.seal(GqrIntent::DataConstant, [10, 10]);
        let idx2 = encoder.seal(GqrIntent::ProcessorNode, [20, 20]);
        
        assert_eq!(idx1, 0);
        assert_eq!(idx2, 1);
        assert_eq!(encoder.list().len(), 2);
    }
    
    #[test]
    fn test_gqr_find_at() {
        let mut encoder = GqrEncoder::new(640, 480);
        encoder.seal(GqrIntent::DataConstant, [10, 10]);
        
        let found = encoder.find_at(11, 11);
        assert!(found.is_some());
        
        let not_found = encoder.find_at(100, 100);
        assert!(not_found.is_none());
    }
}

// Demo: Seal and render GQR blocks
fn main() {
    println!("🧬 GQR Encoder - Spatial File System");
    println!("=====================================\n");
    
    let mut encoder = GqrEncoder::new(576, 576);
    
    // Seal various GQR blocks
    println!("Sealing GQR blocks:");
    
    let idx1 = encoder.seal(GqrIntent::DataConstant, [10, 10]);
    println!("  [{}] DataConstant at (10, 10)", idx1);
    
    let idx2 = encoder.seal(GqrIntent::ProcessorNode, [20, 10]);
    println!("  [{}] ProcessorNode at (20, 10)", idx2);
    
    let idx3 = encoder.seal_with_payload(
        GqrIntent::ContractProposal,
        [30, 10],
        vec!['R', 'A', 'T', 'I', 'F', 'Y'],
    );
    println!("  [{}] ContractProposal at (30, 10) - 'RATIFY'", idx3);
    
    let idx4 = encoder.seal(GqrIntent::ExecutiveOrder, [10, 20]);
    println!("  [{}] ExecutiveOrder at (10, 20)", idx4);
    
    let idx5 = encoder.seal(GqrIntent::MemoryArchive, [20, 20]);
    println!("  [{}] MemoryArchive at (20, 20)", idx5);
    
    println!("\nTotal blocks sealed: {}", encoder.list().len());
    
    // Render to framebuffer
    let mut fb = vec![0u8; 576 * 576 * 4];
    encoder.render_to_framebuffer(&mut fb);
    println!("Rendered to 576x576 framebuffer");
    
    // Test finding
    if let Some(block) = encoder.find_at(11, 11) {
        println!("\nFound block at (11, 11): {:?}", block.intent);
    }
    
    // Test veto (scramble)
    println!("\nVetoing block [1]...");
    encoder.scramble(1);
    if let Some(block) = encoder.find_at(21, 11) {
        println!("  Block [1] is now: {:?}", block.intent);
    }
    
    println!("\n✅ GQR Protocol v1.0 operational");
}
