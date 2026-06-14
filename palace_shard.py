#!/usr/bin/env python3
"""
Palace Shard — encode/decode binary data as Memory Palace shard PNGs.
Stores kernel, initramfs, or any binary as palace-resident pixel data.

Usage:
  # Encode a binary file into a palace shard PNG
  python3 palace_shard.py encode kernel.bin kernel_shard.png

  # Decode a palace shard PNG back to binary
  python3 palace_shard.py decode kernel_shard.png kernel.bin

  # Register a shard in the palace facts index
  python3 palace_shard.py register kernel_shard.png "boot:kernel" v1

  # Boot: decode both kernel and initramfs from palace, then boot
  python3 palace_shard.py boot
"""
import sys, os, struct, json, hashlib
from pathlib import Path
from PIL import Image

HERE = Path(__file__).parent
FACTS_FILE = HERE / "memory_palace_facts.json"

# ── Encode binary → PNG ──────────────────────────────────────────────

def encode_to_png(data: bytes, output_path: Path, mode: str = "RGB"):
    """Encode binary data as a PNG where pixels hold the bytes.
    
    Format: 8-byte header (original size as little-endian u64) + data bytes.
    RGB mode: 3 bytes/pixel. RGBA mode: 4 bytes/pixel.
    """
    # Build payload: header + data
    header = struct.pack("<Q", len(data))
    payload = header + data
    
    # Determine bytes per pixel
    bpp = 3 if mode == "RGB" else 4
    pixels_needed = (len(payload) + bpp - 1) // bpp
    
    # Find minimal square dimensions
    import math
    side = math.isqrt(pixels_needed)
    if side * side < pixels_needed:
        side += 1
    
    # Create pixel buffer
    pixel_data = bytearray(side * side * bpp)
    for i, byte in enumerate(payload):
        if i < len(pixel_data):
            pixel_data[i] = byte
    
    # Create image
    img = Image.frombuffer(mode, (side, side), bytes(pixel_data))
    img.save(output_path)
    
    actual_pixels = side * side
    stored_bytes = actual_pixels * bpp
    print(f"Encoded: {len(data)} bytes → {output_path.name}")
    print(f"  PNG: {side}x{side} {mode}, {stored_bytes} bytes capacity")
    print(f"  Efficiency: {len(payload)/stored_bytes*100:.1f}%")
    return side

# ── Decode PNG → binary ──────────────────────────────────────────────

def decode_from_png(input_path: Path, output_path: Path = None):
    """Decode a shard PNG back to binary. Returns the binary data."""
    img = Image.open(str(input_path))
    mode = img.mode
    bpp = 3 if mode == "RGB" else 4
    
    pixel_data = img.tobytes()
    
    # Read header (first 8 bytes = original size as u64 LE)
    if len(pixel_data) < 8:
        raise ValueError("Shard too small (need at least 8 bytes for header)")
    
    original_size = struct.unpack("<Q", pixel_data[:8])[0]
    
    # Extract data
    data = bytes(pixel_data[8:8 + original_size])
    
    # Verify
    sha256 = hashlib.sha256(data).hexdigest()
    
    if output_path:
        output_path.write_bytes(data)
        print(f"Decoded: {output_path.name} ({len(data)} bytes, sha256={sha256[:16]}...)")
    
    return data, sha256, original_size

# ── Register in palace facts ─────────────────────────────────────────

def register_in_palace(shard_path: str, subject: str, version: str = "v1"):
    """Register a shard PNG in the palace facts index."""
    if not Path(shard_path).exists():
        print(f"Error: {shard_path} not found")
        sys.exit(1)
    
    data, sha256, size = decode_from_png(Path(shard_path))
    
    facts = {"version": 1, "facts": []}
    if FACTS_FILE.exists():
        with open(FACTS_FILE) as f:
            facts = json.load(f)
    
    # Remove old entry with same subject
    facts["facts"] = [f for f in facts["facts"] if f.get("subject") != subject]
    
    max_id = max([f["id"] for f in facts["facts"]], default=0)
    
    shard_name = Path(shard_path).name
    facts["facts"].append({
        "id": max_id + 1,
        "tier": "critical",
        "subject": subject,
        "content": json.dumps({
            "shard": shard_name,
            "sha256": sha256,
            "size_bytes": size,
            "version": version,
        }),
        "source": "palace-shard",
        "ring": 0, "angle": 0,
    })
    
    with open(FACTS_FILE, "w") as f:
        json.dump(facts, f, indent=2)
    
    print(f"Registered: {shard_name} as '{subject}' (fact #{max_id+1})")

