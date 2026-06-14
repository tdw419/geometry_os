#!/usr/bin/env python3
"""
VastFS — Tiled Pixel Storage for Geometry OS.
Scales PixelFS to GB+ range using multiple PNG tiles.

Each tile is a square PNG (e.g., 512x512 = 1MB raw).
A grid of 32x32 tiles = 1GB of storage.
Addressing uses a Hilbert curve within each tile for locality.
"""

import os, sys, struct, time, errno, threading, json
from PIL import Image
from functools import lru_cache
from stat import S_IFDIR, S_IFREG

# ... (d2xy and TileStore classes stay the same)

# ─── Hilbert Curve ──────────────────────────────────────────────────

def d2xy(n, d):
    """Hilbert curve: convert 1D index d to 2D (x,y) in n×n space."""
    x, y, t, s = 0, 0, d, 1
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x, y = s - 1 - x, s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y

# ─── Tile Store ─────────────────────────────────────────────────────

class TileStore:
    def __init__(self, root_dir, tile_size=512):
        self.root_dir = root_dir
        self.tile_size = tile_size
        self.pixels_per_tile = tile_size * tile_size
        self.cache = {}
        self.lock = threading.Lock()
        self.dirty_tiles = set()
        
        if not os.path.exists(root_dir):
            os.makedirs(root_dir)

    def _get_tile_path(self, idx):
        return os.path.join(self.root_dir, f"tile_{idx:04d}.png")

    def _load_tile(self, idx):
        path = self._get_tile_path(idx)
        if idx in self.cache:
            return self.cache[idx]
        
        if os.path.exists(path):
            img = Image.open(path).convert('RGBA')
            pixels = list(img.getdata())
        else:
            pixels = [(0, 0, 0, 0)] * self.pixels_per_tile
            
        self.cache[idx] = pixels
        return pixels

    def read_word(self, pixel_idx):
        with self.lock:
            t_idx = pixel_idx // self.pixels_per_tile
            l_idx = pixel_idx % self.pixels_per_tile
            pixels = self._load_tile(t_idx)
            
            lx, ly = d2xy(self.tile_size, l_idx)
            pix = pixels[ly * self.tile_size + lx]
            r, g, b, a = pix
            return (r << 24) | (g << 16) | (b << 8) | a

    def write_word(self, pixel_idx, word):
        with self.lock:
            t_idx = pixel_idx // self.pixels_per_tile
            l_idx = pixel_idx % self.pixels_per_tile
            pixels = self._load_tile(t_idx)
            
            lx, ly = d2xy(self.tile_size, l_idx)
            r = (word >> 24) & 0xFF
            g = (word >> 16) & 0xFF
            b = (word >> 8) & 0xFF
            a = word & 0xFF
            pixels[ly * self.tile_size + lx] = (r, g, b, a)
            self.dirty_tiles.add(t_idx)

    def read_bytes(self, start_pixel, count):
        result = bytearray()
        pixels_needed = (count + 3) // 4
        for i in range(pixels_needed):
            w = self.read_word(start_pixel + i)
            result.extend(struct.pack('>I', w))
        return bytes(result[:count])

    def write_bytes(self, start_pixel, data):
        padded = data + b'\x00' * ((4 - len(data) % 4) % 4)
        for i in range(0, len(padded), 4):
            word = struct.unpack('>I', padded[i:i+4])[0]
            self.write_word(start_pixel + i // 4, word)

    def flush(self):
        with self.lock:
            for idx in self.dirty_tiles:
                pixels = self.cache[idx]
                img = Image.new('RGBA', (self.tile_size, self.tile_size))
                img.putdata(pixels)
                img.save(self._get_tile_path(idx))
            self.dirty_tiles.clear()

# ─── Filesystem Logic ──────────────────────────────────────────────

MAGIC = 0x56415354  # "VAST"
INODE_SIZE = 1032    # Pixels per inode
MAX_BLOCKS_PER_INODE = 1024

class Superblock:
    def __init__(self, store):
        self.store = store
        self.block_size = 1024  # 4KB per block
        self.total_blocks = 0
        self.free_blocks = 0
        self.inode_count = 1024
        self.data_start = 0

    def read(self):
        if self.store.read_word(0) != MAGIC:
            raise Exception("Invalid VAST magic")
        self.block_size = self.store.read_word(1)
        self.total_blocks = self.store.read_word(2)
        self.free_blocks = self.store.read_word(3)
        self.inode_count = self.store.read_word(4)
        self.data_start = 5 + self.inode_count * INODE_SIZE

    def write(self):
        self.store.write_word(0, MAGIC)
        self.store.write_word(1, self.block_size)
        self.store.write_word(2, self.total_blocks)
        self.store.write_word(3, self.free_blocks)
        self.store.write_word(4, self.inode_count)

    def block_pixel(self, bidx):
        return self.data_start + bidx * self.block_size

    def block_bytes(self):
        return self.block_size * 4

def make_inode(type_mode, size, blocks, name_hash):
    return {
        'type_mode': type_mode,
        'size': size,
        'blocks': blocks[:MAX_BLOCKS_PER_INODE] + [0] * max(0, MAX_BLOCKS_PER_INODE - len(blocks)),
        'name_hash': name_hash,
    }

def read_inode(store, sb, idx):
    base = 5 + idx * INODE_SIZE
    type_mode = store.read_word(base)
    size = store.read_word(base + 1)
    blocks = [store.read_word(base + 2 + i) for i in range(MAX_BLOCKS_PER_INODE)]
    name_hash = store.read_word(base + 2 + MAX_BLOCKS_PER_INODE)
    return make_inode(type_mode, size, blocks, name_hash)

def write_inode(store, sb, idx, inode):
    base = 5 + idx * INODE_SIZE
    store.write_word(base, inode['type_mode'])
    store.write_word(base + 1, inode['size'])
    for i in range(MAX_BLOCKS_PER_INODE):
        store.write_word(base + 2 + i, inode['blocks'][i] if i < len(inode['blocks']) else 0)
    store.write_word(base + 2 + MAX_BLOCKS_PER_INODE, inode['name_hash'])

def alloc_block(store, sb):
    for b in range(sb.total_blocks):
        px = sb.block_pixel(b)
        if store.read_word(px) == 0:
            store.write_word(px, 0x56535400 | (b + 1))
            sb.free_blocks -= 1
            sb.write()
            return b + 1
    return -1

def fnv1a(data):
    h = 0x811c9dc5
    for b in data:
        h ^= b
        h = (h * 0x01000193) & 0xFFFFFFFF
    return h

def dir_entries(store, sb, inode):
    entries = []
    for bidx in inode['blocks']:
        if bidx == 0: continue
        px = sb.block_pixel(bidx - 1)
        data = store.read_bytes(px, sb.block_bytes())
        pos = 0
        while pos < len(data):
            if pos + 4 > len(data): break
            name_len = struct.unpack('>I', data[pos:pos+4])[0]
            if name_len == 0: break
            name_padded = ((name_len + 3) // 4) * 4
            if pos + 4 + name_padded + 4 > len(data): break
            name = data[pos+4:pos+4+name_len].decode('utf-8', errors='replace')
            inode_idx = struct.unpack('>I', data[pos+4+name_padded:pos+4+name_padded+4])[0]
            if inode_idx > 0:
                entries.append((name, inode_idx))
            pos += 4 + name_padded + 4
    return entries

def dir_add_entry(store, sb, inode, inode_idx, name):
    name_bytes = name.encode('utf-8')
    name_len = len(name_bytes)
    name_padded = ((name_len + 3) // 4) * 4
    entry_data = struct.pack('>I', name_len) + name_bytes + b'\x00' * (name_padded - name_len) + struct.pack('>I', inode_idx)
    
    for i, bidx in enumerate(inode['blocks']):
        if bidx == 0:
            bidx = alloc_block(store, sb)
            if bidx < 0: return False
            inode['blocks'][i] = bidx
            write_inode(store, sb, 0, inode) # Assuming root for now
        
        px = sb.block_pixel(bidx - 1)
        data = bytearray(store.read_bytes(px, sb.block_bytes()))
        pos = 0
        while pos < len(data):
            nlen = struct.unpack('>I', data[pos:pos+4])[0]
            if nlen == 0:
                if pos + len(entry_data) <= len(data):
                    data[pos:pos+len(entry_data)] = entry_data
                    store.write_bytes(px, data)
                    return True
                break
            name_padded_existing = ((nlen + 3) // 4) * 4
            pos += 4 + name_padded_existing + 4
    return False

# ─── FUSE Operations ───────────────────────────────────────────────

def make_fuse_class(vfs):
    import fuse
    class Ops(fuse.Operations):
        def getattr(self, path, fh=None):
            idx = vfs._resolve(path)
            if idx < 0: raise fuse.FuseOSError(errno.ENOENT)
            inode = read_inode(vfs.store, vfs.sb, idx)
            is_dir = (inode['type_mode'] & 0o170000) == S_IFDIR
            return {
                'st_mode': inode['type_mode'],
                'st_nlink': 2 if is_dir else 1,
                'st_size': inode['size'],
                'st_uid': os.getuid(), 'st_gid': os.getgid(),
                'st_atime': int(time.time()), 'st_mtime': int(time.time()), 'st_ctime': int(time.time()),
            }

        def readdir(self, path, fh):
            idx = vfs._resolve(path)
            inode = read_inode(vfs.store, vfs.sb, idx)
            entries = dir_entries(vfs.store, vfs.sb, inode)
            return ['.', '..'] + [name for name, _ in entries]

        def read(self, path, size, offset, fh):
            idx = vfs._resolve(path)
            inode = read_inode(vfs.store, vfs.sb, idx)
            if offset >= inode['size']: return b''
            
            result = bytearray()
            rem = min(size, inode['size'] - offset)
            curr_off = offset
            
            while rem > 0:
                b_idx = curr_off // vfs.sb.block_bytes()
                b_off = curr_off % vfs.sb.block_bytes()
                if b_idx >= len(inode['blocks']) or inode['blocks'][b_idx] == 0: break
                
                px = vfs.sb.block_pixel(inode['blocks'][b_idx] - 1)
                chunk_size = min(rem, vfs.sb.block_bytes() - b_off)
                data = vfs.store.read_bytes(px, vfs.sb.block_bytes())
                result.extend(data[b_off:b_off+chunk_size])
                curr_off += chunk_size
                rem -= chunk_size
            return bytes(result)

        def write(self, path, data, offset, fh):
            idx = vfs._resolve(path)
            inode = read_inode(vfs.store, vfs.sb, idx)
            
            curr_off = offset
            rem = len(data)
            
            while rem > 0:
                b_idx = curr_off // vfs.sb.block_bytes()
                b_off = curr_off % vfs.sb.block_bytes()
                if b_idx >= MAX_BLOCKS_PER_INODE:
                    data = data[:curr_off - offset]
                    rem = 0
                    break
                
                if inode['blocks'][b_idx] == 0:
                    bidx = alloc_block(vfs.store, vfs.sb)
                    if bidx < 0:
                        data = data[:curr_off - offset]
                        rem = 0
                        break
                    inode['blocks'][b_idx] = bidx
                
                px = vfs.sb.block_pixel(inode['blocks'][b_idx] - 1)
                chunk_size = min(rem, vfs.sb.block_bytes() - b_off)
                
                bdata = bytearray(vfs.store.read_bytes(px, vfs.sb.block_bytes()))
                bdata[b_off:b_off+chunk_size] = data[len(data)-rem:len(data)-rem+chunk_size]
                vfs.store.write_bytes(px, bdata)
                
                curr_off += chunk_size
                rem -= chunk_size
                
            inode['size'] = max(inode['size'], offset + len(data))
            write_inode(vfs.store, vfs.sb, idx, inode)
            vfs.store.flush()
            return len(data)

        def create(self, path, mode, fi=None):
            idx = vfs._alloc_inode()
            if idx < 0: raise fuse.FuseOSError(errno.ENOSPC)
            name = os.path.basename(path)
            parent_idx = vfs._resolve(os.path.dirname(path))
            parent_inode = read_inode(vfs.store, vfs.sb, parent_idx)
            
            inode = make_inode(S_IFREG | mode, 0, [], fnv1a(name.encode()))
            write_inode(vfs.store, vfs.sb, idx, inode)
            dir_add_entry(vfs.store, vfs.sb, parent_inode, idx, name)
            write_inode(vfs.store, vfs.sb, parent_idx, parent_inode)
            vfs.store.flush()
            return 0

        def mkdir(self, path, mode):
            idx = vfs._alloc_inode()
            name = os.path.basename(path)
            parent_idx = vfs._resolve(os.path.dirname(path))
            parent_inode = read_inode(vfs.store, vfs.sb, parent_idx)
            inode = make_inode(S_IFDIR | mode, 0, [], fnv1a(name.encode()))
            write_inode(vfs.store, vfs.sb, idx, inode)
            dir_add_entry(vfs.store, vfs.sb, parent_inode, idx, name)
            write_inode(vfs.store, vfs.sb, parent_idx, parent_inode)
            vfs.store.flush()

    return Ops

class VastFS:
    def __init__(self, store, sb):
        self.store = store
        self.sb = sb
    def _resolve(self, path):
        parts = [p for p in path.strip('/').split('/') if p]
        if not parts: return 0
        current = 0
        for part in parts:
            inode = read_inode(self.store, self.sb, current)
            if not (inode['type_mode'] & S_IFDIR): return -1
            entries = dir_entries(self.store, self.sb, inode)
            found = False
            for name, idx in entries:
                if name == part:
                    current = idx
                    found = True; break
            if not found: return -1
        return current
    def _alloc_inode(self):
        for i in range(self.sb.inode_count):
            if read_inode(self.store, self.sb, i)['type_mode'] == 0: return i
        return -1

def cmd_mkfs(root_dir, total_gb=1):
    tile_size = 512 # 1MB raw per tile
    pixels_per_tile = tile_size * tile_size
    total_pixels = (total_gb * 1024 * 1024 * 1024) // 4
    num_tiles = (total_pixels + pixels_per_tile - 1) // pixels_per_tile
    
    store = TileStore(root_dir, tile_size)
    sb = Superblock(store)
    sb.inode_count = 1024
    sb.block_size = 256 # 1KB
    sb.total_blocks = (total_pixels - (5 + sb.inode_count * INODE_SIZE)) // sb.block_size
    sb.free_blocks = sb.total_blocks
    sb.write()
    
    root_inode = make_inode(S_IFDIR | 0o755, 0, [], fnv1a(b'/'))
    write_inode(store, sb, 0, root_inode)
    store.flush()
    print(f"VastFS created in {root_dir}. Total capacity: {total_gb}GB")

def cmd_mount(root_dir, mount_point):
    import fuse
    store = TileStore(root_dir)
    sb = Superblock(store); sb.read()
    vfs = VastFS(store, sb)
    fuse.FUSE(make_fuse_class(vfs)(), mount_point, foreground=True, nothreads=True)

if __name__ == '__main__':
    if len(sys.argv) < 3: print("Usage: vastfs <mkfs|mount> <root_dir> [mount_point]"); sys.exit(1)
    if sys.argv[1] == 'mkfs': cmd_mkfs(sys.argv[2])
    elif sys.argv[1] == 'mount': cmd_mount(sys.argv[2], sys.argv[3])

