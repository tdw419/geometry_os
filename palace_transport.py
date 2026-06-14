#!/usr/bin/env python3
"""
Palace Transport Layer - Phase 0.A Implementation

Encodes arbitrary binary data (kernels, initramfs, etc.) into Memory Palace
pixels using the Raw Spatial (RTS) format. Each pixel = 32 bits big-endian.

Format:
  - Each 256×256 palace entry = 65536 pixels = 262,144 bytes
  - Pixels stored in raster order (top-left to bottom-right)
  - Each pixel is RGBA: [R][G][B][A] = 32-bit big-endian value
  - Trailing bytes padded with zeros
  - All opaque (A=255)

Usage:
  python3 palace_transport.py write <binary_file> <palace_name>
  python3 palace_transport.py load <palace_name> <output_file>
  python3 palace_transport.py test <size_mb>
"""

import hashlib
import json
import sys
from pathlib import Path
from typing import List, Tuple

PALACE_DIR = Path.home() / "projects/zion/projects/geometry_os/geometry_os/programs"
MANIFEST_FILE = PALACE_DIR / "palace_manifest.json"


def write_to_palace(binary_file: Path, palace_name: str) -> str:
    """
    Encode binary file into palace PNG files.

    Args:
        binary_file: Input binary file (e.g., vmlinux, initramfs.cpio.gz)
        palace_name: Name for this palace entry (e.g., "linux_kernel")

    Returns:
        List of generated PNG file paths
    """
    # Read binary data
    with open(binary_file, "rb") as f:
        data = f.read()

    print(f"[*] Encoding {len(data):,} bytes from {binary_file.name}")

    # Calculate checksum
    checksum = hashlib.sha256(data).hexdigest()

    # Calculate how many palace entries needed
    # Each entry: 256×256 pixels = 65536 pixels = 262,144 bytes
    bytes_per_entry = 256 * 256 * 4  # 262,144 bytes
    num_entries = (len(data) + bytes_per_entry - 1) // bytes_per_entry

    print(f"[*] Need {num_entries} palace entry/ies ({bytes_per_entry:,} bytes each)")

    # Generate palace entries
    generated_files = []

    for entry_idx in range(num_entries):
        # Extract chunk
        offset = entry_idx * bytes_per_entry
        chunk = data[offset:offset + bytes_per_entry]

        # Pad to exact size
        chunk += b'\x00' * (bytes_per_entry - len(chunk))

        # Convert to pixels (big-endian u32 per pixel)
        pixels = []
        for i in range(0, len(chunk), 4):
            # Read big-endian u32
            value = int.from_bytes(chunk[i:i+4], byteorder='big')

            # Split into RGBA (preserve all 4 bytes)
            r = (value >> 24) & 0xFF
            g = (value >> 16) & 0xFF
            b = (value >> 8) & 0xFF
            a = value & 0xFF  # Preserve original alpha byte

            pixels.append((r, g, b, a))

        # Write PNG
        output_file = PALACE_DIR / f"palace_{palace_name}_{entry_idx:03d}.png"
        _write_png(output_file, pixels, 256, 256)
        generated_files.append(str(output_file))

        print(f"    {output_file.name}: {len(chunk):,} bytes")

    # Update manifest
    _update_manifest(palace_name, binary_file.name, len(data), checksum,
                     num_entries, bytes_per_entry)

    print(f"[*] Wrote {len(generated_files)} palace file(s)")
    print(f"[*] SHA256: {checksum}")

    return json.dumps({
        "name": palace_name,
        "source_file": str(binary_file),
        "total_bytes": len(data),
        "checksum": checksum,
        "num_entries": num_entries,
        "bytes_per_entry": bytes_per_entry,
        "files": generated_files
    }, indent=2)


def load_from_palace(palace_name: str, output_file: Path) -> str:
    """
    Decode palace PNG files back to binary.

    Args:
        palace_name: Name of the palace entry
        output_file: Where to write decoded binary

    Returns:
        JSON status with checksum verification
    """
    # Load manifest
    manifest = _load_manifest()
    if palace_name not in manifest:
        return json.dumps({"error": f"Palace '{palace_name}' not found"}, indent=2)

    entry = manifest[palace_name]
    num_entries = entry["num_entries"]
    total_bytes = entry["total_bytes"]
    expected_checksum = entry["checksum"]

    print(f"[*] Loading {total_bytes:,} bytes from {num_entries} palace file(s)")

    # Concatenate all entries
    all_data = bytearray()

    for entry_idx in range(num_entries):
        input_file = PALACE_DIR / f"palace_{palace_name}_{entry_idx:03d}.png"

        if not input_file.exists():
            return json.dumps({"error": f"Missing file: {input_file.name}"}, indent=2)

        # Read PNG and extract pixels
        pixels = _read_png(input_file)

        # Convert pixels back to bytes
        for r, g, b, a in pixels:
            # Combine RGBA into big-endian u32 (keep original alpha)
            value = (r << 24) | (g << 16) | (b << 8) | a
            all_data.extend(value.to_bytes(4, byteorder='big'))

        print(f"    {input_file.name}: {len(pixels)} pixels")

    # Truncate to original size (remove padding)
    all_data = all_data[:total_bytes]

    # Write output
    with open(output_file, "wb") as f:
        f.write(all_data)

    # Verify checksum
    actual_checksum = hashlib.sha256(all_data).hexdigest()
    checksums_match = actual_checksum == expected_checksum

    print(f"[*] Wrote {len(all_data):,} bytes to {output_file}")
    print(f"[*] SHA256: {actual_checksum}")
    print(f"[*] Checksum: {'OK' if checksums_match else 'MISMATCH'}")

    return json.dumps({
        "name": palace_name,
        "output_file": str(output_file),
        "total_bytes": len(all_data),
        "expected_checksum": expected_checksum,
        "actual_checksum": actual_checksum,
        "checksums_match": checksums_match
    }, indent=2)


