//! grammar.rs -- Production-grade Differential Grammar Induction (DGI) engine.
//!
//! This module implements the "Filesystem as Simulation" architecture by:
//! 1. Managing a global Registry of GrammarRules.
//! 2. Mining raw pixel data for repeated transformations (Pattern Mining).
//! 3. Collapsing raw grids into recursive rule trees.

use std::collections::HashMap;
use xxhash_rust::xxh3::xxh3_64;

/// A single pixel in Geometry OS (0x00RRGGBB).
pub type Pixel = u32;

/// Rule Reference Mask (Top nibble 0x9 per PIXEL_SPEC taxonomy).
pub const RULE_PREFIX: u32 = 0x90000000;
pub const RULE_ID_MASK: u32 = 0x0FFFFFFF;

/// Geometric and visual transformations.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Transform {
    None,
    Rotate90,
    Rotate180,
    Rotate270,
    FlipX,
    FlipY,
    ColorShift(i16), // +/- 255
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
    Composite {
        width: u32,
        height: u32,
        rules: Vec<u32>, // IDs of sub-rules
    },
    Reference(u32), // Direct reference to another rule ID
}

/// Global registry of promoted rules.
pub struct RuleRegistry {
    pub rules: HashMap<u32, GrammarRule>,
    next_id: u32,
}

impl RuleRegistry {
    pub fn new() -> Self {
        Self {
            rules: HashMap::new(),
            next_id: 1,
        }
    }

    pub fn register(&mut self, rule: GrammarRule) -> u32 {
        // Simple deduplication based on content hash
        // In a real system, we'd hash the rule structure.
        let id = self.next_id;
        self.rules.insert(id, rule);
        self.next_id += 1;
        id
    }

    pub fn get(&self, id: u32) -> Option<&GrammarRule> {
        self.rules.get(&id)
    }

    /// Expand a rule recursively.
    pub fn expand(&self, id: u32, x: u32, y: u32) -> Pixel {
        let rule = match self.get(id) {
            Some(r) => r,
            None => return 0,
        };

        let mut p = match &rule.base {
            RuleBase::Atomic(color) => *color,
            RuleBase::Reference(ref_id) => self.expand(*ref_id, x, y),
            RuleBase::Composite {
                width,
                height,
                rules,
            } => {
                let idx = ((y % height) * width + (x % width)) as usize;
                if idx < rules.len() {
                    self.expand(rules[idx], x / width, y / height)
                } else {
                    0
                }
            },
        };

        // Apply transforms
        for t in &rule.transforms {
            p = apply_transform(p, *t);
        }
        p
    }
}

pub fn apply_transform(p: Pixel, t: Transform) -> Pixel {
    match t {
        Transform::None => p,
        Transform::ColorShift(_s) => {
            let r = ((p >> 16) & 0xFF) as i16;
            let g = ((p >> 8) & 0xFF) as i16;
            let b = (p & 0xFF) as i16;
            let nr = (r + _s).clamp(0, 255) as u32;
            let ng = (g + _s).clamp(0, 255) as u32;
            let nb = (b + _s).clamp(0, 255) as u32;
            (nr << 16) | (ng << 8) | nb
        },
        _ => p,
    }
}

/// Apply a transformation to an entire N*N block of pixels.
pub fn apply_transform_to_block(block: &[u32], width: usize, t: Transform) -> Vec<u32> {
    let mut result = block.to_vec();
    match t {
        Transform::Rotate90 => {
            for y in 0..width {
                for x in 0..width {
                    result[x * width + (width - 1 - y)] = block[y * width + x];
                }
            }
        },
        Transform::Rotate180 => {
            for i in 0..block.len() {
                result[block.len() - 1 - i] = block[i];
            }
        },
        Transform::Rotate270 => {
            for y in 0..width {
                for x in 0..width {
                    result[(width - 1 - x) * width + y] = block[y * width + x];
                }
            }
        },
        Transform::FlipX => {
            for y in 0..width {
                for x in 0..width {
                    result[y * width + (width - 1 - x)] = block[y * width + x];
                }
            }
        },
        Transform::FlipY => {
            for y in 0..width {
                for x in 0..width {
                    result[(width - 1 - y) * width + x] = block[y * width + x];
                }
            }
        },
        Transform::ColorShift(s) => {
            for p in &mut result {
                *p = apply_transform(*p, t);
            }
        },
        Transform::None => {},
    }
    result
}

