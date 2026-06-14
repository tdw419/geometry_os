"""
Minimal xv6 filesystem image builder for RV32.
Generates a valid fs.img with root directory and injects user binaries.

Usage: python3 mkfs_rv32.py [output.img] [user_binaries...]
Example: python3 mkfs_rv32.py fs.img user/_init user/_sh user/_cat
"""

import struct
import sys
import os

# Constants from xv6 kernel headers
BSIZE = 1024
FSMAGIC = 0x10203040
NINODES = 200
FSSIZE = 2000
LOGBLOCKS = 30  # MAXOPBLOCKS * 3
NDIRECT = 12
ROOTINO = 1
DIRSIZ = 14
T_DIR = 1
T_FILE = 2
NINDIRECT = BSIZE // 4  # 256
MAXFILE = NDIRECT + NINDIRECT

# struct dinode: short type, short major, short minor, short nlink, uint size, uint[13] addrs
DINODE_SIZE = struct.calcsize('<4hI13I')  # 64 bytes

IPB = BSIZE // DINODE_SIZE  # inodes per block => 16
NINODEBLOCKS = (NINODES + IPB - 1) // IPB  # => 13
NBITMAP = (FSSIZE + (BSIZE * 8) - 1) // (BSIZE * 8)  # => 1
NLOG = LOGBLOCKS + 1  # header + data blocks = 31
NMETA = 2 + NLOG + NINODEBLOCKS + NBITMAP  # boot + super + log + inode + bitmap
NBLOCKS = FSSIZE - NMETA

LOGSTART = 2
INODESTART = 2 + NLOG
BMAPSTART = 2 + NLOG + NINODEBLOCKS

print(f"Layout: {FSSIZE} blocks total")
print(f"  boot=1 super=1 log={NLOG} inode={NINODEBLOCKS} bitmap={NBITMAP} data={NBLOCKS}")
print(f"  logstart={LOGSTART} inodestart={INODESTART} bmapstart={BMAPSTART}")
print(f"  IPB={IPB} NINODEBLOCKS={NINODEBLOCKS}")


def xshort(x):
    """Host-to-RV32 little-endian short."""
    return struct.pack('<H', x & 0xFFFF)


def xint(x):
    """Host-to-RV32 little-endian int."""
    return struct.pack('<I', x & 0xFFFFFFFF)


def write_block(f, block_num, data):
    assert len(data) <= BSIZE, f"Block data too large: {len(data)} > {BSIZE}"
    f.seek(block_num * BSIZE)
    f.write(data)
    # Pad with zeros if needed
    if len(data) < BSIZE:
        f.write(b'\x00' * (BSIZE - len(data)))


def read_block(f, block_num):
    f.seek(block_num * BSIZE)
    return f.read(BSIZE)


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
    assert len(sb) == 32, f"Superblock size wrong: {len(sb)}"
    return sb


def make_inode(itype, size=0, addrs=None):
    """Create a dinode struct."""
    din = b''
    din += xshort(itype)     # type
    din += xshort(0)          # major
    din += xshort(0)          # minor
    din += xshort(1)          # nlink
    din += xint(size)         # size
    if addrs is None:
        addrs = [0] * (NDIRECT + 1)
    for a in addrs:
        din += xint(a)
    assert len(din) == DINODE_SIZE, f"Inode size wrong: {len(din)} != {DINODE_SIZE}"
    return din


def make_dirent(inum, name):
    """Create a directory entry."""
    de = b''
    de += xshort(inum)
    name_bytes = name.encode('ascii')
    assert len(name_bytes) <= DIRSIZ, f"Name too long: {name}"
    de += name_bytes.ljust(DIRSIZ, b'\x00')
    assert len(de) == 16, f"Dirent size wrong: {len(de)}"
    return de


def make_bitmap(allocated_blocks):
    """Create a bitmap block marking allocated_blocks as used."""
    bits = bytearray(BSIZE)
    for b in allocated_blocks:
        byte_idx = b // 8
        bit_idx = b % 8
        if byte_idx < BSIZE:
            bits[byte_idx] |= (1 << bit_idx)
    return bytes(bits)


def blocks_needed(file_size):
    """Calculate how many data blocks a file needs."""
    if file_size == 0:
        return 0
    return (file_size + BSIZE - 1) // BSIZE