def test_roundtrip(size_mb: int = 5) -> str:
    """
    Test palace roundtrip: encode → decode → verify.

    Args:
        size_mb: Size of test data in megabytes

    Returns:
        JSON test results
    """
    test_file = Path(f"/tmp/palace_test_{size_mb}mb.dat")
    output_file = Path(f"/tmp/palace_test_output_{size_mb}mb.dat")

    print(f"[*] Phase 0.A Roundtrip Test ({size_mb}MB)")
    print("=" * 60)

    # Generate test data (pseudorandom but deterministic)
    num_bytes = size_mb * 1024 * 1024
    test_data = bytearray()

    # Use a simple PRNG for deterministic test data
    for i in range(num_bytes):
        test_data.append((i * 1103515245 + 12345) & 0xFF)

    with open(test_file, "wb") as f:
        f.write(test_data)

    print(f"[*] Generated {num_bytes:,} bytes of test data")
    expected_checksum = hashlib.sha256(test_data).hexdigest()
    print(f"[*] Expected SHA256: {expected_checksum}")
    print()

    # Write to palace
    print("[*] Step 1: PALACE_WRITE")
    write_result = json.loads(write_to_palace(test_file, "roundtrip_test"))
    print()

    # Load from palace
    print("[*] Step 2: PALACE_LOAD")
    load_result = json.loads(load_from_palace("roundtrip_test", output_file))
    print()

    # Verify
    print("[*] Step 3: Verification")
    with open(output_file, "rb") as f:
        recovered_data = f.read()

    matches = recovered_data == test_data
    print(f"    Byte-for-byte match: {matches}")

    if not matches:
        # Find first mismatch
        for i, (a, b) in enumerate(zip(test_data, recovered_data)):
            if a != b:
                print(f"    First mismatch at byte {i}: 0x{a:02X} != 0x{b:02X}")
                break

    # Cleanup
    test_file.unlink(missing_ok=True)
    output_file.unlink(missing_ok=True)

    # Remove palace files
    for i in range(write_result["num_entries"]):
        Path(write_result["files"][i]).unlink(missing_ok=True)

    # Remove from manifest
    manifest = _load_manifest()
    if "roundtrip_test" in manifest:
        del manifest["roundtrip_test"]
        _save_manifest(manifest)

    print()
    print("[*] Phase 0.A Test Complete")
    print("=" * 60)

    return json.dumps({
        "test_name": f"roundtrip_{size_mb}mb",
        "size_bytes": num_bytes,
        "expected_checksum": expected_checksum,
        "actual_checksum": load_result["actual_checksum"],
        "byte_for_byte_match": matches,
        "write_result": write_result,
        "load_result": load_result,
        "status": "PASS" if matches else "FAIL"
    }, indent=2)


def _write_png(path: Path, pixels: List[Tuple[int, int, int, int]], width: int, height: int):
    """Write pixels to PNG file."""
    try:
        import PIL.Image
    except ImportError:
        raise RuntimeError("Pillow not installed. Run: pip install Pillow")

    # Create image
    img = PIL.Image.new("RGBA", (width, height))
    img.putdata(pixels)
    img.save(path)


def _read_png(path: Path) -> List[Tuple[int, int, int, int]]:
    """Read pixels from PNG file."""
    try:
        import PIL.Image
    except ImportError:
        raise RuntimeError("Pillow not installed. Run: pip install Pillow")

    img = PIL.Image.open(path)
    if img.mode != "RGBA":
        img = img.convert("RGBA")

    return list(img.getdata())


def _load_manifest() -> dict:
    """Load palace manifest."""
    if MANIFEST_FILE.exists():
        with open(MANIFEST_FILE) as f:
            return json.load(f)
    return {}


def _save_manifest(manifest: dict):
    """Save palace manifest."""
    with open(MANIFEST_FILE, "w") as f:
        json.dump(manifest, f, indent=2)


def _update_manifest(name: str, source: str, total_bytes: int, checksum: str,
                     num_entries: int, bytes_per_entry: int):
    """Update manifest with new entry."""
    manifest = _load_manifest()

    manifest[name] = {
        "source_file": source,
        "total_bytes": total_bytes,
        "checksum": checksum,
        "num_entries": num_entries,
        "bytes_per_entry": bytes_per_entry,
        "timestamp": Path(source).stat().st_mtime if Path(source).exists() else 0
    }

    _save_manifest(manifest)


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "write":
        if len(sys.argv) < 4:
            print("Usage: palace_transport.py write <binary_file> <palace_name>")
            sys.exit(1)
        binary_file = Path(sys.argv[2])
        palace_name = sys.argv[3]
        result = write_to_palace(binary_file, palace_name)
        print(result)

    elif cmd == "load":
        if len(sys.argv) < 4:
            print("Usage: palace_transport.py load <palace_name> <output_file>")
            sys.exit(1)
        palace_name = sys.argv[2]
        output_file = Path(sys.argv[3])
        result = load_from_palace(palace_name, output_file)
        print(result)

    elif cmd == "test":
        size_mb = int(sys.argv[2]) if len(sys.argv) > 2 else 5
        result = test_roundtrip(size_mb)
        print(result)

    else:
        print(f"Unknown command: {cmd}")
        print("Commands: write, load, test")
        sys.exit(1)


if __name__ == "__main__":
    main()