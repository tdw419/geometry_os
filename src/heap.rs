// ═══════════════════════════════════════════════════════════════════════
// HEAP ALLOCATOR
//
// Memory-mapped I/O for dynamic memory allocation within the VM.
// Programs allocate/free blocks of RAM via registers at 0xFFD0-0xFFD5.
//
// The heap lives in normal VM RAM. The allocator manages a free list
// of contiguous regions within [heap_start, heap_start + heap_size).
//
// Protocol:
//   1. Write HEAP_START with the base address in RAM
//   2. Write HEAP_SIZE with the size (this initializes the heap)
//   3. Write HEAP_ALLOC with count → read back to get address (0=fail)
//   4. Write HEAP_FREE with address to free
//   5. Read HEAP_FREE_WORDS for remaining space
//   6. Read HEAP_BLOCKS for number of allocated blocks
// ═══════════════════════════════════════════════════════════════════════

/// Write: set heap start address in RAM. Read: get heap start address.
pub const HEAP_START_ADDR: usize = 0xFFD0;
/// Write: set heap size in words (initializes the heap). Read: get heap size.
pub const HEAP_SIZE_ADDR: usize = 0xFFD1;
/// Write: request allocation of N words. Read: get address of last alloc (0 = fail).
pub const HEAP_ALLOC_ADDR: usize = 0xFFD2;
/// Write: address of block to free.
pub const HEAP_FREE_ADDR: usize = 0xFFD3;
/// Read-only: number of currently allocated blocks.
pub const HEAP_BLOCKS_ADDR: usize = 0xFFD4;
/// Read-only: free words remaining in the heap.
pub const HEAP_FREE_WORDS_ADDR: usize = 0xFFD5;

/// Maximum number of heap blocks that can be tracked.
const HEAP_MAX_BLOCKS: usize = 64;

/// A single heap block — either allocated or free.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct HeapBlock {
    /// Start address (absolute, in VM RAM).
    pub start: u32,
    /// Size in words.
    pub size: u32,
    /// Whether this block is currently allocated.
    pub allocated: bool,
}

/// Simple heap allocator with free-list coalescing.
/// Manages a region of VM RAM for dynamic allocation.
#[derive(Debug, Clone, PartialEq)]
pub struct Heap {
    /// Base address of the heap region in RAM.
    pub start: u32,
    /// Total size of the heap region in words.
    pub size: u32,
    /// Whether the heap has been initialized.
    pub initialized: bool,
    /// Tracked blocks (allocated + free holes).
    pub blocks: Vec<HeapBlock>,
}

impl Default for Heap {
    fn default() -> Self {
        Self::new()
    }
}

impl Heap {
    pub fn new() -> Self {
        Self {
            start: 0,
            size: 0,
            initialized: false,
            blocks: Vec::new(),
        }
    }

    /// Initialize the heap with a base address and size.
    pub fn init(&mut self, start: u32, size: u32) {
        self.start = start;
        self.size = size;
        self.initialized = true;
        self.blocks.clear();
        if size > 0 {
            self.blocks.push(HeapBlock {
                start,
                size,
                allocated: false,
            });
        }
    }

    /// Reset the heap to uninitialized state.
    pub fn reset(&mut self) {
        self.start = 0;
        self.size = 0;
        self.initialized = false;
        self.blocks.clear();
    }

    /// Allocate `count` words from the heap (first-fit).
    /// Returns the start address, or 0 if no space.
    pub fn alloc(&mut self, count: u32) -> u32 {
        if !self.initialized || count == 0 {
            return 0;
        }
        if self.blocks.len() >= HEAP_MAX_BLOCKS {
            return 0;
        }
        let idx = match self
            .blocks
            .iter()
            .position(|b| !b.allocated && b.size >= count)
        {
            Some(i) => i,
            None => return 0,
        };
        let block = self.blocks[idx];
        let addr = block.start;
        if block.size == count {
            self.blocks[idx].allocated = true;
        } else {
            self.blocks[idx] = HeapBlock {
                start: block.start,
                size: count,
                allocated: true,
            };
            self.blocks.insert(
                idx + 1,
                HeapBlock {
                    start: block.start + count,
                    size: block.size - count,
                    allocated: false,
                },
            );
        }
        addr
    }

    /// Free a previously allocated block at `addr`.
    /// Returns true if freed, false if not found.
    pub fn free(&mut self, addr: u32) -> bool {
        if !self.initialized {
            return false;
        }
        let idx = match self
            .blocks
            .iter()
            .position(|b| b.start == addr && b.allocated)
        {
            Some(i) => i,
            None => return false,
        };
        self.blocks[idx].allocated = false;
        // Coalesce with next block if free
        if idx + 1 < self.blocks.len()
            && !self.blocks[idx + 1].allocated
            && self.blocks[idx].start + self.blocks[idx].size == self.blocks[idx + 1].start
        {
            self.blocks[idx].size += self.blocks[idx + 1].size;
            self.blocks.remove(idx + 1);
        }
        // Coalesce with previous block if free
        if idx > 0
            && !self.blocks[idx - 1].allocated
            && self.blocks[idx - 1].start + self.blocks[idx - 1].size == self.blocks[idx].start
        {
            self.blocks[idx - 1].size += self.blocks[idx].size;
            self.blocks.remove(idx);
        }
        true
    }

