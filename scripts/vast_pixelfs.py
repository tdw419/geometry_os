#!/usr/bin/env python3
"""
PixelFS — Mount a .rts.png as a FUSE filesystem on Ubuntu.

Pixels ARE the disk. Each RGBA pixel = 4 bytes of raw storage.
A 256x256 PNG = 256KB, 512x512 = 1MB, 1024x1024 = 4MB.

Layout (all values big-endian u32 per pixel):
  Pixel 0:     Magic (0x50465331 = "PFS1")
  Pixel 1:     Superblock: block_size (pixels per block), total_blocks, free_blocks, inode_count
  Pixel 2..N:  Inode table (each inode = 8 pixels = 32 bytes)
  Pixel N+1..: Data blocks

Inode format (8 pixels = 32 bytes):
  Pixel 0: type (1=file, 2=dir) | permissions (0x00FFFF00 = mode)
  Pixel 1: size (bytes)
  Pixel 2: block[0] (pixel index into data region)
  Pixel 3: block[1]
  Pixel 4: block[2]
  Pixel 5: block[3]
  Pixel 6: block[4]  (5 blocks × block_size pixels = max file size)
  Pixel 7: name_hash (FNV-1a of filename)

Directory entries stored in data blocks:
  Each entry: 4 bytes name_len | name_bytes (padded to 4) | 4 bytes inode_idx

Usage:
  python3 scripts/pixelfs mount image.rts.png /mnt/pixel
  python3 scripts/pixelfs mkfs image.rts.png [--size 512]
  python3 scripts/pixelfs stat image.rts.png
  fusermount3 -u /mnt/pixel
"""

import os, sys, struct, time, errno, threading
from PIL import Image
from functools import lru_cache

MAGIC = 0x50465331  # "PFS1"
MAX_BLOCKS_PER_INODE = 64   # blocks per file (direct pointers; indirect blocks for larger)
# Inode layout: type_mode(1) + size(1) + blocks(MAX_BLOCKS) + name_hash(1)
INODE_SIZE = 2 + MAX_BLOCKS_PER_INODE + 1  # 67 pixels per inode
DIR_ENTRY_FIXED = 8  # name_len(4) + inode_idx(4)
MAX_NAME_LEN = 240
COMPRESSED_FLAG = 0x80000000  # high bit of block pointer = compressed block
COMPRESSED_POOL_HEADER = 7    # superblock now 7 words (word 6 = compressed_pool_ptr)

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
    """Read/write big-endian u32 words to a directory of PNG tiles."""

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
            self.w, self.h = img.size
            if self.w != self.tile_size:
                raise Exception(f"Tile size mismatch: expected {self.tile_size}, got {self.w}")
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
            
            # Use Hilbert mapping for local coords
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



# ─── Superblock ────────────────────────────────────────────────────

class Superblock:
    def __init__(self, store):
        self.store = store
        self.block_size = 64   # pixels per block (256 bytes)
        self.total_blocks = 0
        self.free_blocks = 0
        self.inode_count = 0
        self.inode_table_start = 0
        self.data_start = 0
        self.next_free_block = 1  # hint: start scanning here
        self.compressed_pool_ptr = 0  # next free pixel in compressed pool

    def read(self):
        magic = self.store.read_word(0)
        if magic != MAGIC:
            raise ValueError(f"Not a PixelFS image (magic={magic:#x}, expected {MAGIC:#x})")
        self.block_size = self.store.read_word(1)
        self.total_blocks = self.store.read_word(2)
        self.free_blocks = self.store.read_word(3)
        self.inode_count = self.store.read_word(4)
        self.next_free_block = self.store.read_word(5)
        if self.next_free_block == 0:
            self.next_free_block = 1
        self.compressed_pool_ptr = self.store.read_word(6)
        self.inode_table_start = COMPRESSED_POOL_HEADER
        self.data_start = self.inode_table_start + self.inode_count * INODE_SIZE

    def write(self):
        self.store.write_word(0, MAGIC)
        self.store.write_word(1, int(self.block_size))
        self.store.write_word(2, int(self.total_blocks))
        self.store.write_word(3, int(self.free_blocks))
        self.store.write_word(4, int(self.inode_count))
        self.store.write_word(5, int(self.next_free_block))
        self.store.write_word(6, int(self.compressed_pool_ptr))
        # Recompute derived fields
        self.inode_table_start = COMPRESSED_POOL_HEADER
        self.data_start = self.inode_table_start + self.inode_count * INODE_SIZE

    def compressed_pool_start(self):
        """Compressed pool lives after all raw data blocks."""
        return self.data_start + self.total_blocks * self.block_size

    def block_pixel(self, block_idx):
        """Convert 1-based block index to start pixel index."""
        return self.data_start + (block_idx - 1) * self.block_size

    def block_bytes(self):
        return self.block_size * 4


