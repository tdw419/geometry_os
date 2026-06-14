"""
Generate stubs_data.h — a C header containing all disk block data
for the synthetic xv6 filesystem, including user binaries.

Called by the Makefile after building user programs.
"""

import struct
import sys
import os

BSIZE = 1024
FSMAGIC = 0x10203040
NINODES = 200
FSSIZE = 2000
LOGBLOCKS = 30
NDIRECT = 12
ROOTINO = 1
DIRSIZ = 14
T_DIR = 1
T_FILE = 2
NINDIRECT = BSIZE // 4
MAXFILE = NDIRECT + NINDIRECT

DINODE_SIZE = struct.calcsize('<4hI13I')
IPB = BSIZE // DINODE_SIZE
NINODEBLOCKS = (NINODES + IPB - 1) // IPB
NBITMAP = (FSSIZE + (BSIZE * 8) - 1) // (BSIZE * 8)
NLOG = LOGBLOCKS + 1
NMETA = 2 + NLOG + NINODEBLOCKS + NBITMAP
NBLOCKS = FSSIZE - NMETA
LOGSTART = 2
INODESTART = 2 + NLOG
BMAPSTART = 2 + NLOG + NINODEBLOCKS
ROOT_DATABLOCK = NMETA


def xshort(x):
    return struct.pack('<H', x & 0xFFFF)


def xint(x):
    return struct.pack('<I', x & 0xFFFFFFFF)


def make_superblock():
    sb = b''
    sb += xint(FSMAGIC)
    sb += xint(FSSIZE)
    sb += xint(NBLOCKS)
    sb += xint(NINODES)
    sb += xint(NLOG)
    sb += xint(LOGSTART)
    sb += xint(INODESTART)
    sb += xint(BMAPSTART)
    assert len(sb) == 32
    return sb


def make_inode(itype, size=0, addrs=None):
    din = b''
    din += xshort(itype)
    din += xshort(0)
    din += xshort(0)
    din += xshort(1)
    din += xint(size)
    if addrs is None:
        addrs = [0] * (NDIRECT + 1)
    for a in addrs:
        din += xint(a)
    assert len(din) == DINODE_SIZE
    return din


def make_dirent(inum, name):
    de = b''
    de += xshort(inum)
    name_bytes = name.encode('ascii')
    assert len(name_bytes) <= DIRSIZ
    de += name_bytes.ljust(DIRSIZ, b'\x00')
    assert len(de) == 16
    return de


def make_bitmap(allocated_blocks):
    bits = bytearray(BSIZE)
    for b in allocated_blocks:
        byte_idx = b // 8
        bit_idx = b % 8
        if byte_idx < BSIZE:
            bits[byte_idx] |= (1 << bit_idx)
    return bytes(bits)


def blocks_needed(file_size):
    if file_size == 0:
        return 0
    return (file_size + BSIZE - 1) // BSIZE


