#!/usr/bin/env python3
"""
SeedFS — One pixel = one file. The pixel doesn't store data; it generates it.

Every 32-bit seed deterministically expands into a unique byte stream via
SHA-256 chaining. The filesystem is the math.

Modes:
  Pure:     seed → deterministic stream. No on-disk footprint.
  XOR:      seed generates keystream K. Store residual = K XOR plaintext.
            Reading: generate K, XOR with residual → recover plaintext.
            The residual is the "correction" between math and reality.

Metadata is stored as a tiny JSON index (one entry per file). For pure files,
the index is the only storage cost (a few bytes). For XOR files, the residual
is additional storage.

Layout:
  <root>/
    index.json    — {filename: {seed, size, mode, xor_residual_path}}
    residuals/    — XOR correction blobs (only for XOR-encoded files)

Usage:
  python3 scripts/seedfs.py mkfs <dir>
  python3 scripts/seedfs.py mount <dir> <mountpoint>
  python3 scripts/seedfs.py stat <dir>
  python3 scripts/seedfs.py expand <seed_hex> [length]
  fusermount3 -u <mountpoint>
"""

import os, sys, json, struct, errno, hashlib, time, threading, zlib
import stat as stat_mod

# ─── Deterministic Expansion Engine ───────────────────────────────

BLOCK_SIZE = 32  # SHA-256 digest size

def seed_stream(seed, offset, length):
    """Deterministic expansion: seed → byte stream of any length."""
    res = bytearray()
    chunk_idx = offset // BLOCK_SIZE
    skip = offset % BLOCK_SIZE

    while len(res) < length:
        ctx = hashlib.sha256()
        ctx.update(struct.pack('>I', seed & 0xFFFFFFFF))
        ctx.update(struct.pack('>Q', chunk_idx))
        block = ctx.digest()

        if skip:
            block = block[skip:]
            skip = 0

        res.extend(block)
        chunk_idx += 1

    return bytes(res[:length])


def _check_range(args):
    """Worker function for parallel seed search."""
    target_bytes, start, end = args
    tlen = len(target_bytes)
    for seed in range(start, end):
        ctx = hashlib.sha256()
        ctx.update(struct.pack('>I', seed))
        ctx.update(struct.pack('>Q', 0))
        if ctx.digest()[:tlen] == target_bytes:
            return seed
    return None


def find_seed_for_prefix(target_bytes, max_seeds=2**32, workers=None):
    """
    Find a seed whose stream starts with target_bytes.
    Uses multiprocessing for speed. Practical for len <= 3 bytes.
    Returns seed or None.
    """
    import multiprocessing
    if workers is None:
        workers = min(multiprocessing.cpu_count(), 24)

    chunk_size = max_seeds // workers
    args = []
    for i in range(workers):
        start = i * chunk_size
        end = (i + 1) * chunk_size if i < workers - 1 else max_seeds
        args.append((target_bytes, start, end))

    pool = multiprocessing.Pool(processes=workers)
    try:
        for result in pool.imap_unordered(_check_range, args):
            if result is not None:
                pool.terminate()
                return result
    finally:
        pool.terminate()
    return None


def xor_bytes(a, b):
    """XOR two byte strings (trims to shorter length)."""
    n = min(len(a), len(b))
    return bytes(x ^ y for x, y in zip(a[:n], b[:n]))


def residual_keystream(seed, length):
    """Generate keystream for XOR encoding."""
    return seed_stream(seed, 0, length)


# ─── Metadata Index ──────────────────────────────────────────────

METADATA_VERSION = 1

