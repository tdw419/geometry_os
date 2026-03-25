// gqr_decoder.rs -> Neural Kernel GQR Recognition
// 
// Reads GQR blocks from framebuffer using finder pattern detection
// Integrates with neural_kernel.rs for GPU-native recognition

use std::collections::HashMap;

/// GQR Intent types (must match encoder)
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

impl GqrIntent {
    /// Decode intent from color
    pub fn from_color(r: u8, g: u8, b: u8) -> Self {
        match (r, g, b) {
            (100, 100, 255) => GqrIntent::DataConstant,
            (100, 255, 100) => GqrIntent::ProcessorNode,
            (255, 255, 100) => GqrIntent::BusPathway,
            (255, 100, 255) => GqrIntent::ExecutiveOrder,
            (100, 255, 255) => GqrIntent::MemoryArchive,
            (255, 50, 50) => GqrIntent::VetoZone,
            (200, 150, 255) => GqrIntent::ContractProposal,
            _ => GqrIntent::Unknown,
        }
    }
    
    /// Convert to glyph for L1 layer
    pub fn to_glyph(&self) -> char {
        match self {
            GqrIntent::DataConstant => 'D',
            GqrIntent::ProcessorNode => 'P',
            GqrIntent::BusPathway => 'B',
            GqrIntent::ExecutiveOrder => 'E',
            GqrIntent::MemoryArchive => 'M',
            GqrIntent::VetoZone => 'X',
            GqrIntent::ContractProposal => 'C',
            GqrIntent::Unknown => '?',
        }
    }
}

/// Detected GQR block in framebuffer
#[derive(Debug, Clone)]
pub struct DetectedGqr {
    /// Intent type
    pub intent: GqrIntent,
    /// Position (top-left corner)
    pub position: [u32; 2],
    /// Size (3x3, 5x5, etc)
    pub size: u32,
    /// Decoded payload
    pub payload: Vec<char>,
    /// Parity valid?
    pub parity_valid: bool,
    /// Confidence score (0.0-1.0)
    pub confidence: f32,
}

/// GQR Decoder - Reads GQR blocks from framebuffer
pub struct GqrDecoder {
    /// Framebuffer dimensions
    fb_width: u32,
    fb_height: u32,
    /// Minimum finder pattern match threshold
    match_threshold: f32,
}

impl GqrDecoder {
    /// Create new decoder for given framebuffer size
    pub fn new(fb_width: u32, fb_height: u32) -> Self {
        Self {
            fb_width,
            fb_height,
            match_threshold: 0.8, // 80% match required
        }
    }
    
    /// Scan framebuffer for GQR blocks
    pub fn scan(&self, fb: &[u8]) -> Vec<DetectedGqr> {
        let mut detected = Vec::new();
        
        // Scan for 3x3 finder patterns
        for y in 0..(self.fb_height - 2) {
            for x in 0..(self.fb_width - 2) {
                if let Some(block) = self.detect_at(fb, x, y) {
                    detected.push(block);
                }
            }
        }
        
        // Remove overlapping detections (keep highest confidence)
        detected.sort_by(|a, b| b.confidence.partial_cmp(&a.confidence).unwrap());
        
        let mut unique: Vec<DetectedGqr> = Vec::new();
        for block in detected {
            let overlaps = unique.iter().any(|existing| {
                let dx = (block.position[0] as i32 - existing.position[0] as i32).abs();
                let dy = (block.position[1] as i32 - existing.position[1] as i32).abs();
                dx < existing.size as i32 && dy < existing.size as i32
            });
            
            if !overlaps {
                unique.push(block);
            }
        }
        
        unique
    }
    
    /// Detect GQR block at specific position
    fn detect_at(&self, fb: &[u8], x: u32, y: u32) -> Option<DetectedGqr> {
        let x = x as usize;
        let y = y as usize;
        let w = self.fb_width as usize;
        
        // Read 3x3 region
        let mut pixels = [[0u8; 4]; 9];
        for dy in 0..3 {
            for dx in 0..3 {
                let idx = ((y + dy) * w + (x + dx)) * 4;
                if idx + 3 < fb.len() {
                    let i = dy * 3 + dx;
                    pixels[i] = [fb[idx], fb[idx+1], fb[idx+2], fb[idx+3]];
                }
            }
        }
        
        // Check for finder pattern: hollow frame (edges filled, center empty)
        if !self.is_finder_pattern(&pixels) {
            return None;
        }
        
        // Decode intent from corner color
        let intent = GqrIntent::from_color(pixels[0][0], pixels[0][1], pixels[0][2]);
        if intent == GqrIntent::Unknown {
            return None;
        }
        
        // Decode payload from center
        let payload = self.decode_payload(&pixels);
        
        // Verify parity
        let parity_valid = self.verify_parity(&pixels);
        
        // Calculate confidence
        let confidence = self.calculate_confidence(&pixels, &intent);
        
        Some(DetectedGqr {
            intent,
            position: [x as u32, y as u32],
            size: 3,
            payload,
            parity_valid,
            confidence,
        })
    }
    
