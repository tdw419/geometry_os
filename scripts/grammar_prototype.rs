//! scripts/grammar_prototype.rs -- Prototype for Differential Grammar Induction (DGI)
//!
//! This script demonstrates the concept of "Promotion":
//! 1. Identify repeated spatial patterns in a 2D tile map.
//! 2. Generate recursive GrammarRules to describe them.
//! 3. Collapse the data into a "Rule Tree."

use std::collections::{HashMap, HashSet};

/// A single pixel in Geometry OS (0x00RRGGBB).
type Pixel = u32;

/// Geometric and visual transformations.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Transform {
    None,
    Rotate90,
    Rotate180,
    Rotate270,
    FlipX,
    FlipY,
    ColorShift(i32), // Applied to R, G, B channels
}

/// The core unit of the Grammar Stratum.
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct GrammarRule {
    pub base: RuleBase,
    pub transforms: Vec<Transform>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum RuleBase {
    Atomic(Pixel),
    Composite(Vec<GrammarRule>), // A 2D arrangement of other rules
    Reference(u32),             // Reference to another rule by ID
}

pub struct GrammarEngine {
    pub rule_registry: HashMap<u32, GrammarRule>,
    next_id: u32,
}

impl GrammarEngine {
    pub fn new() -> Self {
        Self {
            rule_registry: HashMap::new(),
            next_id: 1,
        }
    }

    pub fn register(&mut self, rule: GrammarRule) -> u32 {
        let id = self.next_id;
        self.rule_registry.insert(id, rule);
        self.next_id += 1;
        id
    }

    /// Expand a rule recursively into a grid of pixels.
    pub fn expand(&self, rule_id: u32) -> Vec<Pixel> {
        let rule = match self.rule_registry.get(&rule_id) {
            Some(r) => r,
            None => return vec![0],
        };

        let mut pixels = match &rule.base {
            RuleBase::Atomic(p) => vec![*p],
            RuleBase::Composite(rules) => {
                let mut result = Vec::new();
                for r in rules {
                    result.append(&mut self.expand_anonymous(r));
                }
                result
            }
            RuleBase::Reference(id) => self.expand(*id),
        };

        // Apply this rule's transforms to the expanded pixels
        for p in &mut pixels {
            for t in &rule.transforms {
                *p = apply_transform(*p, *t);
            }
        }
        pixels
    }

    fn expand_anonymous(&self, rule: &GrammarRule) -> Vec<Pixel> {
        let mut pixels = match &rule.base {
            RuleBase::Atomic(p) => vec![*p],
            RuleBase::Composite(rules) => {
                let mut result = Vec::new();
                for r in rules {
                    result.append(&mut self.expand_anonymous(r));
                }
                result
            }
            RuleBase::Reference(id) => self.expand(*id),
        };

        for p in &mut pixels {
            for t in &rule.transforms {
                *p = apply_transform(*p, *t);
            }
        }
        pixels
    }
}

fn apply_transform(p: Pixel, t: Transform) -> Pixel {
    match t {
        Transform::None => p,
        Transform::ColorShift(s) => {
            let r = ((p >> 16) & 0xFF) as i32;
            let g = ((p >> 8) & 0xFF) as i32;
            let b = (p & 0xFF) as i32;
            let nr = (r + s).clamp(0, 255) as u32;
            let ng = (g + s).clamp(0, 255) as u32;
            let nb = (b + s).clamp(0, 255) as u32;
            (nr << 16) | (ng << 8) | nb
        }
        _ => p, // Rotation/Flip require 2D context, skipped in 1D atomic expansion
    }
}

fn main() {
    println!("--- Geometry OS Grammar Prototype ---");

    let mut engine = GrammarEngine::new();

    // 1. Define an "Atom": A Blue Pixel
    let blue_atom = GrammarRule {
        base: RuleBase::Atomic(0x0000FF),
        transforms: vec![],
    };
    let blue_id = engine.register(blue_atom);

    // 2. Define a "Transformed Atom": A Lighter Blue Pixel
    let light_blue = GrammarRule {
        base: RuleBase::Reference(blue_id),
        transforms: vec![Transform::ColorShift(50)],
    };
    let light_blue_id = engine.register(light_blue);

    // 3. Define a "Pattern": Alternating Blue and Light Blue
    let pattern = GrammarRule {
        base: RuleBase::Composite(vec![
            GrammarRule { base: RuleBase::Reference(blue_id), transforms: vec![] },
            GrammarRule { base: RuleBase::Reference(light_blue_id), transforms: vec![] },
            GrammarRule { base: RuleBase::Reference(blue_id), transforms: vec![] },
            GrammarRule { base: RuleBase::Reference(light_blue_id), transforms: vec![] },
        ]),
        transforms: vec![],
    };
    let pattern_id = engine.register(pattern);

    // 4. Expand and Verify
    let pixels = engine.expand(pattern_id);
    println!("Expanded Pattern Pixels:");
    for (i, p) in pixels.iter().enumerate() {
        println!("  Pixel {}: #{:06X}", i, p);
    }

    println!("\nStorage Efficiency:");
    println!("  Raw Pixels: 4 pixels * 4 bytes = 16 bytes");
    println!("  Grammar Size: ~3 rules (stored as seeds in real GeOS)");
    println!("  Effect: Storage scales with complexity, not quantity.");
}