class SeedIndex:
    """JSON-backed metadata index for SeedFS."""

    def __init__(self, root_dir):
        self.root_dir = root_dir
        self.index_path = os.path.join(root_dir, 'index.json')
        self.residuals_dir = os.path.join(root_dir, 'residuals')
        self.lock = threading.Lock()
        self.entries = {}  # filename -> {seed, size, mode, xor_path}
        self._load()

    def _load(self):
        if os.path.exists(self.index_path):
            with open(self.index_path, 'r') as f:
                data = json.load(f)
            self.entries = data.get('entries', {})

    def _save(self):
        os.makedirs(os.path.dirname(self.index_path), exist_ok=True)
        with open(self.index_path, 'w') as f:
            json.dump({'version': METADATA_VERSION, 'entries': self.entries}, f, indent=2)

    def list_files(self):
        return list(self.entries.keys())

    def get(self, filename):
        return self.entries.get(filename)

    def add_dir(self, dirname):
        """Add an explicit directory entry."""
        with self.lock:
            if dirname not in self.entries:
                self.entries[dirname] = {'type': 'dir'}
                self._save()

    def add_pure(self, filename, seed, size):
        """Add a purely generative file."""
        with self.lock:
            self.entries[filename] = {
                'type': 'file',
                'seed': seed,
                'size': size,
                'mode': 'pure',
            }
            self._save()

    def add_xor(self, filename, seed, size, data):
        """Add an XOR-encoded file. Stores the residual."""
        os.makedirs(self.residuals_dir, exist_ok=True)

        # Generate keystream and XOR
        keystream = residual_keystream(seed, len(data))
        residual = xor_bytes(data, keystream)

        # Compress residual
        compressed = zlib.compress(residual, 9)

        # Store residual
        safe_name = filename.replace('/', '_')
        residual_path = os.path.join(self.residuals_dir, f'{safe_name}.xor.zlib')
        with open(residual_path, 'wb') as f:
            f.write(compressed)

        with self.lock:
            self.entries[filename] = {
                'type': 'file',
                'seed': seed,
                'size': size,
                'mode': 'xor',
                'xor_path': residual_path,
                'raw_residual_size': len(residual),
                'compressed_residual_size': len(compressed),
            }
            self._save()

    def read_xor(self, filename):
        """Read XOR-encoded file, recover plaintext."""
        entry = self.entries.get(filename)
        if not entry or entry['mode'] != 'xor':
            return None

        with open(entry['xor_path'], 'rb') as f:
            compressed = f.read()

        residual = zlib.decompress(compressed)
        keystream = residual_keystream(entry['seed'], len(residual))
        return xor_bytes(residual, keystream)

    def remove(self, filename):
        entry = self.entries.get(filename)
        if not entry:
            return False
        if entry.get('xor_path') and os.path.exists(entry['xor_path']):
            os.remove(entry['xor_path'])
        with self.lock:
            del self.entries[filename]
            self._save()
        return True

    def next_seed(self):
        """Get next available seed (simple counter + hash for variety)."""
        used = {e['seed'] for e in self.entries.values() if 'seed' in e}
        # Start from a hash of the count to avoid boring sequential seeds
        base = len(self.entries)
        for i in range(2**32):
            candidate = (hash(base + i) & 0xFFFFFFFF)
            if candidate not in used:
                return candidate
        return None


# ─── FUSE Operations ─────────────────────────────────────────────