def build(output_path, binary_paths, f):
    # We'll build the image in memory first, then write it out
    # Track allocated blocks
    allocated_blocks = set(range(NMETA))  # all meta blocks are allocated

    # Track inode allocation (0 = unused, 1 = root dir)
    inode_alloc = [False] * NINODES
    inode_alloc[ROOTINO] = True  # root inode

    # Root directory data: . and .. entries
    root_data_block = NMETA  # first free data block
    allocated_blocks.add(root_data_block)
    root_entries = bytearray()
    root_entries += make_dirent(ROOTINO, '.')
    root_entries += make_dirent(ROOTINO, '..')

    # Create the "console" device node (T_DEVICE=3, major=1, minor=1)
    T_DEVICE = 3
    console_inum = None
    for i in range(1, NINODES):
        if not inode_alloc[i]:
            console_inum = i
            inode_alloc[i] = True
            break
    if console_inum is not None:
        # console device inode: type=T_DEVICE, major=1, minor=1
        console_inode = b''
        console_inode += xshort(T_DEVICE)  # type = T_DEVICE
        console_inode += xshort(1)         # major = CONSOLE = 1
        console_inode += xshort(1)         # minor = 1
        console_inode += xshort(1)         # nlink = 1
        console_inode += xint(0)           # size = 0
        for _ in range(NDIRECT + 1):
            console_inode += xint(0)       # no data blocks
        assert len(console_inode) == DINODE_SIZE
        inode_block_num = INODESTART + (console_inum // IPB)
        inode_offset = (console_inum % IPB) * DINODE_SIZE
        existing_block = bytearray(read_block(f, inode_block_num))
        existing_block[inode_offset:inode_offset + DINODE_SIZE] = console_inode
        write_block(f, inode_block_num, bytes(existing_block))
        # Add to root directory
        root_entries += make_dirent(console_inum, 'console')
        print(f"  console: inode={console_inum} type=T_DEVICE major=1 minor=1")

    # Track required data blocks for later bitmap
    next_block = root_data_block + 1

    # Process each binary
    total_files = 0
    for bin_path in binary_paths:
        total_files += 1
        basename = os.path.basename(bin_path)
        # Strip leading underscore (xv6 convention: _sh -> "sh")
        if basename.startswith('_'):
            name = basename[1:]
        else:
            name = basename

        if len(name) > DIRSIZ:
            print(f"  WARNING: {name} too long, truncating to {DIRSIZ}")
            name = name[:DIRSIZ]

        # Read the binary
        with open(bin_path, 'rb') as binf:
            data = binf.read()
        file_size = len(data)
        nblocks = blocks_needed(file_size)

        if nblocks > MAXFILE:
            print(f"  WARNING: {name} needs {nblocks} blocks, max is {MAXFILE}")
            nblocks = min(nblocks, MAXFILE)
            file_size = nblocks * BSIZE
            data = data[:file_size]

        file_blocks = nblocks
        addrs = []

        # Direct blocks
        for bi in range(min(file_blocks, NDIRECT)):
            addrs.append(next_block)
            allocated_blocks.add(next_block)
            next_block += 1

        # Indirect block
        if file_blocks > NDIRECT:
            indirect_block = next_block
            allocated_blocks.add(indirect_block)
            addrs.append(indirect_block)
            next_block += 1
            # Fill indirect block with remaining block numbers
            remaining = file_blocks - NDIRECT
            indirect_data = b''
            for bi in range(remaining):
                indirect_data += xint(next_block)
                allocated_blocks.add(next_block)
                next_block += 1
            # Pad to block size
            indirect_data += b'\x00' * (BSIZE - len(indirect_data))
            write_block(f, indirect_block, indirect_data)

        # Pad addrs to (NDIRECT + 1) entries
        addrs += [0] * (NDIRECT + 1 - len(addrs))

        # Find a free inode
        inum = None
        for i in range(1, NINODES):
            if not inode_alloc[i]:
                inum = i
                inode_alloc[i] = True
                break
        if inum is None:
            print(f"  ERROR: no free inodes for {name}")
            continue

        print(f"  {name}: inode={inum} size={file_size} blocks={file_blocks} addrs={addrs[:file_blocks]}")

        # Write file data to blocks
        # First NDIRECT go through addrs directly
        for bi in range(min(file_blocks, NDIRECT)):
            offset = bi * BSIZE
            chunk = data[offset:offset + BSIZE]
            assert len(chunk) <= BSIZE
            write_block(f, addrs[bi], chunk)

        # Remaining blocks go through indirect
        if file_blocks > NDIRECT:
            indirect_block = addrs[NDIRECT]
            indirect_data_raw = read_block(f, indirect_block)
            for bi in range(NDIRECT, file_blocks):
                offset = bi * BSIZE
                chunk = data[offset:offset + BSIZE]
                assert len(chunk) <= BSIZE
                # Read the indirect block, get the physical block number
                entry_offset = (bi - NDIRECT) * 4
                target_block = struct.unpack('<I', indirect_data_raw[entry_offset:entry_offset + 4])[0]
                write_block(f, target_block, chunk)

        # Create inode entry
        inode = make_inode(T_FILE, size=file_size, addrs=addrs)
        inode_block_num = INODESTART + (inum // IPB)
        inode_offset_in_block = (inum % IPB) * DINODE_SIZE
        existing_block = bytearray(read_block(f, inode_block_num))
        existing_block[inode_offset_in_block:inode_offset_in_block + DINODE_SIZE] = inode
        write_block(f, inode_block_num, bytes(existing_block))

        # Add directory entry to root
        root_entries += make_dirent(inum, name)

    # Update root inode data block
    root_dir_size = len(root_entries)
    write_block(f, root_data_block, bytes(root_entries))

    # Update root inode with correct size
    root_inode = make_inode(T_DIR, size=root_dir_size,
                            addrs=[root_data_block] + [0] * (NDIRECT + 1 - 1))
    inode_block_num = INODESTART  # root inode is in first inode block
    existing_block = bytearray(read_block(f, inode_block_num))
    existing_block[DINODE_SIZE * 1:DINODE_SIZE * 1 + DINODE_SIZE] = root_inode
    write_block(f, inode_block_num, bytes(existing_block))

    # Write bitmap (mark all allocated blocks)
    bitmap = make_bitmap(list(allocated_blocks))
    write_block(f, BMAPSTART, bitmap)

    print(f"\nTotal: {total_files} files, {len(allocated_blocks)} allocated blocks")

    actual_size = FSSIZE * BSIZE
    file_size = os.path.getsize(output_path)
    print(f"Wrote {output_path}: {file_size} bytes ({file_size // BSIZE} blocks)")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} [output.img] [user_binaries...]")
        sys.exit(1)

    output = sys.argv[1]
    binaries = sys.argv[2:]

    # Create an empty image first (writes zero-filled file)
    with open(output, 'wb') as f:
        f.write(b'\x00' * (FSSIZE * BSIZE))
        # Block 0: boot block (empty - already zeroed)
        # Block 1: superblock
        write_block(f, 1, make_superblock())

    # Now rebuild with binaries
    with open(output, 'r+b') as f:
        build(output, binaries, f)