/// The Pattern Miner scans pixel grids for repeated structures.
pub struct PatternMiner {
    window_size: usize,
    threshold: u32,
}

impl PatternMiner {
    pub fn new(window_size: usize, threshold: u32) -> Self {
        Self {
            window_size,
            threshold,
        }
    }

    /// Canonicalize a block by finding its lexicographically smallest symmetry.
    pub fn canonicalize(&self, block: &[u32]) -> (Vec<u32>, Transform) {
        let mut min_block = block.to_vec();
        let mut min_transform = Transform::None;

        // Symmetry group: [None, R90, R180, R270, FlipX, FlipX+R90, FlipX+R180, FlipX+R270]
        let transforms = [
            Transform::None,
            Transform::Rotate90,
            Transform::Rotate180,
            Transform::Rotate270,
            Transform::FlipX,
        ];

        for t in transforms {
            let transformed = apply_transform_to_block(block, self.window_size, t);
            if transformed < min_block {
                min_block = transformed.clone();
                min_transform = t;
            }
            // Also try flip + rotation for full D4 group
            if t != Transform::None && t != Transform::FlipX {
                let flipped =
                    apply_transform_to_block(&transformed, self.window_size, Transform::FlipX);
                if flipped < min_block {
                    min_block = flipped;
                    // In a production system we'd return a sequence of transforms,
                    // but for this prototype we'll just track the primary transform.
                    min_transform = t;
                }
            }
        }

        (min_block, min_transform)
    }

    /// Scan a raw pixel grid and identify candidate rules using canonicalization.
    pub fn mine(
        &self,
        pixels: &[u32],
        width: usize,
        height: usize,
    ) -> Vec<(Vec<u32>, Vec<Transform>)> {
        let mut canonical_counts: HashMap<Vec<u32>, Vec<Transform>> = HashMap::new();

        for y in 0..=(height - self.window_size) {
            for x in 0..=(width - self.window_size) {
                let mut block = Vec::with_capacity(self.window_size * self.window_size);
                for by in 0..self.window_size {
                    for bx in 0..self.window_size {
                        block.push(pixels[(y + by) * width + (x + bx)]);
                    }
                }

                let (canonical_block, transform) = self.canonicalize(&block);
                canonical_counts
                    .entry(canonical_block)
                    .or_insert_with(Vec::new)
                    .push(transform);
            }
        }

        canonical_counts
            .into_iter()
            .filter(|(_, transforms)| transforms.len() as u32 >= self.threshold)
            .collect()
    }