# ── Boot from palace shards ──────────────────────────────────────────

def boot_from_palace():
    """Find kernel and initramfs shards in palace, decode to tmp files, print QEMU cmd."""
    if not FACTS_FILE.exists():
        print("Error: memory_palace_facts.json not found")
        sys.exit(1)
    
    with open(FACTS_FILE) as f:
        facts = json.load(f)
    
    # Find boot-related shards
    boot_facts = {}
    for fact in facts["facts"]:
        if fact.get("subject") in ("boot:kernel", "boot:initramfs"):
            boot_facts[fact["subject"]] = fact
    
    if "boot:kernel" not in boot_facts:
        print("Error: no boot:kernel shard registered in palace")
        sys.exit(1)
    if "boot:initramfs" not in boot_facts:
        print("Error: no boot:initramfs shard registered in palace")
        sys.exit(1)
    
    kernel_meta = json.loads(boot_facts["boot:kernel"]["content"])
    initramfs_meta = json.loads(boot_facts["boot:initramfs"]["content"])
    
    # Decode shards to temp files
    tmp_dir = Path("/tmp/palace-boot")
    tmp_dir.mkdir(parents=True, exist_ok=True)
    
    kernel_path = tmp_dir / "kernel"
    initramfs_path = tmp_dir / "initramfs.img"
    
    kernel_shard = HERE / kernel_meta["shard"]
    initramfs_shard = HERE / initramfs_meta["shard"]
    
    if not kernel_shard.exists():
        print(f"Error: kernel shard not found: {kernel_shard}")
        sys.exit(1)
    if not initramfs_shard.exists():
        print(f"Error: initramfs shard not found: {initramfs_shard}")
        sys.exit(1)
    
    print("Decoding kernel from palace shard...")
    _, k_sha256, k_size = decode_from_png(kernel_shard, kernel_path)
    
    print("Decoding initramfs from palace shard...")
    _, i_sha256, i_size = decode_from_png(initramfs_shard, initramfs_path)
    
    # Verify hashes
    if k_sha256 != kernel_meta["sha256"]:
        print(f"⚠️  Kernel hash mismatch! Expected {kernel_meta['sha256'][:16]}, got {k_sha256[:16]}")
    if i_sha256 != initramfs_meta["sha256"]:
        print(f"⚠️  Initramfs hash mismatch! Expected {initramfs_meta['sha256'][:16]}, got {i_sha256[:16]}")
    
    print(f"\nReady to boot:")
    print(f"  Kernel: {kernel_path} ({k_size} bytes)")
    print(f"  Initramfs: {initramfs_path} ({i_size} bytes)")
    
    # Output commands for the boot script
    print(f"\nPALACE_KERNEL={kernel_path}")
    print(f"PALACE_INITRAMFS={initramfs_path}")

# ── Main ─────────────────────────────────────────────────────────────

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__); sys.exit(1)
    
    cmd = sys.argv[1]
    
    if cmd == "encode" and len(sys.argv) >= 4:
        input_path = Path(sys.argv[2])
        if not input_path.exists():
            print(f"Error: {input_path} not found"); sys.exit(1)
        data = input_path.read_bytes()
        output_path = Path(sys.argv[3])
        mode = sys.argv[4] if len(sys.argv) > 4 else "RGBA"
        if mode not in ("RGB", "RGBA"):
            print("Mode must be RGB or RGBA"); sys.exit(1)
        encode_to_png(data, output_path, mode)
    
    elif cmd == "decode" and len(sys.argv) >= 4:
        input_path = Path(sys.argv[2])
        if not input_path.exists():
            print(f"Error: {input_path} not found"); sys.exit(1)
        output_path = Path(sys.argv[3])
        decode_from_png(input_path, output_path)
    
    elif cmd == "register" and len(sys.argv) >= 4:
        register_in_palace(sys.argv[2], sys.argv[3], sys.argv[4] if len(sys.argv) > 4 else "v1")
    
    elif cmd == "boot":
        boot_from_palace()
    
    else:
        print(__doc__)
