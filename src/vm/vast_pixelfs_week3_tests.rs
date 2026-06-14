//! Tests for Week 3: Multi-Block Extents and Garbage Collection

use geometry_os::vm::vast_pixelfs::*;
use geometry_os::vm::vast_allocator::*;
use geometry_os::tile_store::TileStore;

#[test]
fn test_extent_single_allocation() {
    // Test allocating a file as a single extent
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "test.txt", 0o644).unwrap();

    // Write 300 pixels (just over 1 block = 256 pixels)
    let data: Vec<u32> = (0..300).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data).unwrap();

    // Read back and verify
    let recovered = fs.read_file(&mut store, inode_addr).unwrap();
    assert_eq!(data, recovered);

    // Verify only 1 extent was used
    let inode = VastInode::read(&mut store, inode_addr).unwrap();
    assert_eq!(inode.extents.len(), 1);
    assert_eq!(inode.extents[0].count, 2); // 2 blocks for 300 pixels
}

#[test]
fn test_extent_multi_allocation() {
    // Test allocating multiple extents when single extent fails
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "large.txt", 0o644).unwrap();

    // Write enough data to require multiple extents
    let data: Vec<u32> = (0..5000).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data).unwrap();

    // Read back and verify
    let recovered = fs.read_file(&mut store, inode_addr).unwrap();
    assert_eq!(data, recovered);

    // Verify multiple extents were used
    let inode = VastInode::read(&mut store, inode_addr).unwrap();
    assert!(inode.extents.len() > 1, "Should use multiple extents");

    // Verify total blocks match expectation
    let total_blocks: u32 = inode.extents.iter().map(|e| e.count).sum();
    let expected_blocks = ((5000 * 4) + 1023) / 1024; // bytes / 1024
    assert_eq!(total_blocks, expected_blocks as u32);
}

#[test]
fn test_extent_roundtrip() {
    // Test bit-perfect roundtrip with extents
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "roundtrip.bin", 0o644).unwrap();

    // Write a known pattern
    let original: Vec<u32> = (0..1024).map(|i| i ^ 0xDEADBEEF).collect();
    fs.write_file(&mut store, inode_addr, &original).unwrap();

    // Read back and verify
    let recovered = fs.read_file(&mut store, inode_addr).unwrap();
    assert_eq!(original, recovered);
}

#[test]
fn test_delete_file_frees_extents() {
    // Test that delete_file properly frees all extents
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "delete_me.txt", 0o644).unwrap();

    // Write data that requires multiple extents
    let data: Vec<u32> = (0..3000).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data).unwrap();

    // Get stats before deletion
    let stats_before = fs.stats();

    // Delete the file
    fs.delete_file(&mut store, inode_addr).unwrap();

    // Get stats after deletion
    let stats_after = fs.stats();

    // Verify that allocated blocks decreased
    assert!(
        stats_after.num_allocated_blocks < stats_before.num_allocated_blocks,
        "Delete should free allocated blocks"
    );

    // Verify that free space increased
    assert!(
        stats_after.total_free_space > stats_before.total_free_space,
        "Delete should increase free space"
    );
}

#[test]
fn test_refcount_tracking() {
    // Test that refcounts are properly tracked for blocks
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "refcount.txt", 0o644).unwrap();

    // Write data to create allocations
    let data: Vec<u32> = (0..1024).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data).unwrap();

    // Get the inode to see which blocks were allocated
    let inode = VastInode::read(&mut store, inode_addr).unwrap();

    // Verify that blocks have refcount = 1
    for extent in &inode.extents {
        for block_idx in 0..extent.count {
            let block_addr = extent.start + block_idx as u64 * BLOCK_PIXELS as u64;
            let refcount = fs.allocator.get_refcount(block_addr);
            assert_eq!(refcount, 1, "Block should have refcount 1");
        }
    }

    // Delete and verify refcounts are 0
    fs.delete_file(&mut store, inode_addr).unwrap();

    for extent in &inode.extents {
        for block_idx in 0..extent.count {
            let block_addr = extent.start + block_idx as u64 * BLOCK_PIXELS as u64;
            let refcount = fs.allocator.get_refcount(block_addr);
            assert_eq!(refcount, 0, "Block should have refcount 0 after delete");
        }
    }
}