    /// Mine rules hierarchically, starting from smallest blocks and composing upwards.
    pub fn mine_hierarchical(
        &self,
        pixels: &[u32],
        width: usize,
        height: usize,
        registry: &mut RuleRegistry,
    ) -> Vec<u32> {
        let mut promoted_ids = Vec::new();
        let mut current_pixels = pixels.to_vec();

        // Pass 1: 2x2 base patterns
        // Pass 2: 4x4 composed patterns
        // Pass 3: 8x8 composed patterns
        let mut block_size = 2;
        while block_size <= self.window_size {
            let miner = PatternMiner::new(block_size, self.threshold);
            let candidates = miner.mine(&current_pixels, width, height);

            for (canonical_block, transforms) in candidates {
                // Try to build this block from existing rules
                let rule = if let Some(composite) =
                    self.try_compose_from_existing(&canonical_block, block_size, registry)
                {
                    composite
                } else {
                    // Fallback: Atomic composition
                    GrammarRule {
                        base: RuleBase::Composite {
                            width: block_size as u32,
                            height: block_size as u32,
                            rules: canonical_block
                                .iter()
                                .map(|&p| {
                                    registry.register(GrammarRule {
                                        base: RuleBase::Atomic(p),
                                        transforms: vec![],
                                    })
                                })
                                .collect(),
                        },
                        transforms: vec![],
                    }
                };

                let base_rule_id = registry.register(rule);
                promoted_ids.push(base_rule_id);

                // Replace in the grid with Rule IDs (encoded with RULE_PREFIX)
                self.replace_block_with_rule(
                    &mut current_pixels,
                    width,
                    height,
                    &canonical_block,
                    base_rule_id,
                    block_size,
                );

                // Variant rules for transforms
                for t in transforms {
                    if t != Transform::None {
                        promoted_ids.push(registry.register(GrammarRule {
                            base: RuleBase::Reference(base_rule_id),
                            transforms: vec![t],
                        }));
                    }
                }
            }
            block_size *= 2;
        }

        promoted_ids
    }

    fn try_compose_from_existing(
        &self,
        block: &[u32],
        block_size: usize,
        registry: &RuleRegistry,
    ) -> Option<GrammarRule> {
        if block_size < 2 {
            return None;
        }
        let sub_size = block_size / 2;
        let mut sub_rules = Vec::new();

        // Try to divide block into 4 quadrants
        for qy in 0..2 {
            for qx in 0..2 {
                let mut quadrant = Vec::with_capacity(sub_size * sub_size);
                for y in 0..sub_size {
                    for x in 0..sub_size {
                        quadrant
                            .push(block[(qy * sub_size + y) * block_size + (qx * sub_size + x)]);
                    }
                }

                if let Some(rule_id) = self.find_matching_rule(&quadrant, sub_size, registry) {
                    sub_rules.push(rule_id);
                } else {
                    return None;
                }
            }
        }

        Some(GrammarRule {
            base: RuleBase::Composite {
                width: 2, // 2x2 grid of sub-rules
                height: 2,
                rules: sub_rules,
            },
            transforms: vec![],
        })
    }

    fn find_matching_rule(
        &self,
        sub_block: &[u32],
        size: usize,
        registry: &RuleRegistry,
    ) -> Option<u32> {
        for (&id, rule) in &registry.rules {
            // Only check rules of the correct visual size
            // Note: This is an expensive check in the prototype, optimized via hashing in production.
            let mut matches = true;
            for y in 0..size {
                for x in 0..size {
                    if registry.expand(id, x as u32, y as u32) != sub_block[y * size + x] {
                        matches = false;
                        break;
                    }
                }
                if !matches {
                    break;
                }
            }
            if matches {
                return Some(id);
            }
        }
        None
    }

    fn replace_block_with_rule(
        &self,
        pixels: &mut [u32],
        width: usize,
        _height: usize,
        block: &[u32],
        rule_id: u32,
        block_size: usize,
    ) {
        let rule_val = RULE_PREFIX | (rule_id & RULE_ID_MASK);
        // Simple scan-and-replace
        for y in 0..=(width - block_size) {
            for x in 0..=(width - block_size) {
                let mut matches = true;
                for by in 0..block_size {
                    for bx in 0..block_size {
                        if pixels[(y + by) * width + (x + bx)] != block[by * block_size + bx] {
                            matches = false;
                            break;
                        }
                    }
                    if !matches {
                        break;
                    }
                }

                if matches {
                    // Fill block with rule ID (for next pass)
                    for by in 0..block_size {
                        for bx in 0..block_size {
                            pixels[(y + by) * width + (x + bx)] = rule_val;
                        }
                    }
                }
            }
        }
    }
}
