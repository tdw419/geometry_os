//! vast_directory_tests.rs -- Tests for hierarchical directory support (Phase II, Week 4)

use crate::tile_store::TileStore;
use crate::vm::vast_directory::*;
use crate::vm::vast_pixelfs::*;

fn create_test_store() -> TileStore {
    let mut store = TileStore::new();
    store.procedural_enabled = false;
    store
}

// ============ PATH PARSING TESTS ============

#[test]
fn test_parse_path_absolute() {
    let components = parse_path("/home/user/file.txt");
    assert_eq!(components, vec!["home", "user", "file.txt"]);
}

#[test]
fn test_parse_path_relative() {
    let components = parse_path("home/user/file.txt");
    assert_eq!(components, vec!["home", "user", "file.txt"]);
}

#[test]
fn test_parse_path_root() {
    let components: Vec<&str> = parse_path("/");
    assert_eq!(components, Vec::<&str>::new());
}

#[test]
fn test_parse_path_parent() {
    let components = parse_path("/home/user/..");
    assert_eq!(components, vec!["home"]);
}

#[test]
fn test_parse_path_parent_self() {
    let components = parse_path("/home/user/./file.txt");
    assert_eq!(components, vec!["home", "user", "file.txt"]);
}

#[test]
fn test_parse_path_empty() {
    let components: Vec<&str> = parse_path("");
    assert_eq!(components, Vec::<&str>::new());
}

#[test]
fn test_parse_path_single_component() {
    let components: Vec<&str> = parse_path("home");
    assert_eq!(components, vec!["home"]);
}

#[test]
fn test_parse_path_multiple_parents() {
    let components = parse_path("/a/b/c/../../d");
    assert_eq!(components, vec!["a", "d"]);
}

#[test]
fn test_parse_path_deep_parent_chain() {
    let components = parse_path("/a/b/c/d/e/f/../g/../h");
    assert_eq!(components, vec!["a", "b", "c", "d", "e", "h"]);
}

#[test]
fn test_parse_path_consecutive_slashes() {
    let components = parse_path("/home//user//file.txt");
    assert_eq!(components, vec!["home", "user", "file.txt"]);
}

#[test]
fn test_parse_path_trailing_slash() {
    let components = parse_path("/home/user/");
    assert_eq!(components, vec!["home", "user"]);
}

#[test]
fn test_parse_path_dots_at_start() {
    let components = parse_path("./home/user");
    assert_eq!(components, vec![".", "home", "user"]);
}

#[test]
fn test_parse_path_multiple_dots() {
    let components = parse_path("a/b/c/../../d/e/./f");
    assert_eq!(components, vec!["a", "d", "e", "f"]);
}

#[test]
fn test_parse_path_only_dots() {
    let components = parse_path("..");
    assert_eq!(components, vec![".."]);
}

// ============ VASTPIXELFS STR METHODS TESTS ============

#[test]
fn test_mkdir_str_creates_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    // Initialize root directory at inode 65536
    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create a subdirectory using string path
    let subdir_path = "/home";
    let subdir_idx = fs
        .mkdir_str(&mut store, subdir_path, 0o755)
        .expect("Failed to create subdir");

    // Verify directory was created
    let subdir_inode = VastInode::read(&mut store, subdir_idx).unwrap();
    assert_eq!(subdir_inode.mode & S_IFDIR, S_IFDIR);
    assert_eq!(subdir_inode.name_hash, VastPixelFS::hash_name("home"));
}

#[test]
fn test_mkdir_str_nested_directories() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested path: /home/ai/data
    let path = "/home/ai/data";
    let data_idx = fs
        .mkdir_recursive_str(&mut store, path, 0o755)
        .expect("Failed to create nested path");

    // Verify each level exists
    let home_idx = fs
        .lookup_path_str(&mut store, "/home")
        .expect("home not found");
    let ai_idx = fs
        .lookup_path_str(&mut store, "/home/ai")
        .expect("ai not found");
    let data_idx_lookup = fs
        .lookup_path_str(&mut store, path)
        .expect("data not found");

    assert_eq!(data_idx, data_idx_lookup);

    // Verify all are directories
    let home_inode = VastInode::read(&mut store, home_idx).unwrap();
    let ai_inode = VastInode::read(&mut store, ai_idx).unwrap();
    let data_inode = VastInode::read(&mut store, data_idx).unwrap();

    assert_eq!(home_inode.mode & S_IFDIR, S_IFDIR);
    assert_eq!(ai_inode.mode & S_IFDIR, S_IFDIR);
    assert_eq!(data_inode.mode & S_IFDIR, S_IFDIR);
}

#[test]
fn test_mkdir_str_fails_on_duplicate() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create directory
    let path = "/home";
    let _ = fs
        .mkdir_str(&mut store, path, 0o755)
        .expect("First mkdir should succeed");

    // Try to create duplicate
    let result = fs.mkdir_str(&mut store, path, 0o755);
    assert!(result.is_none(), "Duplicate mkdir should fail");
}