def generate(output_path, binary_paths):
    """Generate stubs_data.h containing all block data."""
    allocated_blocks = set(range(NMETA))
    inode_alloc = [False] * NINODES
    inode_alloc[ROOTINO] = True

    # Root directory entries: . and ..
    next_block = ROOT_DATABLOCK + 1
    root_entries = bytearray()
    root_entries += make_dirent(ROOTINO, '.')
    root_entries += make_dirent(ROOTINO, '..')

    # Build block data array: blockno -> bytes
    blocks = {}
    blocks[0] = b'\x00' * BSIZE                          # boot block
    blocks[1] = make_superblock().ljust(BSIZE, b'\x00')   # superblock

    # Log blocks (zeroed)
    for b in range(LOGSTART, LOGSTART + NLOG):
        blocks[b] = b'\x00' * BSIZE

    # Inode blocks
    for b in range(INODESTART, INODESTART + NINODEBLOCKS):
        blocks[b] = b'\x00' * BSIZE

    # Bitmap block
    blocks[BMAPSTART] = b'\x00' * BSIZE

    # Root dir data block
    root_entry_size = 0

    # Process each binary
    for bin_path in binary_paths:
        basename = os.path.basename(bin_path)
        if basename.startswith('_'):
            name = basename[1:]
        else:
            name = basename
        if len(name) > DIRSIZ:
            name = name[:DIRSIZ]

        with open(bin_path, 'rb') as binf:
            data = binf.read()
        file_size = len(data)
        nblocks = blocks_needed(file_size)

        if nblocks > MAXFILE:
            nblocks = MAXFILE
            file_size = nblocks * BSIZE
            data = data[:file_size]

        # Allocate addrs
        addrs = []
        for bi in range(min(nblocks, NDIRECT)):
            addrs.append(next_block)
            next_block += 1

        if nblocks > NDIRECT:
            indirect_block = next_block
            addrs.append(indirect_block)
            next_block += 1
            remaining = nblocks - NDIRECT
            for bi in range(remaining):
                addrs.append(next_block)
                next_block += 1

        # Pad addrs
        addrs_full = addrs[:NDIRECT] + [addrs[NDIRECT] if nblocks > NDIRECT else 0] + [0] * max(0, NDIRECT - len(addrs[:NDIRECT]) - (1 if nblocks > NDIRECT else 0))

        # Wait, this is wrong. Let me rebuild properly
        addrs_final = []
        for bi in range(NDIRECT):
            if bi < len(addrs):
                addrs_final.append(addrs[bi])
            else:
                addrs_final.append(0)
        # Index NDIRECT (12) = indirect block or 0
        if nblocks > NDIRECT:
            addrs_final.append(addrs[NDIRECT])  # indirect block
        else:
            addrs_final.append(0)
        assert len(addrs_final) == NDIRECT + 1

        # Find free inode
        inum = None
        for i in range(1, NINODES):
            if not inode_alloc[i]:
                inum = i
                inode_alloc[i] = True
                break
        if inum is None:
            print(f"ERROR: no free inodes for {name}")
            continue

        # Write file data blocks
        for bi in range(nblocks):
            offset = bi * BSIZE
            chunk = data[offset:offset + BSIZE]
            chunk = chunk.ljust(BSIZE, b'\x00')
            # Get the actual block number
            if bi < NDIRECT:
                blockno = addrs[bi]
            else:
                blockno = addrs[NDIRECT + 1 + (bi - NDIRECT)]
            blocks[blockno] = chunk
            allocated_blocks.add(blockno)

        # Mark indirect block
        if nblocks > NDIRECT:
            allocated_blocks.add(addrs[NDIRECT])
            # Write indirect block data
            ind_data = b''
            for bi in range(NDIRECT, nblocks):
                blockno = addrs[NDIRECT + 1 + (bi - NDIRECT)]
                ind_data += xint(blockno)
            ind_data = ind_data.ljust(BSIZE, b'\x00')
            blocks[addrs[NDIRECT]] = ind_data

        # Write inode into the inode block
        inode = make_inode(T_FILE, size=file_size, addrs=addrs_final)
        inode_block_num = INODESTART + (inum // IPB)
        inode_offset = (inum % IPB) * DINODE_SIZE

        existing = bytearray(blocks.get(inode_block_num, b'\x00' * BSIZE))
        existing[inode_offset:inode_offset + DINODE_SIZE] = inode
        blocks[inode_block_num] = bytes(existing)

        # Add directory entry
        root_entries += make_dirent(inum, name)

    # Update root dir
    root_dir_size = len(root_entries)
    blocks[ROOT_DATABLOCK] = bytes(root_entries).ljust(BSIZE, b'\x00')

    # Update root inode
    root_inode = make_inode(T_DIR, size=root_dir_size,
                            addrs=[ROOT_DATABLOCK] + [0] * NDIRECT)
    inode_block = bytearray(blocks[INODESTART])
    inode_block[DINODE_SIZE * 1:DINODE_SIZE * 1 + DINODE_SIZE] = root_inode
    blocks[INODESTART] = bytes(inode_block)

    # Update bitmap
    blocks[BMAPSTART] = make_bitmap(list(allocated_blocks))

    # Generate C header
    lines = []
    lines.append("// Auto-generated from mkfs. Do not edit directly.")
    lines.append(f"// {len(blocks)} blocks defined, {len(allocated_blocks)} allocated.")
    lines.append(f"#define STUBS_NBLOCKS {FSSIZE}")
    lines.append("#include \"types.h\"")
    lines.append("")

    # Output blocks as a flat array indexed by block number
    # Use a sparse approach: just define seen blocks
    # Actually, for simplicity, define a {blockno, data} lookup

    # For simplicity, export block data as a function
    lines.append("// Block data lookup: fills buf with data for the given block number.")
    lines.append("// Returns 1 if found, 0 if block is beyond FSSIZE.")
    lines.append("int")
    lines.append("stubs_get_block(uint blockno, uchar *buf)")
    lines.append("{")
    lines.append("  memset(buf, 0, BSIZE);")
    lines.append("  if (blockno >= FSSIZE) return 0;")
    lines.append("")
    lines.append("  switch (blockno) {")

    # Sort block numbers for deterministic output
    for blockno in sorted(blocks.keys()):
        data = blocks[blockno]
        # C byte array
        hex_bytes = ", ".join(f"0x{b:02x}" for b in data)
        lines.append(f"  case {blockno}:")
        lines.append(f"    {{")
        lines.append(f"      static const uchar d[] = {{ {hex_bytes} }};")
        lines.append(f"      memmove(buf, d, BSIZE);")
        lines.append(f"      return 1;")
        lines.append(f"    }}")

    lines.append("  default:")
    lines.append("    return 1; // zeroed block")
    lines.append("  }")
    lines.append("}")

    # Generate write-cache function
    lines.append("")
    lines.append("// Write-cache: stores written block data.")
    lines.append("#define STUBS_WCACHE_SIZE 32")
    lines.append("static struct { uint blockno; uchar data[BSIZE]; int valid; } stubs_wcache[STUBS_WCACHE_SIZE];")
    lines.append("static int stubs_wcache_init = 0;")
    lines.append("")
    lines.append("void stubs_write_block(uint blockno, uchar *data) {")
    lines.append("  if (!stubs_wcache_init) {")
    lines.append("    for (int i = 0; i < STUBS_WCACHE_SIZE; i++) stubs_wcache[i].valid = 0;")
    lines.append("    stubs_wcache_init = 1;")
    lines.append("  }")
    lines.append("  int slot = -1;")
    lines.append("  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {")
    lines.append("    if (stubs_wcache[i].valid && stubs_wcache[i].blockno == blockno) { slot = i; break; }")
    lines.append("    if (!stubs_wcache[i].valid && slot < 0) slot = i;")
    lines.append("  }")
    lines.append("  if (slot < 0) slot = 0; // evict first")
    lines.append("  stubs_wcache[slot].blockno = blockno;")
    lines.append("  memmove(stubs_wcache[slot].data, data, BSIZE);")
    lines.append("  stubs_wcache[slot].valid = 1;")
    lines.append("}")
    lines.append("")
    lines.append("int stubs_read_block(uint blockno, uchar *data) {")
    lines.append("  if (!stubs_wcache_init) return 0;")
    lines.append("  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {")
    lines.append("    if (stubs_wcache[i].valid && stubs_wcache[i].blockno == blockno) {")
    lines.append("      memmove(data, stubs_wcache[i].data, BSIZE);")
    lines.append("      return 1;")
    lines.append("    }")
    lines.append("  }")
    lines.append("  return 0;")
    lines.append("}")

    # Write output
    with open(output_path, 'w') as f:
        f.write('\n'.join(lines) + '\n')

    print(f"Generated {output_path}: {len(blocks)} blocks, {sum(len(v) for v in blocks.values())} bytes total")
    print(f"  Blocks: {sorted(blocks.keys())}")


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} output.h [user_binaries...]")
        sys.exit(1)
    generate(sys.argv[1], sys.argv[2:])
