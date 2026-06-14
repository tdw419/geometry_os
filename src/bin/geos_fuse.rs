//! geos_fuse -- Mount GeoExtent as a Linux FUSE filesystem.
//!
//! Usage:
//!   mkdir -p /mnt/geos
//!   geos_fuse /mnt/geos
//!
//! The filesystem uses GeoExtent (sparse block allocator) as the backend:
//! - Files are linked lists of 64x64 pixel blocks
//! - Directories are hash tables stored in blocks
//! - No fixed spatial limits — files and directories grow dynamically

use std::collections::HashMap;
use std::ffi::OsStr;
use std::io;
use std::path::Path;
use std::sync::Mutex;
use std::time::{Duration, SystemTime, UNIX_EPOCH};

use fuser::{
    BsdFileFlags, Errno, FileAttr, FileType, Filesystem, Generation, INodeNo, KernelConfig,
    LockOwner, MountOption, OpenFlags, RenameFlags, ReplyAttr, ReplyCreate, ReplyData,
    ReplyDirectory, ReplyEmpty, ReplyEntry, ReplyStatfs, ReplyWrite, Request, SessionACL,
    TimeOrNow, WriteFlags,
};

use geometry_os::geo_extent::{BlockAddr, BlockKind, GeoExtent};
use geometry_os::tile_store::TileStore;

const TTL: Duration = Duration::from_secs(1);
const ROOT_INO: u64 = 1;

#[derive(Clone)]
struct GeoInode {
    ino: u64,
    parent: u64,
    block: BlockAddr,
    name: String,
    kind: FileType,
    file_size: u64,
}

struct GeoFuseCore {
    store: TileStore,
    geo: GeoExtent,
    inodes: HashMap<u64, GeoInode>,
    next_ino: u64,
}

impl GeoFuseCore {
    fn new(epl_path: &str, root_x: i32, root_y: i32) -> Self {
        let mut store = TileStore::with_epl(epl_path);
        store.procedural_enabled = true;
        let origin = BlockAddr::new(root_x, root_y);

        let geo = match GeoExtent::mount(&mut store, origin) {
            Some(g) => g,
            None => {
                eprintln!(
                    "geos_fuse: formatting new filesystem at ({}, {})",
                    root_x, root_y
                );
                GeoExtent::format(&mut store, origin)
            },
        };

        let mut core = Self {
            store,
            geo,
            inodes: HashMap::new(),
            next_ino: 2,
        };

        core.inodes.insert(
            ROOT_INO,
            GeoInode {
                ino: ROOT_INO,
                parent: ROOT_INO,
                block: core.geo.sb.root_dir,
                name: String::new(),
                kind: FileType::Directory,
                file_size: 0,
            },
        );

        core
    }

    fn alloc_ino(&mut self) -> u64 {
        let ino = self.next_ino;
        self.next_ino += 1;
        ino
    }

    fn scan_dir(&mut self, parent_ino: u64) {
        if self
            .inodes
            .values()
            .any(|i| i.parent == parent_ino && i.ino != parent_ino)
        {
            return;
        }

        let parent = match self.inodes.get(&parent_ino) {
            Some(i) => i.clone(),
            None => return,
        };

        if parent.kind != FileType::Directory {
            return;
        }

        let entries = self.geo.dir_list(&mut self.store, parent.block);
        for (name, child_block, kind) in entries {
            let file_size = if kind == BlockKind::File {
                self.geo.file_size(&mut self.store, child_block)
            } else {
                0
            };
            let ino = self.alloc_ino();
            let file_type = match kind {
                BlockKind::File => FileType::RegularFile,
                BlockKind::Directory => FileType::Directory,
                BlockKind::Symlink => FileType::Symlink,
            };
            self.inodes.insert(
                ino,
                GeoInode {
                    ino,
                    parent: parent_ino,
                    block: child_block,
                    name,
                    kind: file_type,
                    file_size,
                },
            );
        }
    }

    fn read_content(&mut self, inode: &GeoInode) -> Vec<u8> {
        if inode.kind == FileType::Directory {
            return Vec::new();
        }
        // Both RegularFile and Symlink store data the same way.
        self.geo.read_file(&mut self.store, inode.block)
    }

