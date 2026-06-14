#[cfg(test)]
mod tests {
    use crate::tile_store::TileStore;
    use crate::vm::vast_geometry::*;
    use crate::vm::vast_pixelfs::*;

    #[test]
    fn test_create_file_basic() {
        let mut store = TileStore::new();
        let mut fs = VastPixelFS::new();

        // 1. Test File Creation
        let filename = "test_spatial.bin";
        let inode_addr = fs
            .create_file(&mut store, filename, 0o644)
            .expect("Failed to create file");

        let inode = VastInode::read(&mut store, inode_addr).expect("Failed to read back inode");

        assert_eq!(inode.name_hash, VastPixelFS::hash_name(filename));
        assert_eq!(inode.mode, 0o644);
        assert_eq!(inode.size, 0);
        assert_eq!(inode.extents.len(), 0);

        // 2. Test File Writing (Smaller data set for easier debugging)
        let test_data: Vec<u32> = (0..32).collect();
        fs.write_file(&mut store, inode_addr, &test_data)
            .expect("Failed to write file");

        let inode_after =
            VastInode::read(&mut store, inode_addr).expect("Failed to read back inode after write");
        assert_eq!(inode_after.size, (test_data.len() * 4) as u64);
        assert_eq!(inode_after.extents.len(), 1);

        // 3. Test File Reading
        let read_data = fs
            .read_file(&mut store, inode_addr)
            .expect("Failed to read file");

        assert_eq!(read_data.len(), test_data.len());
        assert_eq!(read_data, test_data);
    }
}