    /// Check if 3x3 region matches finder pattern (hollow frame)
    fn is_finder_pattern(&self, pixels: &[[u8; 4]; 9]) -> bool {
        // Edges should be filled (non-zero)
        let edges = [0, 1, 2, 3, 5, 6, 7, 8]; // All except center (4)
        let mut edge_sum = 0u32;
        
        for &i in &edges {
            let p = &pixels[i];
            edge_sum += (p[0] as u32) + (p[1] as u32) + (p[2] as u32);
        }
        
        // Center should be relatively dark (payload encoded differently)
        let center = &pixels[4];
        let center_sum = (center[0] as u32) + (center[1] as u32) + (center[2] as u32);
        
        // Finder pattern: edges bright, center can be anything
        edge_sum > 200 && edge_sum > center_sum * 2
    }
    
    /// Decode payload from center pixel
    fn decode_payload(&self, pixels: &[[u8; 4]; 9]) -> Vec<char> {
        let center = &pixels[4];
        
        // For 3x3, payload is single glyph encoded as brightness
        let glyph = center[0] as char; // Use R channel
        
        if glyph.is_ascii() && glyph != '\0' {
            vec![glyph]
        } else {
            vec![]
        }
    }
    
    /// Verify parity from alpha channels
    fn verify_parity(&self, pixels: &[[u8; 4]; 9]) -> bool {
        let p1 = pixels[0][3];     // Top-left
        let p2 = pixels[2][3];     // Top-right
        let p3 = pixels[6][3];     // Bottom-left
        let p4 = pixels[8][3];     // Bottom-right
        
        // Check XOR relationship
        p1 == p3 && p2 == p4 && p1 ^ p2 == 0xFF
    }
    
    /// Calculate confidence score
    fn calculate_confidence(&self, pixels: &[[u8; 4]; 9], intent: &GqrIntent) -> f32 {
        let mut score = 0.0;
        
        // Check color consistency
        let expected = match intent {
            GqrIntent::DataConstant => (100, 100, 255),
            GqrIntent::ProcessorNode => (100, 255, 100),
            GqrIntent::BusPathway => (255, 255, 100),
            GqrIntent::ExecutiveOrder => (255, 100, 255),
            GqrIntent::MemoryArchive => (100, 255, 255),
            GqrIntent::VetoZone => (255, 50, 50),
            GqrIntent::ContractProposal => (200, 150, 255),
            GqrIntent::Unknown => (0, 0, 0),
        };
        
        let mut color_matches = 0;
        for p in pixels.iter().take(9) {
            let dr = (p[0] as i32 - expected.0 as i32).abs();
            let dg = (p[1] as i32 - expected.1 as i32).abs();
            let db = (p[2] as i32 - expected.2 as i32).abs();
            
            if dr < 30 && dg < 30 && db < 30 {
                color_matches += 1;
            }
        }
        
        score += (color_matches as f32 / 9.0) * 0.5;
        
        // Check parity validity
        if self.verify_parity(pixels) {
            score += 0.3;
        }
        
        // Check finder pattern strength
        if self.is_finder_pattern(pixels) {
            score += 0.2;
        }
        
        score.min(1.0)
    }
    
    /// Read GQR block payload at known position
    pub fn read_at(&self, fb: &[u8], x: u32, y: u32, size: u32) -> Option<Vec<char>> {
        let x = x as usize;
        let y = y as usize;
        let s = size as usize;
        let w = self.fb_width as usize;
        
        let mut payload = Vec::new();
        
        // For 3x3, read center
        if s == 3 {
            let idx = ((y + 1) * w + (x + 1)) * 4;
            if idx + 3 < fb.len() {
                let glyph = fb[idx] as char;
                if glyph.is_ascii() && glyph != '\0' {
                    payload.push(glyph);
                }
            }
        } else {
            // For larger blocks, read interior
            for dy in 1..(s-1) {
                for dx in 1..(s-1) {
                    let idx = ((y + dy) * w + (x + dx)) * 4;
                    if idx + 3 < fb.len() {
                        let glyph = fb[idx] as char;
                        if glyph.is_ascii() && glyph != '\0' {
                            payload.push(glyph);
                        }
                    }
                }
            }
        }
        
        if payload.is_empty() {
            None
        } else {
            Some(payload)
        }
    }
    
    /// Find all GQR blocks of a specific intent
    pub fn find_by_intent(&self, fb: &[u8], intent: GqrIntent) -> Vec<DetectedGqr> {
        self.scan(fb)
            .into_iter()
            .filter(|b| b.intent == intent)
            .collect()
    }
    
    /// Find all contract proposals (for ratification workflow)
    pub fn find_contracts(&self, fb: &[u8]) -> Vec<DetectedGqr> {
        self.find_by_intent(fb, GqrIntent::ContractProposal)
    }
    