    fn write_content(&mut self, ino: u64, offset: usize, data: &[u8]) -> Result<u32, Errno> {
        let inode = match self.inodes.get(&ino) {
            Some(i) => i.clone(),
            None => return Err(Errno::ENOENT),
        };

        if inode.kind != FileType::RegularFile {
            return Err(Errno::EISDIR);
        }

        // Fast path: in-place overwrite when write fits within current file.
        if offset + data.len() <= inode.file_size as usize {
            let written = self
                .geo
                .write_file_at(&mut self.store, inode.block, offset, data);
            if written > 0 {
                return Ok(written as u32);
            }
        }

        // Fallback: full read-modify-write for appends/extends.
        let mut content = self.read_content(&inode);
        let end = offset + data.len();
        if end > content.len() {
            content.resize(end, 0);
        }
        content[offset..end].copy_from_slice(data);

        self.geo_overwrite_file(inode.block, &content);

        if let Some(n) = self.inodes.get_mut(&ino) {
            n.file_size = content.len() as u64;
        }
        Ok(data.len() as u32)
    }

    // -- GeoExtent wrappers to avoid borrow-split issues --

    fn geo_create_file(&mut self, name: &str) -> BlockAddr {
        self.geo.create_file(&mut self.store, name)
    }

    fn geo_create_dir(&mut self, name: &str) -> BlockAddr {
        self.geo.create_dir(&mut self.store, name)
    }

    fn geo_dir_lookup(&mut self, dir: BlockAddr, name: &str) -> Option<(BlockAddr, BlockKind)> {
        self.geo.dir_lookup(&mut self.store, dir, name)
    }

    fn geo_dir_list(&mut self, dir: BlockAddr) -> Vec<(String, BlockAddr, BlockKind)> {
        self.geo.dir_list(&mut self.store, dir)
    }

    fn geo_dir_insert(
        &mut self,
        dir: BlockAddr,
        name: &str,
        child: BlockAddr,
        kind: BlockKind,
    ) -> Result<(), String> {
        self.geo.dir_insert(&mut self.store, dir, name, child, kind)
    }

    fn geo_dir_remove(&mut self, dir: BlockAddr, name: &str) -> Result<(), String> {
        self.geo.dir_remove(&mut self.store, dir, name)
    }

    fn geo_delete_file(&mut self, block: BlockAddr) {
        self.geo.delete_file(&mut self.store, block)
    }

    fn geo_delete_dir(&mut self, block: BlockAddr) {
        self.geo.delete_dir(&mut self.store, block)
    }

    fn geo_overwrite_file(&mut self, block: BlockAddr, data: &[u8]) -> usize {
        self.geo.overwrite_file(&mut self.store, block, data)
    }

    fn geo_read_file(&mut self, block: BlockAddr) -> Vec<u8> {
        self.geo.read_file(&mut self.store, block)
    }

    fn geo_write_name(&mut self, block: BlockAddr, name: &str) {
        GeoExtent::write_name(&mut self.store, block, name)
    }

    fn make_attr(inode: &GeoInode) -> FileAttr {
        let now = SystemTime::now();
        FileAttr {
            ino: INodeNo(inode.ino),
            size: inode.file_size,
            blocks: (inode.file_size + 511) / 512,
            atime: now,
            mtime: now,
            ctime: now,
            crtime: UNIX_EPOCH,
            kind: inode.kind,
            perm: if inode.kind == FileType::Directory {
                0o755
            } else if inode.kind == FileType::Symlink {
                0o777 // standard symlink permissions
            } else {
                0o644
            },
            nlink: if inode.kind == FileType::Directory {
                2
            } else {
                1
            },
            uid: unsafe { libc::getuid() },
            gid: unsafe { libc::getgid() },
            rdev: 0,
            flags: 0,
            blksize: 4096,
        }
    }
}

struct GeoFuse {
    core: Mutex<GeoFuseCore>,
}

impl GeoFuse {
    fn new(epl_path: &str, root_x: i32, root_y: i32) -> Self {
        Self {
            core: Mutex::new(GeoFuseCore::new(epl_path, root_x, root_y)),
        }
    }
}

impl Filesystem for GeoFuse {
    fn init(&mut self, _req: &Request, _config: &mut KernelConfig) -> io::Result<()> {
        eprintln!("geos_fuse: filesystem ready");
        Ok(())
    }

    fn destroy(&mut self) {
        let mut core = self.core.lock().unwrap();
        core.store.flush();
        eprintln!("geos_fuse: unmounted, data flushed");
    }

    fn lookup(&self, _req: &Request, parent: INodeNo, name: &OsStr, reply: ReplyEntry) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;
        core.scan_dir(parent);

