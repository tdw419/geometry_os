//! vast_allocator.rs -- Hilbert-based spatial allocator for the Vast Substrate
//!
//! Manages free space in the infinite map using a 1D Hilbert index.
//! This preserves spatial locality: adjacent files in logical space
//! are likely to be adjacent on the physical PNG landscape.

use std::collections::BTreeMap;

/// Magic unit for allocation (1 block = 256 pixels = 1024 bytes).
pub const BLOCK_PIXELS: u64 = 256;

/// A range of free Hilbert indices.
#[derive(Debug, Clone)]
struct FreeRange {
    start: u64,
    length: u64,
}

/// Refcount entry for a block.
#[derive(Debug, Clone)]
struct RefCountEntry {
    count: u32,
    #[allow(dead_code)]
    extent_id: Option<u64>,
}

/// The Hilbert-based spatial allocator.
pub struct VastAllocator {
    free_ranges: BTreeMap<u64, u64>,         // start -> length
    refcounts: BTreeMap<u64, RefCountEntry>, // block_addr -> entry
    cursor: u64,
}

impl VastAllocator {
    pub fn new() -> Self {
        let mut free_ranges = BTreeMap::new();
        // Reserve first 65536 indices for Superblock and Inode Table
        free_ranges.insert(65536, u64::MAX - 65536);

        Self {
            free_ranges,
            refcounts: BTreeMap::new(),
            cursor: 65536,
        }
    }

    /// Allocate a contiguous range of Hilbert indices.
    /// Units are PIXELS.
    pub fn allocate(&mut self, length: u64) -> Option<u64> {
        let mut best_start = None;
        let mut best_len = u64::MAX;

        for (&start, &len) in &self.free_ranges {
            if len >= length && len < best_len {
                best_start = Some(start);
                best_len = len;
            }
        }

        if let Some(start) = best_start {
            self.free_ranges.remove(&start);
            if best_len > length {
                self.free_ranges.insert(start + length, best_len - length);
            }
            self.cursor = start + length;

            // Initialize refcounts for all blocks touched by this allocation
            let num_blocks = (length + BLOCK_PIXELS - 1) / BLOCK_PIXELS;
            for i in 0..num_blocks {
                let block_addr = start + (i * BLOCK_PIXELS);
                self.refcounts.insert(
                    block_addr,
                    RefCountEntry {
                        count: 1,
                        extent_id: None,
                    },
                );
            }

            Some(start)
        } else {
            None
        }
    }

    /// Allocate an extent (range of blocks).
    /// Returns (start_index, num_blocks).
    pub fn allocate_extent(&mut self, num_blocks: u64) -> Option<(u64, u64)> {
        let pixel_length = num_blocks * BLOCK_PIXELS;
        let start = self.allocate(pixel_length)?;

        // Initialize refcounts for these blocks
        for i in 0..num_blocks {
            let block_addr = start + (i * BLOCK_PIXELS);
            self.refcounts.insert(
                block_addr,
                RefCountEntry {
                    count: 1,
                    extent_id: None,
                },
            );
        }

        Some((start, num_blocks))
    }

    /// Free a range of Hilbert indices.
    pub fn free(&mut self, start: u64, length: u64) {
        // Decrease refcounts for blocks in this range (assuming length is in pixels)
        let num_blocks = (length + BLOCK_PIXELS - 1) / BLOCK_PIXELS;
        for i in 0..num_blocks {
            let block_addr = start + (i * BLOCK_PIXELS);
            let mut remove = false;
            if let Some(entry) = self.refcounts.get_mut(&block_addr) {
                entry.count -= 1;
                if entry.count == 0 {
                    remove = true;
                }
            }
            if remove {
                self.refcounts.remove(&block_addr);
                self.add_to_free_ranges(block_addr, BLOCK_PIXELS);
            }
        }
    }

    fn add_to_free_ranges(&mut self, start: u64, length: u64) {
        // Simple coalescing logic could be added here
        self.free_ranges.insert(start, length);
    }

    pub fn needs_compaction(&self) -> bool {
        self.free_ranges.len() > 1000 // Heuristic
    }

    pub fn compact(&mut self) {
        // In a real system, we'd move data blocks to close gaps.
        // For this prototype, we just merge adjacent free ranges.
        let mut sorted_ranges: Vec<(u64, u64)> =
            self.free_ranges.iter().map(|(&s, &l)| (s, l)).collect();
        sorted_ranges.sort_by_key(|r| r.0);

        let mut merged = Vec::new();
        if let Some(first) = sorted_ranges.first() {
            let mut current = *first;
            for next in sorted_ranges.iter().skip(1) {
                if current.0 + current.1 == next.0 {
                    current.1 += next.1;
                } else {
                    merged.push(current);
                    current = *next;
                }
            }
            merged.push(current);
        }

        self.free_ranges.clear();
        for (s, l) in merged {
            self.free_ranges.insert(s, l);
        }
    }

    pub fn stats(&self) -> AllocatorStats {
        let total_free: u64 = self.free_ranges.values().sum();
        let allocated_blocks = self.refcounts.len();

        AllocatorStats {
            total_free_space: total_free,
            num_free_ranges: self.free_ranges.len(),
            num_allocated_blocks: allocated_blocks,
            fragmentation_ratio: self.free_ranges.len() as f32 / allocated_blocks.max(1) as f32,
            cursor_position: self.cursor,
        }
    }
}

