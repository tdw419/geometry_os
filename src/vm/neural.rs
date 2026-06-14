//! neural.rs -- Neural Substrate implementation for Geometry OS
//!
//! Implements Opcode 0xB (GENERATIVE) and neural weight interpretation.
//! Pixels in the Neural Zone are treated as: Weight(8) | Bias(8) | Act(8) | Grad(8)

pub struct Perceptron {
    pub weight: i8,
    pub bias: i8,
    pub activation: u8,
    pub gradient: i8,
}

impl Perceptron {
    pub fn from_u32(val: u32) -> Self {
        Self {
            weight: ((val >> 24) & 0xFF) as i8,
            bias: ((val >> 16) & 0xFF) as i8,
            activation: ((val >> 8) & 0xFF) as u8,
            gradient: (val & 0xFF) as i8,
        }
    }

    pub fn to_u32(&self) -> u32 {
        ((self.weight as u32) << 24)
            | ((self.bias as u32) << 16)
            | ((self.activation as u32) << 8)
            | (self.gradient as u32 & 0xFF)
    }
}

pub fn evaluate_node(input: u8, weight: i8, bias: i8) -> u8 {
    let result = (input as i32 * weight as i32) + bias as i32;
    // Simple ReLU-like activation clipped to u8
    if result < 0 {
        0
    } else if result > 255 {
        255
    } else {
        result as u8
    }
}