        let name_str = name.to_string_lossy();
        for (_, inode) in &core.inodes {
            if inode.parent == parent && inode.name == name_str {
                reply.entry(&TTL, &GeoFuseCore::make_attr(inode), Generation(0));
                return;
            }
        }
        reply.error(Errno::ENOENT);
    }

    fn getattr(
        &self,
        _req: &Request,
        ino: INodeNo,
        _fh: Option<fuser::FileHandle>,
        reply: ReplyAttr,
    ) {
        let core = self.core.lock().unwrap();
        match core.inodes.get(&ino.0) {
            Some(inode) => reply.attr(&TTL, &GeoFuseCore::make_attr(inode)),
            None => reply.error(Errno::ENOENT),
        }
    }

    #[allow(clippy::too_many_arguments)]
    fn setattr(
        &self,
        _req: &Request,
        ino: INodeNo,
        _mode: Option<u32>,
        _uid: Option<u32>,
        _gid: Option<u32>,
        size: Option<u64>,
        _atime: Option<TimeOrNow>,
        _mtime: Option<TimeOrNow>,
        _ctime: Option<SystemTime>,
        _fh: Option<fuser::FileHandle>,
        _crtime: Option<SystemTime>,
        _chgtime: Option<SystemTime>,
        _bkuptime: Option<SystemTime>,
        _flags: Option<BsdFileFlags>,
        reply: ReplyAttr,
    ) {
        let mut core = self.core.lock().unwrap();
        let ino = ino.0;

        if let Some(new_size) = size {
            let inode = match core.inodes.get(&ino) {
                Some(i) => i.clone(),
                None => {
                    reply.error(Errno::ENOENT);
                    return;
                },
            };

            if inode.kind != FileType::RegularFile {
                reply.error(Errno::EISDIR);
                return;
            }

            let mut content = core.read_content(&inode);
            content.resize(new_size as usize, 0);
            core.geo_overwrite_file(inode.block, &content);

            if let Some(n) = core.inodes.get_mut(&ino) {
                n.file_size = new_size;
            }
        }

        match core.inodes.get(&ino) {
            Some(inode) => reply.attr(&TTL, &GeoFuseCore::make_attr(inode)),
            None => reply.error(Errno::ENOENT),
        }
    }

    fn readdir(
        &self,
        _req: &Request,
        ino: INodeNo,
        _fh: fuser::FileHandle,
        offset: u64,
        mut reply: ReplyDirectory,
    ) {
        let mut core = self.core.lock().unwrap();
        let ino = ino.0;
        core.scan_dir(ino);

        let inode = match core.inodes.get(&ino) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if inode.kind != FileType::Directory {
            reply.error(Errno::ENOTDIR);
            return;
        }

        let mut entries: Vec<(u64, FileType, String)> = vec![
            (ino, FileType::Directory, ".".to_string()),
            (inode.parent, FileType::Directory, "..".to_string()),
        ];

        let mut children: Vec<(u64, FileType, String)> = core
            .inodes
            .values()
            .filter(|i| i.parent == ino && i.ino != ino)
            .map(|i| (i.ino, i.kind, i.name.clone()))
            .collect();
        children.sort_by(|a, b| a.2.cmp(&b.2));
        entries.extend(children);

        for (i, (entry_ino, kind, name)) in entries.iter().enumerate() {
            let idx = (i + 1) as u64;
            if idx <= offset {
                continue;
            }
            if reply.add(INodeNo(*entry_ino), idx, *kind, name) {
                break;
            }
        }
        reply.ok();
    }

    fn read(
        &self,
        _req: &Request,
        ino: INodeNo,
        _fh: fuser::FileHandle,
        offset: u64,
        size: u32,
        _flags: OpenFlags,
        _lock_owner: Option<LockOwner>,
        reply: ReplyData,
    ) {
        let mut core = self.core.lock().unwrap();

        let inode = match core.inodes.get(&ino.0) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if inode.kind != FileType::RegularFile {
            reply.error(Errno::EISDIR);
            return;
        }

        let content = core.read_content(&inode);
        let start = offset as usize;
        let end = (start + size as usize).min(content.len());

        if start >= content.len() {
            reply.data(&[]);
        } else {
            reply.data(&content[start..end]);
        }
    }

    fn write(
        &self,
        _req: &Request,
        ino: INodeNo,
        _fh: fuser::FileHandle,
        offset: u64,
        data: &[u8],
        _write_flags: WriteFlags,
        _flags: OpenFlags,
        _lock_owner: Option<LockOwner>,
        reply: ReplyWrite,
    ) {
        let mut core = self.core.lock().unwrap();
        match core.write_content(ino.0, offset as usize, data) {
            Ok(written) => reply.written(written),
            Err(e) => reply.error(e),
        }
    }

    fn create(
        &self,
        _req: &Request,
        parent: INodeNo,
        name: &OsStr,
        _mode: u32,
        _umask: u32,
        _flags: i32,
        reply: ReplyCreate,
    ) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;

        let parent_inode = match core.inodes.get(&parent) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if parent_inode.kind != FileType::Directory {
            reply.error(Errno::ENOTDIR);
            return;
        }

        let name_str = name.to_string_lossy().to_string();

        if core
            .inodes
            .values()
            .any(|i| i.parent == parent && i.name == name_str)
        {
            reply.error(Errno::EEXIST);
            return;
        }

        // Also check the actual directory
        if core.geo_dir_lookup(parent_inode.block, &name_str).is_some() {
            reply.error(Errno::EEXIST);
            return;
        }

        let child_block = core.geo_create_file(&name_str);
        core.geo_dir_insert(parent_inode.block, &name_str, child_block, BlockKind::File)
            .expect("dir_insert failed");

        let ino = core.alloc_ino();
        let inode = GeoInode {
            ino,
            parent,
            block: child_block,
            name: name_str,
            kind: FileType::RegularFile,
            file_size: 0,
        };
        core.inodes.insert(ino, inode.clone());
        reply.created(
            &TTL,
            &GeoFuseCore::make_attr(&inode),
            Generation(0),
            fuser::FileHandle(ino),
            fuser::FopenFlags::empty(),
        );
    }

    fn mkdir(
        &self,
        _req: &Request,
        parent: INodeNo,
        name: &OsStr,
        _mode: u32,
        _umask: u32,
        reply: ReplyEntry,
    ) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;

        let parent_inode = match core.inodes.get(&parent) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if parent_inode.kind != FileType::Directory {
            reply.error(Errno::ENOTDIR);
            return;
        }

        let name_str = name.to_string_lossy().to_string();

        let child_block = core.geo_create_dir(&name_str);
        core.geo_dir_insert(
            parent_inode.block,
            &name_str,
            child_block,
            BlockKind::Directory,
        )
        .expect("dir_insert failed");

        let ino = core.alloc_ino();
        let inode = GeoInode {
            ino,
            parent,
            block: child_block,
            name: name_str,
            kind: FileType::Directory,
            file_size: 0,
        };
        core.inodes.insert(ino, inode.clone());
        reply.entry(&TTL, &GeoFuseCore::make_attr(&inode), Generation(0));
    }

    fn symlink(
        &self,
        _req: &Request,
        parent: INodeNo,
        name: &OsStr,
        link: &Path,
        reply: ReplyEntry,
    ) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;

        let parent_inode = match core.inodes.get(&parent) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if parent_inode.kind != FileType::Directory {
            reply.error(Errno::ENOTDIR);
            return;
        }

        let name_str = name.to_string_lossy().to_string();
        let link_str = link.to_string_lossy().to_string();

        let block = core.geo.create_symlink(&mut core.store, &name_str);
        core.geo
            .write_symlink_target(&mut core.store, block, &link_str);
        core.geo_dir_insert(parent_inode.block, &name_str, block, BlockKind::Symlink)
            .expect("dir_insert symlink failed");

        let ino = core.alloc_ino();
        let inode = GeoInode {
            ino,
            parent,
            block,
            name: name_str,
            kind: FileType::Symlink,
            file_size: link_str.len() as u64,
        };
        core.inodes.insert(ino, inode.clone());
        reply.entry(&TTL, &GeoFuseCore::make_attr(&inode), Generation(0));
    }

    fn readlink(&self, _req: &Request, ino: INodeNo, reply: ReplyData) {
        let mut core = self.core.lock().unwrap();
        let inode = match core.inodes.get(&ino.0) {
            Some(i) => i.clone(),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if inode.kind != FileType::Symlink {
            reply.error(Errno::EINVAL);
            return;
        }

        let target = core.geo.read_symlink_target(&mut core.store, inode.block);
        reply.data(target.as_bytes());
    }

    fn unlink(&self, _req: &Request, parent: INodeNo, name: &OsStr, reply: ReplyEmpty) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;
        let name_str = name.to_string_lossy().to_string();

        let target = core
            .inodes
            .iter()
            .find(|(_, i)| i.parent == parent && i.name == name_str);

        let (target_ino, target_inode) = match target {
            Some((ino, i)) => (*ino, i.clone()),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if target_inode.kind == FileType::Directory {
            reply.error(Errno::EISDIR);
            return;
        }

        let parent_inode = core.inodes.get(&parent).unwrap().clone();
        core.geo_dir_remove(parent_inode.block, &name_str)
            .expect("dir_remove failed");
        core.geo_delete_file(target_inode.block);
        core.inodes.remove(&target_ino);
        reply.ok();
    }

    fn rmdir(&self, _req: &Request, parent: INodeNo, name: &OsStr, reply: ReplyEmpty) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;
        let name_str = name.to_string_lossy().to_string();

        let target = core
            .inodes
            .iter()
            .find(|(_, i)| i.parent == parent && i.name == name_str);

        let (target_ino, target_inode) = match target {
            Some((ino, i)) => (*ino, i.clone()),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if target_inode.kind != FileType::Directory {
            reply.error(Errno::ENOTDIR);
            return;
        }

        // Check if empty via dir_list
        let children = core.geo_dir_list(target_inode.block);
        if !children.is_empty() {
            reply.error(Errno::ENOTEMPTY);
            return;
        }

        let parent_inode = core.inodes.get(&parent).unwrap().clone();
        core.geo_dir_remove(parent_inode.block, &name_str)
            .expect("dir_remove failed");
        core.geo_delete_dir(target_inode.block);
        core.inodes.remove(&target_ino);
        reply.ok();
    }

    fn rename(
        &self,
        _req: &Request,
        parent: INodeNo,
        name: &OsStr,
        newparent: INodeNo,
        newname: &OsStr,
        _flags: RenameFlags,
        reply: ReplyEmpty,
    ) {
        let mut core = self.core.lock().unwrap();
        let parent = parent.0;
        let newparent = newparent.0;
        let name_str = name.to_string_lossy().to_string();
        let newname_str = newname.to_string_lossy().to_string();

        let target = core
            .inodes
            .iter()
            .find(|(_, i)| i.parent == parent && i.name == name_str);

        let (target_ino, target_inode) = match target {
            Some((ino, i)) => (*ino, i.clone()),
            None => {
                reply.error(Errno::ENOENT);
                return;
            },
        };

        if parent != newparent {
            reply.error(Errno::EXDEV);
            return;
        }

        // Remove destination if it exists
        let dest = core
            .inodes
            .iter()
            .find(|(_, i)| i.parent == newparent && i.name == newname_str);

        if let Some((dest_ino, dest_inode)) = dest {
            let dest_ino = *dest_ino;
            let dest_inode = dest_inode.clone();
            if dest_inode.kind == FileType::Directory {
                let children = core.geo_dir_list(dest_inode.block);
                if !children.is_empty() {
                    reply.error(Errno::ENOTEMPTY);
                    return;
                }
            }
            let parent_inode = core.inodes.get(&newparent).unwrap().clone();
            core.geo_dir_remove(parent_inode.block, &newname_str).ok();
            if dest_inode.kind == FileType::Directory {
                core.geo_delete_dir(dest_inode.block);
            } else {
                // RegularFile or Symlink — both use file block chain.
                core.geo_delete_file(dest_inode.block);
            }
            core.inodes.remove(&dest_ino);
        }

        // Update name in the child block
        core.geo_write_name(target_inode.block, &newname_str);

        // Remove old entry and insert new entry
        let parent_inode = core.inodes.get(&parent).unwrap().clone();
        core.geo_dir_remove(parent_inode.block, &name_str)
            .expect("dir_remove old");

        let kind = match target_inode.kind {
            FileType::RegularFile => BlockKind::File,
            FileType::Directory => BlockKind::Directory,
            FileType::Symlink => BlockKind::Symlink,
            _ => BlockKind::File,
        };
        core.geo_dir_insert(parent_inode.block, &newname_str, target_inode.block, kind)
            .expect("dir_insert new");

        if let Some(n) = core.inodes.get_mut(&target_ino) {
            n.name = newname_str;
        }
        reply.ok();
    }

    fn statfs(&self, _req: &Request, _ino: INodeNo, reply: ReplyStatfs) {
        reply.statfs(1_000_000, 999_000, 999_000, 4096, 4000, 4096, 255, 4096);
    }

    fn flush(
        &self,
        _req: &Request,
        _ino: INodeNo,
        _fh: fuser::FileHandle,
        _lock_owner: LockOwner,
        reply: ReplyEmpty,
    ) {
        let mut core = self.core.lock().unwrap();
        core.store.flush();
        reply.ok();
    }

    fn fsync(
        &self,
        _req: &Request,
        _ino: INodeNo,
        _fh: fuser::FileHandle,
        _datasync: bool,
        reply: ReplyEmpty,
    ) {
        let mut core = self.core.lock().unwrap();
        core.store.flush();
        reply.ok();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper: create a GeoFuseCore backed by a temp EPL file.
    fn make_core(label: &str) -> (GeoFuseCore, String) {
        let path = format!("/tmp/geos_fuse_test_{}.epl", label);
        let _ = std::fs::remove_file(&path);
        let core = GeoFuseCore::new(&path, 4096, 4096);
        (core, path)
    }

    #[test]
    fn test_fuse_crud_roundtrip() {
        let (mut core, path) = make_core("crud");
        let parent_ino = ROOT_INO;
        let parent_inode = core.inodes.get(&parent_ino).unwrap().clone();

        let name = "hello.txt";
        let block = core.geo_create_file(name);
        core.geo_dir_insert(parent_inode.block, name, block, BlockKind::File)
            .unwrap();

        let file_ino = core.alloc_ino();
        core.inodes.insert(
            file_ino,
            GeoInode {
                ino: file_ino,
                parent: parent_ino,
                block,
                name: name.to_string(),
                kind: FileType::RegularFile,
                file_size: 0,
            },
        );

        // WRITE
        let payload = b"Hello, world!";
        let written = core.write_content(file_ino, 0, payload).expect("write");
        assert_eq!(written as usize, payload.len());

        // READ
        let inode = core.inodes.get(&file_ino).unwrap().clone();
        let content = core.read_content(&inode);
        assert_eq!(&content[..], payload);

        // WRITE at offset (append / patch)
        let patch = b"GeoFS";
        core.write_content(file_ino, 7, patch).unwrap();
        let inode2 = core.inodes.get(&file_ino).unwrap().clone();
        let content2 = core.read_content(&inode2);
        assert_eq!(&content2[..7], b"Hello, ");
        assert_eq!(&content2[7..12], b"GeoFS");
        assert_eq!(&content2[12..], b"!");

        // DELETE
        core.geo_dir_remove(parent_inode.block, name).unwrap();
        core.geo_delete_file(block);
        core.inodes.remove(&file_ino);

        assert!(core.inodes.get(&file_ino).is_none());

        core.store.flush();
        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_fuse_directory_listing() {
        let (mut core, path) = make_core("dirlist");
        let root_ino = ROOT_INO;
        let root_inode = core.inodes.get(&root_ino).unwrap().clone();

        // Create 5 files in root
        for i in 0..5 {
            let name = format!("file_{}.txt", i);
            let block = core.geo_create_file(&name);
            core.geo_dir_insert(root_inode.block, &name, block, BlockKind::File)
                .unwrap();

            let ino = core.alloc_ino();
            core.inodes.insert(
                ino,
                GeoInode {
                    ino,
                    parent: root_ino,
                    block,
                    name,
                    kind: FileType::RegularFile,
                    file_size: 0,
                },
            );
        }

        // Scan directory and collect child names
        core.scan_dir(root_ino);
        let children: Vec<String> = core
            .inodes
            .values()
            .filter(|i| i.parent == root_ino && i.ino != root_ino)
            .map(|i| i.name.clone())
            .collect();

        assert_eq!(children.len(), 5, "should list 5 children");
        for i in 0..5 {
            let expected = format!("file_{}.txt", i);
            assert!(children.contains(&expected), "missing child: {}", expected);
        }

        core.store.flush();
        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_fuse_metadata_stat() {
        let (mut core, path) = make_core("stat");
        let root_ino = ROOT_INO;
        let root_inode = core.inodes.get(&root_ino).unwrap().clone();

        let name = "sized.bin";
        let block = core.geo_create_file(name);
        core.geo_dir_insert(root_inode.block, name, block, BlockKind::File)
            .unwrap();

        let file_ino = core.alloc_ino();
        let inode = GeoInode {
            ino: file_ino,
            parent: root_ino,
            block,
            name: name.to_string(),
            kind: FileType::RegularFile,
            file_size: 0,
        };
        core.inodes.insert(file_ino, inode.clone());

        // Write 100 bytes
        let data = vec![0xAB_u8; 100];
        core.write_content(file_ino, 0, &data).unwrap();

        // Verify stat
        let inode = core.inodes.get(&file_ino).unwrap();
        let attr = GeoFuseCore::make_attr(inode);

        assert_eq!(attr.size, 100, "file size should be 100");
        assert_eq!(attr.kind, FileType::RegularFile);
        assert_eq!(attr.perm, 0o644);
        assert_eq!(attr.blksize, 4096);
        assert_eq!(attr.blocks, (100 + 511) / 512); // 1 block

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_fuse_large_file() {
        let (mut core, path) = make_core("large");
        let root_ino = ROOT_INO;
        let root_inode = core.inodes.get(&root_ino).unwrap().clone();

        let name = "big.bin";
        let block = core.geo_create_file(name);
        core.geo_dir_insert(root_inode.block, name, block, BlockKind::File)
            .unwrap();

        let file_ino = core.alloc_ino();
        core.inodes.insert(
            file_ino,
            GeoInode {
                ino: file_ino,
                parent: root_ino,
                block,
                name: name.to_string(),
                kind: FileType::RegularFile,
                file_size: 0,
            },
        );

        // Write data larger than one block (15,872 bytes per block)
        let data = vec![0xCC_u8; 40000];
        let written = core.write_content(file_ino, 0, &data).unwrap();
        assert_eq!(written as usize, data.len(), "should write all bytes");

        let inode = core.inodes.get(&file_ino).unwrap().clone();
        let read_back = core.read_content(&inode);
        assert_eq!(read_back.len(), data.len());
        assert_eq!(read_back, data);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_fuse_subdirectory_crud() {
        let (mut core, path) = make_core("subdir");
        let root_ino = ROOT_INO;
        let root_inode = core.inodes.get(&root_ino).unwrap().clone();

        // Create a subdirectory
        let dir_name = "mydir";
        let dir_block = core.geo_create_dir(dir_name);
        core.geo_dir_insert(root_inode.block, dir_name, dir_block, BlockKind::Directory)
            .unwrap();

        let dir_ino = core.alloc_ino();
        core.inodes.insert(
            dir_ino,
            GeoInode {
                ino: dir_ino,
                parent: root_ino,
                block: dir_block,
                name: dir_name.to_string(),
                kind: FileType::Directory,
                file_size: 0,
            },
        );

        // Create a file inside the subdirectory
        let file_name = "nested.txt";
        let file_block = core.geo_create_file(file_name);
        core.geo_dir_insert(dir_block, file_name, file_block, BlockKind::File)
            .unwrap();

        let file_ino = core.alloc_ino();
        core.inodes.insert(
            file_ino,
            GeoInode {
                ino: file_ino,
                parent: dir_ino,
                block: file_block,
                name: file_name.to_string(),
                kind: FileType::RegularFile,
                file_size: 0,
            },
        );

        // Write and verify
        let data = b"inside subdir";
        core.write_content(file_ino, 0, data).unwrap();
        let inode = core.inodes.get(&file_ino).unwrap().clone();
        let content = core.read_content(&inode);
        assert_eq!(&content[..], data);

        // rmdir should fail (not empty)
        let children = core.geo_dir_list(dir_block);
        assert!(!children.is_empty());

        // unlink the file, then rmdir should succeed
        core.geo_dir_remove(dir_block, file_name).unwrap();
        core.geo_delete_file(file_block);
        core.inodes.remove(&file_ino);

        core.geo_dir_remove(root_inode.block, dir_name).unwrap();
        core.geo_delete_dir(dir_block);
        core.inodes.remove(&dir_ino);

        assert!(core.inodes.get(&dir_ino).is_none());
        assert!(core.inodes.get(&file_ino).is_none());

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_debug_dir_roundtrip_via_extent() {
        let path = "/tmp/geos_debug_extent.epl";
        let _ = std::fs::remove_file(path);

        // Phase 1: create two dirs and write files in them
        {
            let mut core = GeoFuseCore::new(path, 4096, 4096);
            let root_ino = ROOT_INO;
            let root = core.inodes.get(&root_ino).unwrap().clone();

            // Create "docs" dir
            let docs_block = core.geo_create_dir("docs");
            core.geo_dir_insert(root.block, "docs", docs_block, BlockKind::Directory)
                .unwrap();
            let docs_ino = core.alloc_ino();
            core.inodes.insert(
                docs_ino,
                GeoInode {
                    ino: docs_ino,
                    parent: root_ino,
                    block: docs_block,
                    name: "docs".into(),
                    kind: FileType::Directory,
                    file_size: 0,
                },
            );

            // Create "src" dir
            let src_block = core.geo_create_dir("src");
            core.geo_dir_insert(root.block, "src", src_block, BlockKind::Directory)
                .unwrap();
            let src_ino = core.alloc_ino();
            core.inodes.insert(
                src_ino,
                GeoInode {
                    ino: src_ino,
                    parent: root_ino,
                    block: src_block,
                    name: "src".into(),
                    kind: FileType::Directory,
                    file_size: 0,
                },
            );

            // Verify via dir_list directly
            let entries = core.geo_dir_list(root.block);
            assert_eq!(entries.len(), 2, "phase 1 should find 2 dirs");
            let names: Vec<&str> = entries.iter().map(|(n, _, _)| n.as_str()).collect();
            assert!(names.contains(&"docs"));
            assert!(names.contains(&"src"));

            core.store.flush();
        }

        // Phase 2: reload from EPL and scan again
        {
            let mut core = GeoFuseCore::new(path, 4096, 4096);
            let root = core.inodes.get(&ROOT_INO).unwrap().clone();

            // Verify via dir_list directly (bypassing inode cache)
            let entries = core.geo_dir_list(root.block);
            assert_eq!(
                entries.len(),
                2,
                "phase 2 should find 2 dirs after EPL reload"
            );
            let names: Vec<&str> = entries.iter().map(|(n, _, _)| n.as_str()).collect();
            assert!(names.contains(&"docs"));
            assert!(names.contains(&"src"));

            // Also verify via scan_dir (what FUSE uses)
            core.scan_dir(ROOT_INO);
            let children: Vec<String> = core
                .inodes
                .values()
                .filter(|i| i.parent == ROOT_INO && i.ino != ROOT_INO)
                .map(|i| i.name.clone())
                .collect();
            assert_eq!(children.len(), 2, "scan_dir should find 2 dirs");
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_fuse_persist_and_reload() {
        let path = "/tmp/geos_fuse_test_persist.epl";
        let _ = std::fs::remove_file(path);

        let payload = b"survives restart";

        // Phase 1: create, write, flush
        {
            let mut core = GeoFuseCore::new(path, 4096, 4096);
            let root_ino = ROOT_INO;
            let root_inode = core.inodes.get(&root_ino).unwrap().clone();

            let name = "persist.txt";
            let block = core.geo_create_file(name);
            core.geo_dir_insert(root_inode.block, name, block, BlockKind::File)
                .unwrap();

            let file_ino = core.alloc_ino();
            core.inodes.insert(
                file_ino,
                GeoInode {
                    ino: file_ino,
                    parent: root_ino,
                    block,
                    name: name.to_string(),
                    kind: FileType::RegularFile,
                    file_size: 0,
                },
            );

            core.write_content(file_ino, 0, payload).unwrap();
            core.store.flush();
        }

        // Phase 2: reload from same EPL and read back
        {
            let mut core = GeoFuseCore::new(path, 4096, 4096);
            core.scan_dir(ROOT_INO);
            let children: Vec<_> = core
                .inodes
                .values()
                .filter(|i| i.parent == ROOT_INO && i.ino != ROOT_INO)
                .collect();
            assert_eq!(children.len(), 1, "should find 1 file after reload");
            let file = &children[0];
            assert_eq!(file.name, "persist.txt");
            let content = core.geo_read_file(file.block);
            assert_eq!(&content[..], payload);
        }

        let _ = std::fs::remove_file(path);
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 2 {
        eprintln!("GeoFS FUSE Mount");
        eprintln!();
        eprintln!("Usage: geos_fuse <mountpoint> [options]");
        eprintln!();
        eprintln!("Options:");
        eprintln!("  --epl <path>      EPL store path (default: ~/.geometry_os/tile_store.epl)");
        eprintln!("  --root-x <n>      Root X coordinate (default: 4096)");
        eprintln!("  --root-y <n>      Root Y coordinate (default: 4096)");
        eprintln!();
        eprintln!("Example:");
        eprintln!("  mkdir -p /mnt/geos");
        eprintln!("  geos_fuse /mnt/geos");
        std::process::exit(1);
    }

    let mountpoint = &args[1];
    let mut epl_path = None;
    let mut root_x: i32 = 4096;
    let mut root_y: i32 = 4096;

    let mut i = 2;
    while i < args.len() {
        match args[i].as_str() {
            "--epl" => {
                epl_path = args.get(i + 1).cloned();
                i += 2;
            },
            "--root-x" => {
                root_x = args
                    .get(i + 1)
                    .and_then(|s| s.parse().ok())
                    .unwrap_or(root_x);
                i += 2;
            },
            "--root-y" => {
                root_y = args
                    .get(i + 1)
                    .and_then(|s| s.parse().ok())
                    .unwrap_or(root_y);
                i += 2;
            },
            _ => {
                eprintln!("Unknown option: {}", args[i]);
                std::process::exit(1);
            },
        }
    }

    let epl = epl_path.unwrap_or_else(|| {
        let home = std::env::var("HOME").unwrap_or_else(|_| ".".into());
        format!("{}/.geometry_os/tile_store.epl", home)
    });

    if !Path::new(mountpoint).exists() {
        eprintln!("geos_fuse: mountpoint does not exist: {}", mountpoint);
        std::process::exit(1);
    }

    eprintln!("geos_fuse: mounting on {}", mountpoint);
    eprintln!("geos_fuse: EPL: {}", epl);
    eprintln!("geos_fuse: root: ({}, {})", root_x, root_y);

    let fs = GeoFuse::new(&epl, root_x, root_y);

    let mut config = fuser::Config::default();
    config.mount_options = vec![
        MountOption::FSName("geos".to_string()),
        MountOption::DefaultPermissions,
    ];
    config.acl = SessionACL::Owner;

    match fuser::mount2(fs, Path::new(mountpoint), &config) {
        Ok(()) => eprintln!("geos_fuse: clean unmount"),
        Err(e) => {
            eprintln!("geos_fuse: error: {}", e);
            std::process::exit(1);
        },
    }
}