#[test]
fn test_mkdir_str_fails_if_parent_missing() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Try to create /nonexistent/path - should fail because parent doesn't exist
    let result = fs.mkdir_str(&mut store, "/nonexistent/path", 0o755);
    assert!(
        result.is_none(),
        "mkdir_str should fail when parent doesn't exist"
    );
}

#[test]
fn test_rmdir_str_empty_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create empty directory
    let path = "/temp";
    let _ = fs
        .mkdir_str(&mut store, path, 0o755)
        .expect("mkdir should succeed");

    // Remove it
    let result = fs
        .rmdir_str(&mut store, path)
        .expect("rmdir should succeed");
    assert!(result);

    // Verify it's gone
    let lookup = fs.lookup_path_str(&mut store, path);
    assert!(lookup.is_none());
}

#[test]
fn test_rmdir_str_fails_if_not_empty() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create /home/user
    let _ = fs.mkdir_str(&mut store, "/home", 0o755).unwrap();
    let _ = fs.mkdir_str(&mut store, "/home/user", 0o755).unwrap();

    // Try to remove /home (not empty)
    let result = fs
        .rmdir_str(&mut store, "/home")
        .expect("rmdir call should succeed");
    assert!(!result, "rmdir should fail for non-empty directory");
}

#[test]
fn test_rmdir_str_fails_if_not_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create a file (not a directory)
    let file_idx = fs.create_file_str(&mut store, "/file.txt", 0o644).unwrap();

    // Try to remove it as a directory
    let result = fs.rmdir_str(&mut store, "/file.txt");
    assert!(result.is_none(), "rmdir should fail for non-directory");
}

#[test]
fn test_lookup_path_str_absolute() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create some directories
    let _ = fs.mkdir_str(&mut store, "/home", 0o755).unwrap();
    let _ = fs.mkdir_str(&mut store, "/home/user", 0o755).unwrap();

    // Look them up
    let root = fs.lookup_path_str(&mut store, "/").unwrap();
    let home = fs.lookup_path_str(&mut store, "/home").unwrap();
    let user = fs.lookup_path_str(&mut store, "/home/user").unwrap();

    // Verify they're different
    assert_ne!(root, home);
    assert_ne!(home, user);
}

#[test]
fn test_lookup_path_str_not_found() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Try to look up non-existent path
    let result = fs.lookup_path_str(&mut store, "/nonexistent");
    assert!(result.is_none());
}

#[test]
fn test_create_file_str() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create a file in root
    let file_idx = fs.create_file_str(&mut store, "/file.txt", 0o644).unwrap();

    // Verify it's a file (not a directory)
    let inode = VastInode::read(&mut store, file_idx).unwrap();
    assert_eq!(inode.mode & S_IFDIR, 0, "Should not be a directory");
}

#[test]
fn test_create_file_str_with_parent() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create directories
    let _ = fs.mkdir_str(&mut store, "/home", 0o755).unwrap();

    // Create file with parent directory
    let file_idx = fs
        .create_file_str(&mut store, "/home/file.txt", 0o644)
        .unwrap();

    // Verify it was created
    let inode = VastInode::read(&mut store, file_idx).unwrap();
    assert_eq!(inode.mode & S_IFDIR, 0, "Should be a file");
}

#[test]
fn test_create_file_str_no_parent() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Try to create file without parent (should fail)
    let result = fs.create_file_str(&mut store, "/nonexistent/file.txt", 0o644);
    assert!(result.is_none());
}

// ============ READDIR TESTS ============

#[test]
fn test_readdir_empty_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create empty directory
    let dir_idx = fs.mkdir_str(&mut store, "/empty", 0o755).unwrap();

    // Read directory entries
    let entries = fs.readdir(&mut store, dir_idx).unwrap();

    // Should have no entries
    assert_eq!(entries.len(), 0);
}

#[test]
fn test_readdir_non_empty_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create directories
    let _ = fs.mkdir_str(&mut store, "/dir", 0o755).unwrap();
    let _ = fs.mkdir_str(&mut store, "/dir/subdir", 0o755).unwrap();
    let _ = fs
        .create_file_str(&mut store, "/dir/file.txt", 0o644)
        .unwrap();

    // Read directory entries from root
    let entries = fs.readdir(&mut store, _root_idx).unwrap();
    println!("Root readdir found {} entries", entries.len());

    // Should have only dir entry (file.txt is under /dir)
    let names: Vec<&str> = entries
        .iter()
        .map(|(_, _, flags)| {
            // We can't get the actual name, but we can verify the structure
            if flags & S_IFDIR != 0 {
                "dir"
            } else {
                "file.txt"
            }
        })
        .collect();

    println!("Names in root: {:?}", names);
    assert!(names.contains(&"dir"));
    // file.txt should NOT be in root - it's under /dir
    assert!(
        !names.contains(&"file.txt"),
        "file.txt should not be in root"
    );

    // Verify file.txt exists under /dir
    let dir_idx = fs.lookup_path_str(&mut store, "/dir").unwrap();
    let dir_entries = fs.readdir(&mut store, dir_idx).unwrap();
    println!("/dir readdir found {} entries", dir_entries.len());
    let dir_names: Vec<&str> = dir_entries
        .iter()
        .map(|(_, _, flags)| {
            if flags & S_IFDIR != 0 {
                "subdir"
            } else {
                "file.txt"
            }
        })
        .collect();
    println!("Names in /dir: {:?}", dir_names);
    assert!(dir_names.contains(&"subdir"), "subdir should be under /dir");
    assert!(
        dir_names.contains(&"file.txt"),
        "file.txt should be under /dir"
    );
}