# ─── Inode ─────────────────────────────────────────────────────────

S_IFREG = 0o100000
S_IFDIR = 0o040000

def make_inode(type_mode, size, blocks, name_hash):
    return {
        'type_mode': type_mode,
        'size': size,
        'blocks': blocks[:MAX_BLOCKS_PER_INODE] + [0] * max(0, MAX_BLOCKS_PER_INODE - len(blocks)),
        'name_hash': name_hash,
    }

def read_inode(store, sb, idx):
    base = sb.inode_table_start + idx * INODE_SIZE
    type_mode = store.read_word(base)
    size = store.read_word(base + 1)
    blocks = [store.read_word(base + 2 + i) for i in range(MAX_BLOCKS_PER_INODE)]
    name_hash = store.read_word(base + 2 + MAX_BLOCKS_PER_INODE)
    return make_inode(type_mode, size, blocks, name_hash)

def write_inode(store, sb, idx, inode):
    base = sb.inode_table_start + idx * INODE_SIZE
    store.write_word(base, inode['type_mode'])
    store.write_word(base + 1, inode['size'])
    for i in range(MAX_BLOCKS_PER_INODE):
        store.write_word(base + 2 + i, inode['blocks'][i] if i < len(inode['blocks']) else 0)
    store.write_word(base + 2 + MAX_BLOCKS_PER_INODE, inode['name_hash'])


# ─── Block allocator ───────────────────────────────────────────────

def alloc_block(store, sb):
    """Find a free block using next_free_block hint. Returns 1-based block index or -1."""
    start = sb.next_free_block - 1  # 0-based start
    for i in range(sb.total_blocks):
        b = (start + i) % sb.total_blocks
        px = sb.block_pixel(b + 1)
        if store.read_word(px) == 0:
            # Zero-initialize the entire block
            for j in range(sb.block_size):
                store.write_word(px + j, 0)
            sb.free_blocks -= 1
            sb.next_free_block = b + 2  # hint for next scan
            sb.write()
            return b + 1
    return -1

def free_block(store, sb, block_idx):
    """Zero out a block to free it. block_idx is 1-based."""
    px = sb.block_pixel(block_idx)
    for i in range(sb.block_size):
        store.write_word(px + i, 0)
    sb.free_blocks += 1
    sb.write()


# ─── Block RLE Compression ────────────────────────────────────────

def rle_compress(data):
    """RLE compress byte data using 4-byte word grouping.
    Returns list of (value_word, count) runs.
    
    Word-level RLE is much more efficient than byte-level because
    each pixel already stores a 32-bit value.
    """
    if not data:
        return []
    # Pad to word boundary
    padded = data + b'\x00' * ((4 - len(data) % 4) % 4)
    words = []
    for i in range(0, len(padded), 4):
        words.append(struct.unpack('>I', padded[i:i+4])[0])
    
    runs = []
    for w in words:
        if runs and runs[-1][0] == w:
            runs[-1] = (w, runs[-1][1] + 1)
        else:
            runs.append((w, 1))
    return runs

def rle_decompress(runs, target_size):
    """Decompress word-level RLE runs back to bytes."""
    result = bytearray()
    for val, count in runs:
        result.extend(struct.pack('>I', val) * count)
    return bytes(result[:target_size])