class SeedFSOps:
    def __init__(self, index):
        self.index = index
        self.start_time = time.time()

    def _resolve(self, path):
        """Strip leading / and look up in index."""
        name = path.strip('/')
        if not name:
            return None  # root
        entry = self.index.get(name)
        if entry:
            return entry
        
        # Check if it's a virtual directory
        # If any file exists that starts with "name/", then "name" is a dir
        prefix = name + '/'
        for filename in self.index.entries:
            if filename.startswith(prefix):
                return {'type': 'dir'}
        return None

    def getattr(self, path, fh=None):
        if path == '/':
            return {
                'st_mode': stat_mod.S_IFDIR | 0o755,
                'st_nlink': 2,
                'st_uid': os.getuid(),
                'st_gid': os.getgid(),
                'st_atime': self.start_time,
                'st_mtime': self.start_time,
                'st_ctime': self.start_time,
            }

        entry = self._resolve(path)
        if entry is None:
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), path)

        if entry.get('type') == 'dir':
            return {
                'st_mode': stat_mod.S_IFDIR | 0o755,
                'st_nlink': 2,
                'st_uid': os.getuid(),
                'st_gid': os.getgid(),
                'st_atime': self.start_time,
                'st_mtime': self.start_time,
                'st_ctime': self.start_time,
            }

        mode = stat_mod.S_IFREG | 0o644
        if entry.get('mode') == 'pure':
            mode = stat_mod.S_IFREG | 0o444  # pure files are read-only

        return {
            'st_mode': mode,
            'st_nlink': 1,
            'st_size': entry['size'],
            'st_uid': os.getuid(),
            'st_gid': os.getgid(),
            'st_atime': self.start_time,
            'st_mtime': self.start_time,
            'st_ctime': self.start_time,
        }

    def readdir(self, path, fh):
        name = path.strip('/')
        dirents = set(['.', '..'])
        
        prefix = ""
        if name:
            prefix = name + '/'
        
        for filename in self.index.entries:
            if filename.startswith(prefix):
                rel = filename[len(prefix):]
                parts = rel.split('/')
                dirents.add(parts[0])
                
        return list(dirents)

    def mkdir(self, path, mode):
        name = path.strip('/')
        self.index.add_dir(name)
        return 0

    def read(self, path, size, offset, fh):
        name = path.strip('/')
        entry = self.index.get(name)
        if entry is None:
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), path)

        file_size = entry['size']
        if offset >= file_size:
            return b''

        remaining = min(size, file_size - offset)

        if entry['mode'] == 'pure':
            return seed_stream(entry['seed'], offset, remaining)
        elif entry['mode'] == 'xor':
            data = self.index.read_xor(name)
            if data is None:
                return b''
            return data[offset:offset + remaining]
        else:
            return b''

    def write(self, path, data, offset, fh):
        name = path.strip('/')

        # Get existing entry or create new
        entry = self.index.get(name)
        if entry and entry.get('mode') == 'pure':
            return -errno.EPERM  # can't write to pure generative files

        if entry:
            # Read existing data, apply write, re-encode
            old_data = self.index.read_xor(name) or b''
            new_size = max(len(old_data), offset + len(data))
            buf = bytearray(new_size)
            buf[:len(old_data)] = old_data
            buf[offset:offset + len(data)] = data
            seed = entry['seed']
        else:
            # New file
            buf = bytearray(offset + len(data))
            buf[offset:offset + len(data)] = data
            seed = self.index.next_seed()

        self.index.add_xor(name, seed, len(buf), bytes(buf))
        return len(data)

    def create(self, path, mode):
        name = path.strip('/')
        if self.index.get(name):
            return 0
        seed = self.index.next_seed()
        # Create empty XOR file
        self.index.add_xor(name, seed, 0, b'')
        return 0

    def unlink(self, path):
        name = path.strip('/')
        if not self.index.remove(name):
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), path)
        return 0

    def truncate(self, path, size, fh=None):
        name = path.strip('/')
        entry = self.index.get(name)
        if not entry:
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), path)

        if size == 0:
            # Truncate to empty
            seed = entry['seed']
            self.index.add_xor(name, seed, 0, b'')
        else:
            old = self.index.read_xor(name) or b''
            new_data = old[:size].ljust(size, b'\x00')
            seed = entry['seed']
            self.index.add_xor(name, seed, size, new_data)
        return 0

    def rename(self, old, new):
        old_name = old.strip('/')
        new_name = new.strip('/')
        entry = self.index.get(old_name)
        if not entry:
            raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), old)
        self.index.entries[new_name] = entry
        del self.index.entries[old_name]
        self.index._save()
        return 0

    def open(self, path, flags):
        return 0

    def release(self, path, fh):
        return 0

    def flush(self, path, fh):
        return 0

    def statfs(self, path):
        total_seeds = 2**32
        used_seeds = len(self.index.entries)
        return {
            'f_bsize': 4096,
            'f_blocks': total_seeds,
            'f_bfree': total_seeds - used_seeds,
            'f_bavail': total_seeds - used_seeds,
            'f_files': total_seeds,
            'f_ffree': total_seeds - used_seeds,
        }

    def getxattr(self, path, name, position=0):
        raise OSError(errno.ENOTSUP, os.strerror(errno.ENOTSUP))

    def listxattr(self, path):
        return []

    def setxattr(self, path, name, value, options, position=0):
        raise OSError(errno.ENOTSUP, os.strerror(errno.ENOTSUP))

    def removexattr(self, path, name):
        raise OSError(errno.ENOTSUP, os.strerror(errno.ENOTSUP))

    def access(self, path, amode):
        return 0


# ─── FUSE Bridge ──────────────────────────────────────────────────