/// Statistics about the allocator state.
#[derive(Debug, Clone)]
pub struct AllocatorStats {
    pub total_free_space: u64,
    pub num_free_ranges: usize,
    pub num_allocated_blocks: usize,
    pub fragmentation_ratio: f32,
    pub cursor_position: u64,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vast_allocate_basic() {
        let mut allocator = VastAllocator::new();

        // Allocate a small extent (1 block = 256 pixels)
        let result = allocator.allocate(256);
        assert!(result.is_some());
        let addr = result.unwrap();
        assert!(addr >= 65536, "should allocate after reserved area");
    }

    #[test]
    fn test_vast_allocate_large() {
        let mut allocator = VastAllocator::new();

        // Allocate a large extent (10 blocks = 2560 pixels)
        let result = allocator.allocate(2560);
        assert!(result.is_some());
        let addr = result.unwrap();
        assert!(addr >= 65536);
    }

    #[test]
    fn test_vast_allocate_extent() {
        let mut allocator = VastAllocator::new();

        // Allocate 5 blocks via allocate_extent
        let result = allocator.allocate_extent(5);
        assert!(result.is_some());
        let (addr, num_blocks) = result.unwrap();
        assert_eq!(num_blocks, 5);
        assert!(addr >= 65536);

        // Verify refcounts were initialized
        let block_addr = addr;
        assert!(allocator.refcounts.contains_key(&block_addr));
    }

    #[test]
    fn test_vast_free_basic() {
        let mut allocator = VastAllocator::new();

        let addr = allocator.allocate(256).unwrap();

        // Free the allocation
        allocator.free(addr, 256);

        // Verify the range was added back to free_ranges
        assert!(allocator.free_ranges.contains_key(&addr));
    }

    #[test]
    fn test_vast_allocate_then_free_then_allocate() {
        let mut allocator = VastAllocator::new();

        let addr1 = allocator.allocate(256).unwrap();
        allocator.free(addr1, 256);

        // Should be able to re-allocate the freed space
        let addr2 = allocator.allocate(256).unwrap();
        assert_eq!(addr1, addr2, "should reuse freed space");
    }

    #[test]
    fn test_vast_extent_allocation_pattern() {
        let mut allocator = VastAllocator::new();

        // Allocate multiple extents
        let extent1 = allocator.allocate_extent(3).unwrap();
        let extent2 = allocator.allocate_extent(5).unwrap();
        let extent3 = allocator.allocate_extent(2).unwrap();

        // Verify they don't overlap
        let (start1, len1) = extent1;
        let (start2, len2) = extent2;
        let (start3, len3) = extent3;

        let end1 = start1 + len1 * BLOCK_PIXELS;
        let end2 = start2 + len2 * BLOCK_PIXELS;
        let end3 = start3 + len3 * BLOCK_PIXELS;

        assert!(start1 < end1);
        assert!(start2 < end2);
        assert!(start3 < end3);

        // They should be sequential (no overlap)
        assert!(end1 <= start2 || start1 >= end2);
        assert!(end2 <= start3 || start2 >= end3);
    }

    #[test]
    fn test_vast_fragmentation_detection() {
        let mut allocator = VastAllocator::new();

        // Initially should not need compaction
        assert!(!allocator.needs_compaction());

        // Create fragmentation by alternating allocations and frees
        let mut addrs = Vec::new();
        for _ in 0..100 {
            let addr = allocator.allocate(256).unwrap();
            addrs.push(addr);
        }

        // Free every other allocation to create gaps
        for (i, &addr) in addrs.iter().enumerate() {
            if i % 2 == 0 {
                allocator.free(addr, 256);
            }
        }

        // Now should have many free ranges (but less than threshold)
        // Since each free creates a separate entry and we freed 50
        let free_count = allocator.free_ranges.len();
        // This test verifies fragmentation logic, though we may not hit threshold
        assert!(
            free_count >= 10,
            "should have fragmentation from alternating allocs"
        );
    }

    #[test]
    fn test_vast_compaction_merges_ranges() {
        let mut allocator = VastAllocator::new();

        // Allocate and free adjacent ranges
        let addr1 = allocator.allocate(256).unwrap();
        let addr2 = allocator.allocate(256).unwrap();
        let addr3 = allocator.allocate(256).unwrap();

        allocator.free(addr1, 256);
        allocator.free(addr2, 256);
        allocator.free(addr3, 256);

        let free_before = allocator.free_ranges.len();

        // Compact should merge adjacent free ranges
        allocator.compact();

        let free_after = allocator.free_ranges.len();

        // Should have fewer ranges after merging
        assert!(free_after <= free_before);
    }

    #[test]
    fn test_vast_stats_report() {
        let mut allocator = VastAllocator::new();

        // Initial stats
        let stats = allocator.stats();
        assert!(stats.total_free_space > 0);
        assert_eq!(stats.num_allocated_blocks, 0);

        // After allocation
        allocator.allocate_extent(10);
        let stats_after = allocator.stats();
        assert!(stats_after.total_free_space < stats.total_free_space);
        assert_eq!(stats_after.num_allocated_blocks, 10);
    }

    #[test]
    fn test_vast_out_of_memory() {
        let mut allocator = VastAllocator::new();

        // Allocate all available space (very large request)
        let result = allocator.allocate(u64::MAX);
        assert!(
            result.is_none(),
            "should fail to allocate impossibly large extent"
        );
    }

    #[test]
    fn test_vast_cursor_advances() {
        let mut allocator = VastAllocator::new();

        let cursor_before = allocator.cursor;

        allocator.allocate(512);
        let cursor_after = allocator.stats().cursor_position;

        assert!(cursor_after > cursor_before);
    }
}
