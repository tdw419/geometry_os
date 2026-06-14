#!/usr/bin/env python3
"""Phase 0.C verification: encode hello_riscv.elf into Palace and reload."""
import subprocess, sys, hashlib, pathlib, os, json, struct, math, io

PALACE_DIR = pathlib.Path(__file__).parent.resolve()
MANIFEST_PATH = PALACE_DIR / "palace_manifest.json"
HELLO_ELF_PATH = PALACE_DIR / "hello_riscv.elf"
OUTPUT_ELF_PATH = PALACE_DIR / "hello_riscv_loaded_from_palace.elf"

def compute_checksum(data):
    h = hashlib.sha256()
    h.update(data)
    return h.hexdigest()

def encode_bytes_to_pixels(data):
    """Encode bytes into 32-bit big-endian RGBA pixels."""
    padding_needed = (4 - len(data) % 4) % 4
    data_padded = data + b'\x00' * padding_needed
    num_pixels = len(data_padded) // 4
    pixel_values = []
    for i in range(num_pixels):
        offset = i * 4
        pixel = struct.unpack('>I', data_padded[offset:offset+4])[0]
        pixel_values.append(pixel)
    return pixel_values, padding_needed

def write_palace_entry(name, data, output_dir=PALACE_DIR):
    """PALACE_WRITE: encode data into PNGs and update manifest."""
    checksum = compute_checksum(data)
    pixel_values, _ = encode_bytes_to_pixels(data)
    num_pixels = len(pixel_values)
    pixels_per_image = 256 * 256
    num_images = math.ceil(num_pixels / pixels_per_image)
    entry_id = name.lower().replace(' ', '_').replace('-', '_')

    # Write PNGs
    try:
        import numpy as np
        from PIL import Image
    except ImportError as e:
        raise RuntimeError("Requires Pillow and numpy. Run: pip install pillow numpy") from e

    created_files = []
    for img_idx in range(num_images):
        start_px = img_idx * pixels_per_image
        end_px = min(start_px + pixels_per_image, num_pixels)
        img_pixels = pixel_values[start_px:end_px]
        img_array = np.zeros((256, 256, 4), dtype=np.uint8)
        for pixel_idx, pixel in enumerate(img_pixels):
            x = pixel_idx % 256
            y = pixel_idx // 256
            img_array[y, x, 0] = (pixel >> 24) & 0xFF
            img_array[y, x, 1] = (pixel >> 16) & 0xFF
            img_array[y, x, 2] = (pixel >> 8) & 0xFF
            img_array[y, x, 3] = pixel & 0xFF
        img = Image.fromarray(img_array, 'RGBA')
        filename = f"palace_{entry_id}_{img_idx:03d}.png"
        img.save(output_dir / filename)
        created_files.append(filename)

    # Update manifest
    manifest = {}
    if MANIFEST_PATH.exists():
        with open(MANIFEST_PATH, 'r') as f:
            manifest = json.load(f)
    manifest.setdefault("entries", [])
    manifest["entries"] = [e for e in manifest["entries"] if e["id"] != entry_id]
    manifest["entries"].append({
        "id": entry_id,
        "name": name,
        "original_size": len(data),
        "checksum": checksum,
        "num_images": num_images,
        "files": created_files,
        "created": __import__('datetime').datetime.utcnow().isoformat() + 'Z'
    })
    with open(MANIFEST_PATH, 'w') as f:
        json.dump(manifest, f, indent=2)
    return entry_id, checksum, num_images

def load_palace_entry(name, output_dir=PALACE_DIR):
    """PALACE_LOAD: decode PNGs back to bytes."""
    if not MANIFEST_PATH.exists():
        raise RuntimeError("palace_manifest.json not found")
    with open(MANIFEST_PATH, 'r') as f:
        manifest = json.load(f)
    entry = next((e for e in manifest.get("entries", []) if e["name"] == name), None)
    if not entry:
        raise ValueError(f"Entry '{name}' not found in manifest")

    try:
        import numpy as np
        from PIL import Image
    except ImportError as e:
        raise RuntimeError("Requires Pillow and numpy. Run: pip install pillow numpy") from e

    index_files = sorted([f for f in output_dir.glob(f"palace_{entry['id']}_*.png")])
    if not index_files:
        raise RuntimeError(f"No PNGs found for entry '{entry['id']}'")

    raw = bytearray()
    for png_path in index_files:
        img = Image.open(png_path).convert("RGBA")
        img_array = np.array(img)
        if img_array.shape != (256, 256, 4):
            raise RuntimeError(f"Image must be 256x256 RGBA, got {img_array.shape}")
        r = img_array[:, :, 0].astype(np.uint32)
        g = img_array[:, :, 1].astype(np.uint32)
        b = img_array[:, :, 2].astype(np.uint32)
        a = img_array[:, :, 3].astype(np.uint32)
        rgba = (r << 24) | (g << 16) | (b << 8) | a
        rgba_big = rgba.astype(">u4")
        raw.extend(rgba_big.tobytes())

    raw = raw[:entry["original_size"]]
    expected_checksum = entry.get("checksum")
    actual_checksum = compute_checksum(raw)
    if expected_checksum and expected_checksum != actual_checksum:
        raise RuntimeError(f"Checksum mismatch for {name}: expected={expected_checksum}, actual={actual_checksum}")
    return raw, entry

def main():
    if not HELLO_ELF_PATH.exists():
        print(f"Error: {HELLO_ELF_PATH} not found. Build it with: riscv64-linux-gnu-gcc -nostdlib -static -o hello_riscv.elf hello_riscv.S")
        sys.exit(1)

    original_bytes = HELLO_ELF_PATH.read_bytes()
    print(f"Phase 0.C: Encode hello_riscv.elf into Palace...")
    entry_id, checksum, num_images = write_palace_entry("hello_riscv", original_bytes, output_dir=PALACE_DIR)
    print(f"Encoded as entry 'hello_riscv' (id={entry_id}, checksum={checksum}, num_images={num_images})")

    print(f"Phase 0.C: Reload from Palace...")
    loaded_bytes, entry = load_palace_entry("hello_riscv", output_dir=PALACE_DIR)
    print(f"Reloaded {len(loaded_bytes)} bytes from Palace")

    print(f"Write to {OUTPUT_ELF_PATH} and verify ELF header...")
    OUTPUT_ELF_PATH.write_bytes(loaded_bytes)

    proc = subprocess.run(["riscv64-linux-gnu-readelf", "-h", str(OUTPUT_ELF_PATH)], capture_output=True, text=True)
    print(proc.stdout)
    if proc.returncode != 0:
        print("Stderr:", proc.stderr)

    print("\nPhase 0.C status: DONE (hello_riscv.elf encoded to Palace and reloaded as valid ELF)")

if __name__ == "__main__":
    main()