def compress_block(store, sb, block_data):
    """Compress a block's data and store in compressed pool.
    Returns compressed block pointer (with COMPRESSED_FLAG set) or -1 if no savings."""
    runs = rle_compress(block_data)
    
    # Calculate compressed size: [num_runs(1)] [val(1), count(1)] × num_runs
    compressed_words = 1 + len(runs) * 2
    
    # Only compress if we save at least 95% of the block
    # (effectively disabled — TileStore already stores zeros as transparent pixels,
    #  so RLE doesn't help. Threshold kept for future compression algorithms.)
    if compressed_words >= sb.block_size * 5 // 100:
        return -1
    
    # Write to compressed pool
    pool_start = sb.compressed_pool_start()
    if sb.compressed_pool_ptr == 0:
        ptr = pool_start
    else:
        ptr = sb.compressed_pool_ptr
    
    store.write_word(ptr, len(runs))  # num_runs header
    for i, (val, count) in enumerate(runs):
        store.write_word(ptr + 1 + i * 2, val)
        store.write_word(ptr + 2 + i * 2, count)
    
    # Advance pool pointer
    sb.compressed_pool_ptr = ptr + compressed_words
    sb.write()
    
    # Return pointer with compressed flag
    # The pointer value is the pool offset (relative to pool_start)
    pool_offset = ptr - pool_start
    return COMPRESSED_FLAG | pool_offset

def decompress_block(store, sb, compressed_ptr):
    """Decompress a compressed block. Returns the raw block data."""
    # Remove flag to get pool offset
    pool_offset = compressed_ptr & ~COMPRESSED_FLAG
    pool_start = sb.compressed_pool_start()
    ptr = pool_start + pool_offset
    
    num_runs = store.read_word(ptr)
    runs = []
    for i in range(num_runs):
        val = store.read_word(ptr + 1 + i * 2)
        count = store.read_word(ptr + 2 + i * 2)
        runs.append((val, count))
    
    return rle_decompress(runs, sb.block_bytes())

def is_compressed(block_ptr):
    """Check if a block pointer has the compressed flag."""
    return (block_ptr & COMPRESSED_FLAG) != 0

def read_block_data(store, sb, block_ptr):
    """Read raw block data, handling both compressed and uncompressed blocks."""
    if block_ptr == 0:
        return bytes(sb.block_bytes())  # unallocated = all zeros
    if is_compressed(block_ptr):
        return decompress_block(store, sb, block_ptr)
    # Raw block
    px = sb.block_pixel(block_ptr)
    return store.read_bytes(px, sb.block_bytes())

def write_block_data(store, sb, block_ptr, data):
    """Write block data, attempting compression first."""
    if len(data) < sb.block_bytes():
        data = data + b'\x00' * (sb.block_bytes() - len(data))
    
    # Try compression
    compressed_ptr = compress_block(store, sb, data)
    if compressed_ptr >= 0:
        # Free the raw block if we had one
        if block_ptr > 0 and not is_compressed(block_ptr):
            free_block(store, sb, block_ptr)
        return compressed_ptr  # Return new compressed pointer
    
    # Fall back to raw write
    if is_compressed(block_ptr):
        # Was compressed, now needs raw block — allocate one
        # (compressed pool space is wasted, acceptable for now)
        block_ptr = alloc_block(store, sb)
        if block_ptr < 0:
            return -1
    px = sb.block_pixel(block_ptr)
    store.write_bytes(px, data)
    return block_ptr


# ─── Directory operations ──────────────────────────────────────────

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
        data = read_block_data(store, sb, bidx)
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