    /// Total free words in the heap.
    pub fn free_words(&self) -> u32 {
        self.blocks
            .iter()
            .filter(|b| !b.allocated)
            .map(|b| b.size)
            .sum()
    }

    /// Number of allocated blocks.
    pub fn alloc_count(&self) -> u32 {
        self.blocks.iter().filter(|b| b.allocated).count() as u32
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn heap_init_creates_one_free_block() {
        let mut h = Heap::new();
        h.init(100, 50);
        assert!(h.initialized);
        assert_eq!(h.blocks.len(), 1);
        assert_eq!(h.blocks[0].start, 100);
        assert_eq!(h.blocks[0].size, 50);
        assert!(!h.blocks[0].allocated);
    }

    #[test]
    fn heap_alloc_returns_address() {
        let mut h = Heap::new();
        h.init(200, 100);
        let addr = h.alloc(10);
        assert_eq!(addr, 200);
        assert_eq!(h.alloc_count(), 1);
        assert_eq!(h.free_words(), 90);
    }

    #[test]
    fn heap_alloc_exact_fit() {
        let mut h = Heap::new();
        h.init(200, 10);
        let addr = h.alloc(10);
        assert_eq!(addr, 200);
        assert_eq!(h.free_words(), 0);
    }

    #[test]
    fn heap_alloc_fails_when_full() {
        let mut h = Heap::new();
        h.init(200, 10);
        h.alloc(10);
        let addr2 = h.alloc(5);
        assert_eq!(addr2, 0);
    }

    #[test]
    fn heap_alloc_fails_when_uninitialized() {
        let mut h = Heap::new();
        assert_eq!(h.alloc(10), 0);
    }

    #[test]
    fn heap_alloc_fails_for_zero() {
        let mut h = Heap::new();
        h.init(200, 100);
        assert_eq!(h.alloc(0), 0);
    }

    #[test]
    fn heap_free_and_coalesce() {
        let mut h = Heap::new();
        h.init(200, 100);
        let a = h.alloc(30); // 200
        let b = h.alloc(30); // 230
        let c = h.alloc(40); // 260
        assert_eq!(h.free_words(), 0);

        // Free middle block
        assert!(h.free(b));
        assert_eq!(h.alloc_count(), 2);
        assert_eq!(h.free_words(), 30);

        // Free first block — should coalesce with middle free block
        assert!(h.free(a));
        assert_eq!(h.alloc_count(), 1);
        assert_eq!(h.free_words(), 60);

        // Free last block — should coalesce everything
        assert!(h.free(c));
        assert_eq!(h.alloc_count(), 0);
        assert_eq!(h.free_words(), 100);
        assert_eq!(h.blocks.len(), 1);
    }

    #[test]
    fn heap_free_unknown_address_returns_false() {
        let mut h = Heap::new();
        h.init(200, 100);
        assert!(!h.free(999));
    }

    #[test]
    fn heap_multiple_allocations() {
        let mut h = Heap::new();
        h.init(0, 1000);
        let a = h.alloc(100);
        let b = h.alloc(200);
        let c = h.alloc(300);
        assert_eq!(a, 0);
        assert_eq!(b, 100);
        assert_eq!(c, 300);
        assert_eq!(h.free_words(), 400);
        assert_eq!(h.alloc_count(), 3);
    }

    #[test]
    fn heap_free_creates_reuse() {
        let mut h = Heap::new();
        h.init(0, 100);
        let a = h.alloc(50); // 0
        h.alloc(50);         // 50
        h.free(a);           // free 0..50
        // Now the free block at 0..50 can be reused
        let d = h.alloc(25);
        assert_eq!(d, 0); // first-fit reuses the freed block
    }

    #[test]
    fn heap_reset_clears_everything() {
        let mut h = Heap::new();
        h.init(200, 100);
        h.alloc(10);
        h.reset();
        assert!(!h.initialized);
        assert_eq!(h.blocks.len(), 0);
    }

    #[test]
    fn heap_snapshot_restore() {
        let mut h = Heap::new();
        h.init(200, 100);
        h.alloc(30);
        let snap = h.clone();
        assert_eq!(snap.initialized, true);
        assert_eq!(snap.alloc_count(), 1);
        assert_eq!(snap.free_words(), 70);
    }
}