    /// Find all executive orders
    pub fn find_executive_orders(&self, fb: &[u8]) -> Vec<DetectedGqr> {
        self.find_by_intent(fb, GqrIntent::ExecutiveOrder)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    fn create_test_fb_with_gqr() -> Vec<u8> {
        let mut fb = vec![0u8; 9 * 9 * 4];
        let w = 9;
        
        // Draw a 3x3 GQR at (0, 0) - ProcessorNode (green)
        for y in 0..3 {
            for x in 0..3 {
                let idx = (y * w + x) * 4;
                if x == 1 && y == 1 {
                    // Center: payload 'P'
                    fb[idx] = 'P' as u8;
                    fb[idx+1] = 'P' as u8;
                    fb[idx+2] = 'P' as u8;
                    fb[idx+3] = 255;
                } else {
                    // Edge: green finder pattern
                    fb[idx] = 100;
                    fb[idx+1] = 255;
                    fb[idx+2] = 100;
                    fb[idx+3] = if (x == 0 && y == 0) || (x == 0 && y == 2) { 0x50 } else { 0xAF };
                }
            }
        }
        
        fb
    }
    
    #[test]
    fn test_gqr_scan() {
        let fb = create_test_fb_with_gqr();
        let decoder = GqrDecoder::new(9, 9);
        
        let detected = decoder.scan(&fb);
        
        assert!(!detected.is_empty());
        let block = &detected[0];
        assert_eq!(block.intent, GqrIntent::ProcessorNode);
        assert_eq!(block.position, [0, 0]);
        assert_eq!(block.size, 3);
    }
    
    #[test]
    fn test_gqr_find_by_intent() {
        let fb = create_test_fb_with_gqr();
        let decoder = GqrDecoder::new(9, 9);
        
        let found = decoder.find_by_intent(&fb, GqrIntent::ProcessorNode);
        assert_eq!(found.len(), 1);
        
        let not_found = decoder.find_by_intent(&fb, GqrIntent::DataConstant);
        assert!(not_found.is_empty());
    }
    
    #[test]
    fn test_gqr_intent_from_color() {
        assert_eq!(
            GqrIntent::from_color(100, 100, 255),
            GqrIntent::DataConstant
        );
        assert_eq!(
            GqrIntent::from_color(255, 100, 255),
            GqrIntent::ExecutiveOrder
        );
        assert_eq!(
            GqrIntent::from_color(0, 0, 0),
            GqrIntent::Unknown
        );
    }
}

// Demo: Scan and decode GQR blocks
fn main() {
    println!("🔍 GQR Decoder - Neural Kernel Recognition");
    println!("==========================================\n");
    
    // Create test framebuffer with GQR blocks
    let mut fb = vec![0u8; 576 * 576 * 4];
    
    // Manually paint some GQR blocks
    let w = 576;
    
    // Block 1: DataConstant at (10, 10)
    for y in 0..3 {
        for x in 0..3 {
            let idx = ((10 + y) * w + (10 + x)) * 4;
            if x == 1 && y == 1 {
                fb[idx] = 'D' as u8;
                fb[idx+1] = 'D' as u8;
                fb[idx+2] = 'D' as u8;
                fb[idx+3] = 255;
            } else {
                fb[idx] = 100;
                fb[idx+1] = 100;
                fb[idx+2] = 255;
                fb[idx+3] = 0x50;
            }
        }
    }
    
    // Block 2: ProcessorNode at (20, 10)
    for y in 0..3 {
        for x in 0..3 {
            let idx = ((10 + y) * w + (20 + x)) * 4;
            if x == 1 && y == 1 {
                fb[idx] = 'P' as u8;
                fb[idx+1] = 'P' as u8;
                fb[idx+2] = 'P' as u8;
                fb[idx+3] = 255;
            } else {
                fb[idx] = 100;
                fb[idx+1] = 255;
                fb[idx+2] = 100;
                fb[idx+3] = 0x50;
            }
        }
    }
    
    // Block 3: ContractProposal at (30, 10)
    for y in 0..3 {
        for x in 0..3 {
            let idx = ((10 + y) * w + (30 + x)) * 4;
            if x == 1 && y == 1 {
                fb[idx] = 'C' as u8;
                fb[idx+1] = 'C' as u8;
                fb[idx+2] = 'C' as u8;
                fb[idx+3] = 255;
            } else {
                fb[idx] = 200;
                fb[idx+1] = 150;
                fb[idx+2] = 255;
                fb[idx+3] = 0x50;
            }
        }
    }
    
    // Scan for GQR blocks
    let decoder = GqrDecoder::new(576, 576);
    let detected = decoder.scan(&fb);
    
    println!("Detected {} GQR blocks:\n", detected.len());
    for (i, block) in detected.iter().enumerate() {
        println!(
            "  [{}] {:?} at ({}, {}) - payload: {:?} - confidence: {:.2}",
            i,
            block.intent,
            block.position[0],
            block.position[1],
            block.payload,
            block.confidence
        );
    }
    
    // Find contracts
    println!("\nContract proposals:");
    let contracts = decoder.find_contracts(&fb);
    for contract in &contracts {
        println!("  - {:?} awaiting ratification", contract.payload);
    }
    
    // Find executive orders
    println!("\nExecutive orders:");
    let orders = decoder.find_executive_orders(&fb);
    if orders.is_empty() {
        println!("  (none)");
    } else {
        for order in &orders {
            println!("  - {:?}", order.payload);
        }
    }
    
    println!("\n✅ GQR Decoder operational");
}