def make_fuse_ops(index):
    import fuse

    class Ops(fuse.Operations):
        def __init__(self):
            self.core = SeedFSOps(index)

        def getattr(self, path, fh=None):
            try:
                result = self.core.getattr(path, fh)
                return {k: v for k, v in result.items()}
            except FileNotFoundError as e:
                raise fuse.FuseOSError(e.errno)

        def readdir(self, path, fh):
            return self.core.readdir(path, fh)

        def read(self, path, size, offset, fh):
            result = self.core.read(path, size, offset, fh)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(-result)
            return result

        def write(self, path, data, offset, fh):
            result = self.core.write(path, data, offset, fh)
            if isinstance(result, int) and result < 0:
                raise fuse.FuseOSError(-result)
            return result

        def create(self, path, mode):
            return self.core.create(path, mode)

        def mkdir(self, path, mode):
            return self.core.mkdir(path, mode)

        def unlink(self, path):
            return self.core.unlink(path)

        def truncate(self, path, size, fh=None):
            return self.core.truncate(path, size, fh)

        def rename(self, old, new):
            return self.core.rename(old, new)

        def chmod(self, path, mode):
            return 0

        def chown(self, path, uid, gid):
            return 0

        def utimens(self, path, times=None):
            return 0

        def open(self, path, flags):
            return 0

        def release(self, path, fh):
            return 0

        def flush(self, path, fh):
            return 0

        def statfs(self, path):
            return self.core.statfs(path)

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


# ─── CLI Commands ─────────────────────────────────────────────────

def cmd_mkfs(root_dir):
    """Initialize a new SeedFS."""
    os.makedirs(root_dir, exist_ok=True)
    os.makedirs(os.path.join(root_dir, 'residuals'), exist_ok=True)
    index = SeedIndex(root_dir)
    # Add some pure generative demo files
    demo_seeds = [
        ('cosmic_noise.bin', 0xDEADBEEF, 4096),
        ('void.bin', 0x00000000, 4096),
        ('chaos.bin', 0xCAFEBABE, 4096),
        ('signal.bin', 0x1337C0DE, 4096),
        ('entropy.bin', 0xFFFFFFFF, 4096),
    ]
    for name, seed, size in demo_seeds:
        index.add_pure(name, seed, size)
    print(f"Created SeedFS at {root_dir}")
    print(f"  Demo files: {len(demo_seeds)} (pure generative, 0 bytes on disk)")
    print(f"  Index: {index.index_path}")


def cmd_mount(root_dir, mount_point):
    """Mount SeedFS as a FUSE filesystem."""
    import fuse
    index = SeedIndex(root_dir)
    Ops = make_fuse_ops(index)

    os.makedirs(mount_point, exist_ok=True)
    total_seeds = 2**32
    used = len(index.entries)
    print(f"Mounting SeedFS: {root_dir} → {mount_point}")
    print(f"  Files: {used} (of {total_seeds:,} possible universes)")
    print(f"  Pure generative: expand from math")
    print(f"  XOR encoded: seed + residual correction")

    fuse.FUSE(Ops(), mount_point, foreground=True, ro=False,
              allow_other=False, fsname=f"seedfs:{os.path.basename(root_dir)}",
              nothreads=True)


def cmd_stat(root_dir):
    """Show SeedFS stats."""
    index = SeedIndex(root_dir)
    print(f"SeedFS: {root_dir}")
    print(f"  Files: {len(index.entries)}")
    pure = sum(1 for e in index.entries.values() if e.get('mode') == 'pure')
    xor = sum(1 for e in index.entries.values() if e.get('mode') == 'xor')
    print(f"  Pure generative: {pure} (0 bytes storage)")
    print(f"  XOR encoded: {xor}")

    total_storage = 0
    for name, entry in index.entries.items():
        if entry.get('mode') == 'xor':
            csize = entry.get('compressed_residual_size', 0)
            total_storage += csize
            ratio = csize / max(1, entry['size']) * 100
            print(f"  {name}: {entry['size']}B → {csize}B residual ({ratio:.1f}%)")
        else:
            print(f"  {name}: {entry['size']}B (pure, 0 bytes stored)")

    print(f"  Total storage: {total_storage} bytes")