#[test]
fn test_readdir_nested_directory() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested structure
    let _ = fs.mkdir_recursive_str(&mut store, "/a/b/c", 0o755).unwrap();

    // Read subdirectory's entries
    let b_idx = fs.lookup_path_str(&mut store, "/a/b").unwrap();
    let entries = fs.readdir(&mut store, b_idx).unwrap();

    // Should have c entry
    let names: Vec<&str> = entries
        .iter()
        .map(
            |(_, _, flags)| {
                if flags & S_IFDIR != 0 {
                    "c"
                } else {
                    "unknown"
                }
            },
        )
        .collect();

    assert!(names.contains(&"c"));
}

#[test]
fn test_readdir_nonexistent_inode() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Try to read from non-existent inode
    let result = fs.readdir(&mut store, 999999);
    assert!(result.is_none());
}

#[test]
fn test_readdir_directory_without_extent() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create directory with no entries
    let dir_idx = fs.mkdir_str(&mut store, "/dir", 0o755).unwrap();

    // Verify directory has no extents initially
    let dir_inode = VastInode::read(&mut store, dir_idx).unwrap();
    assert_eq!(dir_inode.extents.len(), 0);

    // readdir should still work
    let entries = fs.readdir(&mut store, dir_idx).unwrap();
    assert_eq!(entries.len(), 0);
}

#[test]
fn test_mkdir_recursive_str() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested path with mkdir_recursive
    let path = "/a/b/c/d/e";
    let e_idx = fs.mkdir_recursive_str(&mut store, path, 0o755).unwrap();

    // Verify all intermediate directories were created
    let a_idx = fs.lookup_path_str(&mut store, "/a").unwrap();
    let b_idx = fs.lookup_path_str(&mut store, "/a/b").unwrap();
    let c_idx = fs.lookup_path_str(&mut store, "/a/b/c").unwrap();
    let d_idx = fs.lookup_path_str(&mut store, "/a/b/c/d").unwrap();

    // e_idx should be different from d_idx - it's a new directory
    assert_ne!(e_idx, d_idx);
}

#[test]
fn test_mkdir_recursive_str_with_file() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested path including a file
    let path = "/a/b/file.txt";
    let result = fs.mkdir_recursive_str(&mut store, path, 0o644);

    // Should fail - can't create a file with mkdir_recursive
    assert!(result.is_none());
}

#[test]
fn test_mkdir_recursive_str_duplicate() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create a directory
    let _ = fs.mkdir_recursive_str(&mut store, "/a/b", 0o755).unwrap();

    // Try to create it again
    let result = fs.mkdir_recursive_str(&mut store, "/a/b", 0o755);
    assert!(result.is_none());
}

#[test]
fn test_path_string_with_parent_traversal() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested directories
    let _ = fs.mkdir_recursive_str(&mut store, "/a/b", 0o755).unwrap();
    let _ = fs.mkdir_recursive_str(&mut store, "/a/c", 0o755).unwrap();

    // Look up via path with .. traversal
    let result = fs.lookup_path_str(&mut store, "/a/b/../c");
    assert!(result.is_some());

    let idx = result.unwrap();
    let inode = VastInode::read(&mut store, idx).unwrap();
    assert_eq!(inode.mode & S_IFDIR, S_IFDIR);
}

#[test]
fn test_path_string_traverse_to_root() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create nested directories recursively
    let _ = fs.mkdir_recursive_str(&mut store, "/a/b", 0o755).unwrap();

    // Traverse from subdirectory to root
    let result = fs.lookup_path_str(&mut store, "/a/b/..");
    assert!(result.is_some());

    let idx = result.unwrap();
    let inode = VastInode::read(&mut store, idx).unwrap();
    assert_eq!(inode.mode & S_IFDIR, S_IFDIR);
}

#[test]
fn test_create_file_and_directory_in_same_path() {
    let mut store = create_test_store();
    let mut fs = VastPixelFS::new();

    let _root_idx = fs.create_file(&mut store, "root", S_IFDIR | 0o755).unwrap();

    // Create a directory
    let _ = fs.mkdir_str(&mut store, "/dir", 0o755).unwrap();

    // Create a file in that directory
    let file_idx = fs
        .create_file_str(&mut store, "/dir/file.txt", 0o644)
        .unwrap();

    // Verify both exist
    let file_inode = VastInode::read(&mut store, file_idx).unwrap();
    assert_eq!(file_inode.mode & S_IFDIR, 0, "Should be a file");

    // Look up the directory
    let dir_idx = fs.lookup_path_str(&mut store, "/dir").unwrap();
    assert_ne!(
        dir_idx, _root_idx,
        "dir should be a different inode from root"
    );
    assert_ne!(dir_idx, file_idx, "dir and file should be different inodes");
}