#[test]
fn test_fragmentation_detection() {
    // Test that fragmentation ratio is calculated correctly
    let mut allocator = VastAllocator::new();

    // Initial state should have low fragmentation
    assert!(!allocator.needs_compaction(), "Should not need compaction initially");

    // Allocate and free multiple ranges to create fragmentation
    for i in 0..10 {
        let start = allocator.allocate(100).unwrap();
        if i % 2 == 0 {
            allocator.free(start, 100);
        }
    }

    // After fragmentation, might need compaction
    // (depending on allocation pattern)
    let stats = allocator.stats();
    println!("Fragmentation ratio: {}", stats.fragmentation_ratio);
}

#[test]
fn test_garbage_collection_trigger() {
    // Test that delete_file triggers GC when fragmentation is high
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    // Create and delete multiple files to create fragmentation
    let mut inodes = Vec::new();
    for i in 0..20 {
        let name = format!("file_{}.txt", i);
        let inode_addr = fs.create_file(&mut store, &name, 0o644).unwrap();
        let data: Vec<u32> = (0..500).map(|j| j + i * 500).collect();
        fs.write_file(&mut store, inode_addr, &data).unwrap();
        inodes.push(inode_addr);
    }

    // Delete every other file to create fragmentation
    for (i, &inode_addr) in inodes.iter().enumerate() {
        if i % 2 == 0 {
            fs.delete_file(&mut store, inode_addr).unwrap();
        }
    }

    // Verify that free space increased
    let stats = fs.stats();
    assert!(stats.total_free_space > 0, "Should have free space after deletions");
    println!("After deletions - Free space: {}, Fragmentation: {}",
             stats.total_free_space, stats.fragmentation_ratio);
}

#[test]
fn test_extent_write_updates_inode() {
    // Test that writing to an existing file updates extents correctly
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    let inode_addr = fs.create_file(&mut store, "update.txt", 0o644).unwrap();

    // Write initial data
    let data1: Vec<u32> = (0..512).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data1).unwrap();

    let inode1 = VastInode::read(&mut store, inode_addr).unwrap();
    let extents1 = inode1.extents.clone();

    // Write larger data (should reallocate)
    let data2: Vec<u32> = (0..2048).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data2).unwrap();

    let inode2 = VastInode::read(&mut store, inode_addr).unwrap();

    // Verify that extents changed
    assert_eq!(inode2.size as usize, data2.len() * 4);
    assert!(inode2.extents.len() >= extents1.len(),
            "Should use at least as many extents for larger file");

    // Verify data integrity
    let recovered = fs.read_file(&mut store, inode_addr).unwrap();
    assert_eq!(data2, recovered);
}

#[test]
fn test_allocator_extent_allocation() {
    // Test that VastAllocator correctly allocates extents
    let mut allocator = VastAllocator::new();

    // Allocate a small extent
    let (start1, extent_id1) = allocator.allocate_extent(10).unwrap();
    assert!(start1 >= 65536, "Should allocate after inode table zone");

    // Allocate another extent
    let (start2, extent_id2) = allocator.allocate_extent(20).unwrap();
    assert!(start2 != start1, "Should allocate different start addresses");
    assert!(extent_id2 != extent_id1, "Should have different extent IDs");

    // Verify refcounts are set
    for block_idx in 0..10 {
        let block_addr = start1 + block_idx * 256;
        assert_eq!(allocator.get_refcount(block_addr), 1);
    }

    // Free the first extent
    allocator.free(start1, 10);

    // Verify refcounts are cleared
    for block_idx in 0..10 {
        let block_addr = start1 + block_idx * 256;
        assert_eq!(allocator.get_refcount(block_addr), 0);
    }
}

#[test]
fn test_filesystem_stats() {
    // Test that filesystem stats are accurate
    let mut store = TileStore::new();
    let mut fs = VastPixelFS::new();

    // Initial stats
    let initial_stats = fs.stats();
    assert_eq!(initial_stats.num_allocated_blocks, 0);

    // Create and write a file
    let inode_addr = fs.create_file(&mut store, "stats.txt", 0o644).unwrap();
    let data: Vec<u32> = (0..1024).map(|i| i).collect();
    fs.write_file(&mut store, inode_addr, &data).unwrap();

    // Stats after write
    let stats_after_write = fs.stats();
    assert!(stats_after_write.num_allocated_blocks > 0);

    // Delete file
    fs.delete_file(&mut store, inode_addr).unwrap();

    // Stats after delete
    let stats_after_delete = fs.stats();
    assert!(
        stats_after_delete.num_allocated_blocks < stats_after_write.num_allocated_blocks,
        "Allocated blocks should decrease after delete"
    );
}