def cmd_expand(seed_hex, length=64):
    """Expand a seed and show output."""
    seed = int(seed_hex, 16) & 0xFFFFFFFF
    data = seed_stream(seed, 0, length)
    # Show hex dump
    for i in range(0, len(data), 16):
        hex_part = ' '.join(f'{b:02x}' for b in data[i:i+16])
        ascii_part = ''.join(chr(b) if 32 <= b <= 126 else '.' for b in data[i:i+16])
        print(f'{i:08x}: {hex_part:<48s} {ascii_part}')


def cmd_find(target_hex):
    """Find a seed that generates bytes starting with target."""
    target = bytes.fromhex(target_hex)
    print(f"Searching for seed producing: {target.hex()}")
    result = find_seed_for_prefix(target)
    if result is not None:
        print(f"Found: 0x{result:08X}")
        verify = seed_stream(result, 0, len(target))
        print(f"Verify: {verify.hex()}")
    else:
        print("No seed found in 2^32 space")


def cmd_bench(root_dir):
    """Run performance benchmarks."""
    import time as _time

    # Expansion speed
    iterations = 10000
    t0 = _time.time()
    for i in range(iterations):
        seed_stream(0xDEADBEEF, i * 32, 32)
    elapsed = _time.time() - t0
    rate = iterations / elapsed
    print(f"Pure expansion: {rate:.0f} reads/sec ({iterations} x 32B)")

    # XOR encode/decode speed
    test_data = os.urandom(4096)
    seed = 0x12345678

    t0 = _time.time()
    for _ in range(1000):
        ks = residual_keystream(seed, len(test_data))
        residual = xor_bytes(test_data, ks)
    elapsed = _time.time() - t0
    rate = 1000 / elapsed
    print(f"XOR encode: {rate:.0f} ops/sec (1000 x 4KB)")

    # JSON index overhead
    os.makedirs(root_dir, exist_ok=True)
    index = SeedIndex(root_dir)

    t0 = _time.time()
    for i in range(100):
        data = os.urandom(256)
        index.add_xor(f'bench_{i}.bin', (hash(i) & 0xFFFFFFFF), 256, data)
    elapsed = _time.time() - t0
    rate = 100 / elapsed
    print(f"XOR write (with JSON index): {rate:.0f} writes/sec (100 x 256B)")

    # XOR read
    t0 = _time.time()
    for i in range(100):
        index.read_xor(f'bench_{i}.bin')
    elapsed = _time.time() - t0
    rate = 100 / elapsed
    print(f"XOR read: {rate:.0f} reads/sec (100 x 256B)")

    # Cleanup
    for i in range(100):
        index.remove(f'bench_{i}.bin')

    # Compression ratio for random data
    ratios = []
    for i in range(50):
        data = os.urandom(256)
        seed = hash(i) & 0xFFFFFFFF
        ks = residual_keystream(seed, len(data))
        residual = xor_bytes(data, ks)
        compressed = zlib.compress(residual, 9)
        ratios.append(len(compressed) / len(data))

    avg_ratio = sum(ratios) / len(ratios) * 100
    print(f"XOR residual compression (random data): {avg_ratio:.1f}% avg (100%=no compression)")

    # Compression ratio for structured data
    ratios = []
    for i in range(50):
        data = b'Hello World! ' * 20  # 260 bytes, repeating
        seed = hash(i + 1000) & 0xFFFFFFFF
        ks = residual_keystream(seed, len(data))
        residual = xor_bytes(data, ks)
        compressed = zlib.compress(residual, 9)
        ratios.append(len(compressed) / len(data))

    avg_ratio = sum(ratios) / len(ratios) * 100
    print(f"XOR residual compression (structured): {avg_ratio:.1f}% avg")


# ─── Setup Command ────────────────────────────────────────────────