def dir_add_entry(store, sb, inode, inode_idx, name, parent_inode_idx):
    name_bytes = name.encode('utf-8')
    name_len = len(name_bytes)
    name_padded = ((name_len + 3) // 4) * 4
    entry_size = 4 + name_padded + 4
    entry_data = struct.pack('>I', name_len) + name_bytes + b'\x00' * (name_padded - name_len) + struct.pack('>I', inode_idx)

    for bi, bidx in enumerate(inode['blocks']):
        if bidx == 0:
            bidx = alloc_block(store, sb)
            if bidx < 0: return False
            inode['blocks'][bi] = bidx
            write_inode(store, sb, parent_inode_idx, inode)
            # Fresh block — write entry directly at position 0
            new_ptr = write_block_data(store, sb, bidx, entry_data + b'\x00' * (sb.block_bytes() - len(entry_data)))
            if new_ptr != bidx and is_compressed(new_ptr):
                inode['blocks'][bi] = new_ptr
                write_inode(store, sb, parent_inode_idx, inode)
            return True
        
        data = bytearray(read_block_data(store, sb, bidx))
        pos = 0
        while pos < len(data):
            nl = struct.unpack('>I', data[pos:pos+4])[0]
            if nl == 0:
                if pos + entry_size <= len(data):
                    data[pos:pos+entry_size] = entry_data
                    new_ptr = write_block_data(store, sb, bidx, bytes(data))
                    if new_ptr != bidx:
                        inode['blocks'][bi] = new_ptr
                        write_inode(store, sb, parent_inode_idx, inode)
                    return True
                break
            np = ((nl + 3) // 4) * 4
            pos += 4 + np + 4
    return False

def dir_remove_entry(store, sb, inode, name, parent_inode_idx):
    found = False
    for bi, bidx in enumerate(inode['blocks']):
        if bidx == 0: continue
        data = bytearray(read_block_data(store, sb, bidx))
        entries = []
        pos = 0
        while pos < len(data):
            if pos + 4 > len(data): break
            name_len = struct.unpack('>I', data[pos:pos+4])[0]
            if name_len == 0 or name_len > MAX_NAME_LEN: break
            name_padded = ((name_len + 3) // 4) * 4
            entry_end = pos + 4 + name_padded + 4
            if entry_end > len(data): break
            entry_name = data[pos+4:pos+4+name_len].decode('utf-8', errors='replace')
            if entry_name == name: found = True
            else: entries.append(bytes(data[pos:entry_end]))
            pos = entry_end
        if found:
            new_data = b''.join(entries)
            padded = new_data + b'\x00' * (sb.block_bytes() - len(new_data))
            new_ptr = write_block_data(store, sb, bidx, padded[:sb.block_bytes()])
            if new_ptr != bidx:
                inode['blocks'][bi] = new_ptr
                write_inode(store, sb, parent_inode_idx, inode)
            return True
    return False


# ─── FUSE Operations ───────────────────────────────────────────────

class PixelFS:
    def __init__(self, store, sb):
        self.store = store
        self.sb = sb

    def _resolve(self, path):
        """Walk path from root (inode 0). Returns inode index or -1."""
        parts = [p for p in path.strip('/').split('/') if p]
        if not parts:
            return 0  # root

        current = 0
        for part in parts:
            inode = read_inode(self.store, self.sb, current)
            if (inode['type_mode'] & 0o170000) != S_IFDIR:
                return -1
            entries = dir_entries(self.store, self.sb, inode)
            found = False
            for name, idx in entries:
                if name == part:
                    current = idx
                    found = True
                    break
            if not found:
                return -1
        return current

    def _alloc_inode(self):
        """Find a free inode slot. Only reads type_mode (1 word) per slot."""
        for i in range(self.sb.inode_count):
            base = self.sb.inode_table_start + i * INODE_SIZE
            if self.store.read_word(base) == 0:
                return i
        return -1

    def getattr(self, path):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        now = int(time.time())
        is_dir = (inode['type_mode'] & 0o170000) == S_IFDIR
        return {
            'st_mode': inode['type_mode'] | (0o755 if is_dir else 0o644),
            'st_nlink': 2 if is_dir else 1,
            'st_size': inode['size'],
            'st_uid': os.getuid(),
            'st_gid': os.getgid(),
            'st_atime': now,
            'st_mtime': now,
            'st_ctime': now,
            'st_ino': idx,
        }

    def readdir(self, path):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        entries = dir_entries(self.store, self.sb, inode)
        result = ['.', '..']
        for name, _ in entries:
            result.append(name)
        return result

    def read(self, path, size, offset):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        if offset >= inode['size']:
            return b''
        remaining = min(size, inode['size'] - offset)
        result = bytearray()
        bpb = self.sb.block_bytes()

        for bi, bidx in enumerate(inode['blocks']):
            if bidx == 0 or remaining <= 0:
                continue
            block_start = bi * bpb
            block_end = block_start + bpb
            if block_end <= offset:
                continue
            if block_start >= offset + remaining:
                break

            block_data = read_block_data(self.store, self.sb, bidx)

            skip = max(0, offset - block_start)
            take = min(bpb - skip, remaining - len(result))
            result.extend(block_data[skip:skip + take])

        return bytes(result[:remaining])

    def write(self, path, data, offset):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        bpb = self.sb.block_bytes()

        # Extend file if needed
        end = offset + len(data)
        if end > inode['size']:
            inode['size'] = end

        # Allocate blocks as needed
        blocks_needed = (end + bpb - 1) // bpb
        for i in range(blocks_needed):
            if i < MAX_BLOCKS_PER_INODE and inode['blocks'][i] == 0:
                b = alloc_block(self.store, self.sb)
                if b < 0:
                    return -errno.ENOSPC
                inode['blocks'][i] = b

        # Write data block by block
        written = 0
        block_idx = offset // bpb
        block_offset = offset % bpb

        while written < len(data):
            if block_idx >= MAX_BLOCKS_PER_INODE:
                break
            bidx = inode['blocks'][block_idx]
            if bidx == 0:
                break

            chunk = data[written:written + bpb - block_offset]

            if block_offset == 0 and len(chunk) == bpb:
                # Full block write
                new_ptr = write_block_data(self.store, self.sb, bidx, bytes(chunk))
            else:
                # Partial block — read-modify-write
                existing = bytearray(read_block_data(self.store, self.sb, bidx))
                existing[block_offset:block_offset + len(chunk)] = chunk
                new_ptr = write_block_data(self.store, self.sb, bidx, bytes(existing))

            if new_ptr != bidx:
                inode['blocks'][block_idx] = new_ptr

            written += len(chunk)
            block_idx += 1
            block_offset = 0

        write_inode(self.store, self.sb, idx, inode)
        self.store.flush()
        return written

    def create(self, path, mode):
        parent = '/'.join(path.strip('/').split('/')[:-1]) or '/'
        name = path.strip('/').split('/')[-1]

        parent_idx = self._resolve(parent)
        if parent_idx < 0:
            return -errno.ENOENT

        # Check if already exists
        if self._resolve(path) >= 0:
            return -errno.EEXIST

        new_idx = self._alloc_inode()
        if new_idx < 0:
            return -errno.ENOSPC

        # Create inode
        inode = make_inode(S_IFREG, 0, [], fnv1a(name.encode()))
        write_inode(self.store, self.sb, new_idx, inode)

        # Add to parent directory
        parent_inode = read_inode(self.store, self.sb, parent_idx)
        if not dir_add_entry(self.store, self.sb, parent_inode, new_idx, name, parent_idx):
            return -errno.ENOSPC

        # Don't flush here — save to PNG on release/fsync only
        return 0

    def mkdir(self, path, mode):
        parent = '/'.join(path.strip('/').split('/')[:-1]) or '/'
        name = path.strip('/').split('/')[-1]

        parent_idx = self._resolve(parent)
        if parent_idx < 0:
            return -errno.ENOENT

        new_idx = self._alloc_inode()
        if new_idx < 0:
            return -errno.ENOSPC

        inode = make_inode(S_IFDIR, 0, [], fnv1a(name.encode()))
        write_inode(self.store, self.sb, new_idx, inode)

        parent_inode = read_inode(self.store, self.sb, parent_idx)
        dir_add_entry(self.store, self.sb, parent_inode, new_idx, name, parent_idx)
        # Don't flush here — save to PNG on release/fsync only
        return 0

    def unlink(self, path):
        parent = '/'.join(path.strip('/').split('/')[:-1]) or '/'
        name = path.strip('/').split('/')[-1]

        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT

        inode = read_inode(self.store, self.sb, idx)

        # Free data blocks
        for bidx in inode['blocks']:
            if bidx != 0:
                free_block(self.store, self.sb, bidx)

        # Zero inode
        write_inode(self.store, self.sb, idx, make_inode(0, 0, [], 0))

        # Remove from parent
        parent_idx = self._resolve(parent)
        parent_inode = read_inode(self.store, self.sb, parent_idx)
        dir_remove_entry(self.store, self.sb, parent_inode, name, parent_idx)
        # Don't flush here — save to PNG on release/fsync only
        return 0

    def rmdir(self, path):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        entries = dir_entries(self.store, self.sb, inode)
        if entries:
            return -errno.ENOTEMPTY
        return self.unlink(path)

    def truncate(self, path, size):
        idx = self._resolve(path)
        if idx < 0:
            return -errno.ENOENT
        inode = read_inode(self.store, self.sb, idx)
        inode['size'] = size
        write_inode(self.store, self.sb, idx, inode)
        # Don't flush here — save to PNG on release/fsync only
        return 0

    def rename(self, old, new):
        # Simple implementation: copy + delete
        old_idx = self._resolve(old)
        if old_idx < 0:
            return -errno.ENOENT

        old_parent = '/'.join(old.strip('/').split('/')[:-1]) or '/'
        old_name = old.strip('/').split('/')[-1]
        new_parent = '/'.join(new.strip('/').split('/')[:-1]) or '/'
        new_name = new.strip('/').split('/')[-1]

        # Add to new location
        new_parent_idx = self._resolve(new_parent)
        if new_parent_idx < 0:
            return -errno.ENOENT
        new_parent_inode = read_inode(self.store, self.sb, new_parent_idx)
        dir_add_entry(self.store, self.sb, new_parent_inode, old_idx, new_name, new_parent_idx)

        # Remove from old location
        old_parent_idx = self._resolve(old_parent)
        old_parent_inode = read_inode(self.store, self.sb, old_parent_idx)
        dir_remove_entry(self.store, self.sb, old_parent_inode, old_name, old_parent_idx)

        # Update name hash
        inode = read_inode(self.store, self.sb, old_idx)
        inode['name_hash'] = fnv1a(new_name.encode())
        write_inode(self.store, self.sb, old_idx, inode)
        # Don't flush here — save to PNG on release/fsync only
        return 0


# ─── FUSE bridge ───────────────────────────────────────────────────

def make_fuse_class(pfs):
    """Create a FUSE class bound to our PixelFS instance."""

    import fuse
    import stat

    class PixelFuse(fuse.FUSE):
        pass

    class Ops(fuse.Operations):
        def __init__(self):
            self.pfs = pfs

        def getattr(self, path, fh=None):
            result = self.pfs.getattr(path)
            if isinstance(result, int) and result < 0:
                e = fuse.FuseOSError(result)
                e.errno = abs(result)
                raise e
            attrs = {}
            for k, v in result.items():
                if isinstance(v, bytes):
                    v = v.decode()
                attrs[k] = v
            return attrs

        def readdir(self, path, fh):
            result = self.pfs.readdir(path)
            if isinstance(result, int):
                raise fuse.FuseOSError(result)
            return result

        def read(self, path, size, offset, fh):
            result = self.pfs.read(path, size, offset)
            if isinstance(result, int):
                raise fuse.FuseOSError(result)
            return result

        def write(self, path, data, offset, fh):
            result = self.pfs.write(path, data, offset)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return result

        def create(self, path, mode):
            result = self.pfs.create(path, mode)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def mkdir(self, path, mode):
            result = self.pfs.mkdir(path, mode)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def unlink(self, path):
            result = self.pfs.unlink(path)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def rmdir(self, path):
            result = self.pfs.rmdir(path)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def truncate(self, path, size, fh=None):
            result = self.pfs.truncate(path, size)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def rename(self, old, new):
            result = self.pfs.rename(old, new)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(result)
            return 0

        def open(self, path, flags):
            return 0

        def release(self, path, fh):
            # Persist all in-memory pixel changes to the PNG on disk
            try:
                self.pfs.store.flush()
            except Exception as e:
                import sys
                print(f"PixelFS flush error: {e}", file=sys.stderr)
            return 0

        def flush(self, path, fh):
            # Called on close(). Don't persist here — do it in release.
            return 0

        def fsync(self, path, datasync, fh):
            self.pfs.store.flush()
            return 0

        def statfs(self, path):
            return {
                'f_bsize': self.pfs.sb.block_bytes(),
                'f_blocks': self.pfs.sb.total_blocks,
                'f_bfree': self.pfs.sb.free_blocks,
                'f_bavail': self.pfs.sb.free_blocks,
                'f_files': self.pfs.sb.inode_count,
                'f_ffree': sum(1 for i in range(self.pfs.sb.inode_count)
                              if read_inode(self.pfs.store, self.pfs.sb, i)['type_mode'] == 0),
            }

        # Stubs for extended attributes (prevents EIO on some kernels)
        def getxattr(self, path, name, position=0):
            raise fuse.FuseOSError(errno.ENOTSUP)

        def listxattr(self, path):
            return []

        def setxattr(self, path, name, value, options, position=0):
            raise fuse.FuseOSError(errno.ENOTSUP)

        def removexattr(self, path, name):
            raise fuse.FuseOSError(errno.ENOTSUP)

        def access(self, path, amode):
            return 0

    return Ops


# ─── mkfs ──────────────────────────────────────────────────────────

def cmd_mkfs(root_dir, total_gb=1):
    """Create a new VastPixelFS substrate."""
    tile_size = 512  # 1MB raw per tile
    pixels_per_tile = tile_size * tile_size
    total_gb = int(total_gb)
    total_pixels = (total_gb * 1024 * 1024 * 1024) // 4
    
    store = TileStore(root_dir, tile_size)
    sb = Superblock(store)
    
    sb.block_size = 64  # 256 bytes per block (16x smaller than old 1024-byte blocks)
    sb.inode_table_start = COMPRESSED_POOL_HEADER
    
    # Solve for inode_count given total_pixels:
    #   total_pixels = HEADER + inode_count * INODE_SIZE + total_blocks * block_size
    #   total_blocks = inode_count * 8  (ratio: 8 blocks per inode)
    #   total_pixels = HEADER + inode_count * (INODE_SIZE + 8 * block_size)
    blocks_per_inode = 8
    sb.inode_count = max(64, (total_pixels - COMPRESSED_POOL_HEADER) // (INODE_SIZE + blocks_per_inode * sb.block_size))
    
    data_start = COMPRESSED_POOL_HEADER + sb.inode_count * INODE_SIZE
    sb.total_blocks = max(0, (total_pixels - data_start) // sb.block_size)
    sb.free_blocks = sb.total_blocks
    
    sb.write()

    # Root inode (inode 0) — directory
    root_inode = make_inode(S_IFDIR | 0o755, 0, [], fnv1a(b'/'))
    write_inode(store, sb, 0, root_inode)

    store.flush()
    capacity_mb = sb.total_blocks * sb.block_bytes() / (1024 * 1024)
    print(f"Created VastPixelFS in {root_dir} ({total_gb}GB substrate)")
    print(f"  Tiles: {total_pixels // pixels_per_tile}")
    print(f"  Inodes: {sb.inode_count}")
    print(f"  Blocks: {sb.total_blocks} ({capacity_mb:.1f} MB data capacity)")
    print(f"  Block size: {sb.block_bytes()} bytes")
    print(f"  Max file size: {MAX_BLOCKS_PER_INODE * sb.block_bytes() / 1024:.0f} KB (direct blocks)")

def cmd_stat(root_dir):
    """Show VastPixelFS stats."""
    store = TileStore(root_dir)
    sb = Superblock(store)
    sb.read()
    print(f"VastPixelFS v1: {root_dir}")
    print(f"  Block size: {sb.block_size} pixels ({sb.block_bytes()} bytes)")
    print(f"  Total blocks: {sb.total_blocks}")
    print(f"  Free blocks: {sb.free_blocks}")
    print(f"  Inodes: {sb.inode_count}")

    # Count used inodes
    used = 0
    for i in range(sb.inode_count):
        inode = read_inode(store, sb, i)
        if inode['type_mode'] != 0:
            used += 1
            kind = "dir" if (inode['type_mode'] & S_IFDIR) else "file"
            print(f"  Inode {i}: {kind}, size={inode['size']}, blocks={sum(1 for b in inode['blocks'] if b > 0)}")
    print(f"  Used inodes: {used}/{sb.inode_count}")

def cmd_mount(root_dir, mount_point):
    """Mount VastPixelFS as a FUSE filesystem."""
    import fuse

    store = TileStore(root_dir)
    sb = Superblock(store)
    sb.read()
    pfs = PixelFS(store, sb)

    Ops = make_fuse_class(pfs)

    os.makedirs(mount_point, exist_ok=True)
    print(f"Mounting VastPixelFS {root_dir} on {mount_point}")
    print(f"  Capacity: {sb.total_blocks * sb.block_bytes() / (1024*1024):.1f} MB")

    fuse.FUSE(Ops(), mount_point, foreground=True, ro=False,
              allow_other=False, fsname=f"vastfs:{os.path.basename(root_dir)}",
              nothreads=True)


# ─── CLI ───────────────────────────────────────────────────────────

def main():
    if len(sys.argv) < 2:
        print("Usage: vast_pixelfs <mkfs|mount|stat> <root_dir> [mount_point]")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == 'mkfs':
        total_gb = 1
        if '--size' in sys.argv:
            total_gb = float(sys.argv[sys.argv.index('--size') + 1])
        root_dir = sys.argv[2]
        cmd_mkfs(root_dir, total_gb)

    elif cmd == 'stat':
        cmd_stat(sys.argv[2])

    elif cmd == 'mount':
        if len(sys.argv) < 4:
            print("Usage: vast_pixelfs mount <root_dir> <mount_point>")
            sys.exit(1)
        cmd_mount(sys.argv[2], sys.argv[3])

    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)



if __name__ == '__main__':
    main()
