//! Geometric Zone Entity
//!
//! A GeometricZone represents a "Geometric Programming" region on the infinite map.
//! It interprets instructions directly from pixels.

use crate::rendering::geometric_interpreter::{GeometricEngine, GeometricInstruction};
use glam::Vec2;

#[derive(Debug, Clone)]
pub struct GeometricZone {
    pub position: Vec2,
    pub name: String,
    pub pixels: Vec<[u8; 4]>,
    pub active: bool,
    pub grid_size: u32,
}

impl GeometricZone {
    pub fn new(position: Vec2, name: String, pixels: Vec<[u8; 4]>, grid_size: u32) -> Self {
        Self {
            position,
            name,
            pixels,
            active: false,
            grid_size,
        }
    }

    /// Run the geometric code once
    pub fn execute(&mut self) -> GeometricEngine {
        let mut engine = GeometricEngine::new();

        // Execute up to 1000 steps or until halted
        for _ in 0..1000 {
            if engine.halted || engine.pc as usize >= self.pixels.len() {
                break;
            }

            let pixel = self.pixels[engine.pc as usize];
            let instr = GeometricInstruction::from(pixel);
            engine.step(instr);
        }

        engine
    }
}