def cmd_setup(store_dir=None, mount_point=None):
    """Install SeedFS as a systemd service for auto-mount at boot."""
    import subprocess, shutil

    script_path = os.path.abspath(__file__)
    store_dir = store_dir or os.path.expanduser('~/.seedfs/store')
    mount_point = mount_point or '/mnt/seedfs'
    service_src = os.path.join(os.path.dirname(script_path), 'seedfs.service')

    # Create store and init if needed
    if not os.path.exists(os.path.join(store_dir, 'index.json')):
        print(f"Initializing SeedFS store at {store_dir}...")
        cmd_mkfs(store_dir)

    # Create mount point
    os.makedirs(mount_point, exist_ok=True)

    # Generate service file with actual paths
    service_content = f"""[Unit]
Description=SeedFS — One Pixel = One File (FUSE)
After=network.target local-fs.target
Wants=local-fs.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 {script_path} mount {store_dir} {mount_point}
ExecStop=/usr/bin/fusermount3 -u {mount_point}
Restart=on-failure
RestartSec=5
StandardOutput=journal
StandardError=journal
SyslogIdentifier=seedfs

# Needs user-level FUSE access
User={os.environ.get('USER', 'jericho')}
Group={os.environ.get('USER', 'jericho')}

[Install]
WantedBy=multi-user.target
"""

    service_path = '/etc/systemd/system/seedfs.service'

    print(f"Installing systemd service...")
    print(f"  Store:    {store_dir}")
    print(f"  Mount:    {mount_point}")
    print(f"  Script:   {script_path}")
    print()

    # Write service file via sudo
    try:
        proc = subprocess.run(
            ['sudo', 'tee', service_path],
            input=service_content, capture_output=True, text=True
        )
        if proc.returncode != 0:
            print(f"Failed to write service file: {proc.stderr}")
            return

        # Reload and enable
        for cmd in [
            ['sudo', 'systemctl', 'daemon-reload'],
            ['sudo', 'systemctl', 'enable', 'seedfs.service'],
        ]:
            proc = subprocess.run(cmd, capture_output=True, text=True)
            if proc.returncode != 0:
                print(f"Warning: {' '.join(cmd)} failed: {proc.stderr}")

        print()
        print("Service installed. Commands:")
        print(f"  sudo systemctl start seedfs       # mount now")
        print(f"  sudo systemctl stop seedfs        # unmount")
        print(f"  sudo systemctl status seedfs      # check status")
        print(f"  journalctl -u seedfs -f           # watch logs")
        print()
        print(f"Once started, files at {mount_point}/ are seed-generated.")
        print("Start it now? (the service is enabled for next boot)")

    except FileNotFoundError:
        print("sudo not found. To install manually:")
        print(f"  sudo cp {service_src} {service_path}")
        print(f"  # Edit paths in the service file")
        print(f"  sudo systemctl daemon-reload")
        print(f"  sudo systemctl enable --now seedfs")


# ─── CLI ───────────────────────────────────────────────────────────

def main():
    usage = """
SeedFS — One pixel = one file

Usage:
  python3 scripts/seedfs.py mkfs <dir>
  python3 scripts/seedfs.py mount <dir> <mountpoint>
  python3 scripts/seedfs.py stat <dir>
  python3 scripts/seedfs.py expand <seed_hex> [length]
  python3 scripts/seedfs.py find <hex_prefix>
  python3 scripts/seedfs.py bench <dir>
  python3 scripts/seedfs.py setup [--store DIR] [--mount POINT]
"""
    if len(sys.argv) < 2:
        print(usage)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == 'mkfs':
        cmd_mkfs(sys.argv[2])
    elif cmd == 'mount':
        if len(sys.argv) < 4:
            print("Usage: seedfs.py mount <dir> <mountpoint>")
            sys.exit(1)
        cmd_mount(sys.argv[2], sys.argv[3])
    elif cmd == 'stat':
        cmd_stat(sys.argv[2])
    elif cmd == 'expand':
        length = int(sys.argv[3]) if len(sys.argv) > 3 else 64
        cmd_expand(sys.argv[2], length)
    elif cmd == 'find':
        cmd_find(sys.argv[2])
    elif cmd == 'bench':
        cmd_bench(sys.argv[2])
    elif cmd == 'setup':
        store = None
        mount = None
        i = 2
        while i < len(sys.argv):
            if sys.argv[i] == '--store' and i + 1 < len(sys.argv):
                store = sys.argv[i + 1]; i += 2
            elif sys.argv[i] == '--mount' and i + 1 < len(sys.argv):
                mount = sys.argv[i + 1]; i += 2
            else:
                i += 1
        cmd_setup(store, mount)
    else:
        print(usage)
        sys.exit(1)


if __name__ == '__main__':
    main()
