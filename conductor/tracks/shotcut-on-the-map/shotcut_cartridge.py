#!/usr/bin/env python3
"""
Shotcut VM Cartridge System
Creates a PixelRTS cartridge for the Shotcut video editing VM.

The cartridge approach:
1. Creates a visual PNG representation (thumbnail/fingerprint)
2. Stores metadata for VM configuration
3. Can be "booted" to launch the VM with the working bridge

For large disk images, we use a reference-based approach where the
PNG acts as a visual identifier and the actual disk image is stored
separately (or can be regenerated/retrieved on demand).
"""

import json
import hashlib
import os
from pathlib import Path
from datetime import datetime
from PIL import Image
import numpy as np

# Import PixelRTS v2 core for encoding
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os/pixelrts_v2/dist/spatial-v0.1.0/tools/lib')
from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder, HilbertCurve, calculate_grid_size


class ShotcutCartridge:
    """
    Manages Shotcut VM cartridges - visual PNG representations with
    embedded metadata for VM boot configuration.
    """

    CARTRIDGE_VERSION = "1.0"
    CARTRIDGE_TYPE = "shotcut-vm"

    def __init__(self, disk_path: str, output_dir: str = None):
        """
        Initialize cartridge creator.

        Args:
            disk_path: Path to the qcow2 disk image
            output_dir: Directory for output files (default: same as disk)
        """
        self.disk_path = Path(disk_path)
        self.output_dir = Path(output_dir) if output_dir else self.disk_path.parent

        if not self.disk_path.exists():
            raise FileNotFoundError(f"Disk image not found: {disk_path}")

    def _calculate_disk_hash(self, sample_size: int = 1024 * 1024) -> str:
        """
        Calculate SHA256 hash of disk image (sampling first/last MB for speed).

        Args:
            sample_size: Bytes to sample from start and end

        Returns:
            SHA256 hash string
        """
        hasher = hashlib.sha256()
        file_size = self.disk_path.stat().st_size

        with open(self.disk_path, 'rb') as f:
            # Sample from start
            hasher.update(f.read(min(sample_size, file_size)))

            # Sample from end
            if file_size > sample_size:
                f.seek(-sample_size, 2)
                hasher.update(f.read(sample_size))

            # Add file size to hash
            hasher.update(str(file_size).encode())

        return hasher.hexdigest()

    def _create_visual_fingerprint(self, size: int = 256) -> np.ndarray:
        """
        Create a visual fingerprint of the disk image.
        Samples bytes across the disk to create a unique visual pattern.

        Args:
            size: Output image dimension (size x size)

        Returns:
            RGBA numpy array
        """
        file_size = self.disk_path.stat().st_size
        chunk_size = 4096  # Sample 4KB at a time
        num_samples = size * size  # One sample per pixel

        # Calculate sample positions spread across the disk
        sample_positions = np.linspace(0, file_size - chunk_size, num_samples, dtype=np.int64)

        # Create pixel array
        pixels = np.zeros((size, size, 4), dtype=np.uint8)

        with open(self.disk_path, 'rb') as f:
            for idx, pos in enumerate(sample_positions):
                x = idx % size
                y = idx // size

                f.seek(pos)
                chunk = f.read(chunk_size)

                # Calculate entropy for this chunk
                if len(chunk) > 0:
                    byte_counts = np.bincount(np.frombuffer(chunk, dtype=np.uint8), minlength=256)
                    probs = byte_counts / len(chunk)
                    probs = probs[probs > 0]
                    entropy = -np.sum(probs * np.log2(probs)) / 8.0  # Normalize to 0-1

                    # Calculate average byte value
                    avg_byte = np.mean(np.frombuffer(chunk, dtype=np.uint8))

                    # Calculate variance
                    variance = np.var(np.frombuffer(chunk, dtype=np.uint8))
                else:
                    entropy = 0
                    avg_byte = 0
                    variance = 0

                # Encode as RGBA
                # R: Entropy (information density)
                # G: Average byte value
                # B: Variance indicator
                # A: 255 (opaque)
                pixels[y, x, 0] = int(entropy * 255)
                pixels[y, x, 1] = int(avg_byte)
                pixels[y, x, 2] = min(255, int(variance / 4))
                pixels[y, x, 3] = 255

        return pixels

    def _create_thumbnail(self, fingerprint: np.ndarray, size: int = 512) -> np.ndarray:
        """
        Create a Hilbert-mapped thumbnail from the fingerprint.

        Args:
            fingerprint: Raw fingerprint array
            size: Output size (must be power of 2)

        Returns:
            Remapped RGBA array
        """
        # Calculate order for Hilbert curve
        order = int(np.log2(size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Flatten fingerprint to 1D
        flat = fingerprint.reshape(-1, 4)

        # Create output array
        output = np.zeros((size, size, 4), dtype=np.uint8)

        # Map using Hilbert curve
        for idx, (x, y) in enumerate(lut):
            if idx < len(flat):
                output[y, x] = flat[idx]

        return output

    def create_cartridge(
        self,
        output_name: str = None,
        thumbnail_size: int = 512,
        vm_config: dict = None
    ) -> tuple:
        """
        Create a Shotcut VM cartridge.

        Args:
            output_name: Output filename (default: based on disk name)
            thumbnail_size: Thumbnail image dimension
            vm_config: Additional VM configuration

        Returns:
            Tuple of (png_path, meta_path)
        """
        if output_name is None:
            output_name = self.disk_path.stem + ".cartridge.rts.png"

        output_path = self.output_dir / output_name
        meta_path = output_path.with_suffix('.meta.json')

        print(f"[*] Creating Shotcut VM Cartridge")
        print(f"    Source: {self.disk_path}")
        print(f"    Output: {output_path}")

        # Get disk info
        file_size = self.disk_path.stat().st_size
        file_size_mb = file_size / (1024 * 1024)
        print(f"    Size: {file_size_mb:.2f} MB")

        # Calculate hash
        print("[*] Calculating disk fingerprint...")
        disk_hash = self._calculate_disk_hash()
        print(f"    Hash: {disk_hash[:16]}...")

        # Create visual fingerprint
        print("[*] Creating visual fingerprint...")
        fingerprint = self._create_visual_fingerprint(size=thumbnail_size)

        # Apply Hilbert curve mapping
        print("[*] Applying Hilbert curve mapping...")
        thumbnail = self._create_thumbnail(fingerprint, size=thumbnail_size)

        # Create metadata
        metadata = {
            "format": "ShotcutCartridge-1.0",
            "cartridge_type": self.CARTRIDGE_TYPE,
            "created": datetime.now().isoformat(),
            "source": {
                "disk_path": str(self.disk_path),
                "disk_size": file_size,
                "disk_size_human": f"{file_size_mb:.2f} MB",
                "sha256": disk_hash
            },
            "thumbnail": {
                "size": thumbnail_size,
                "encoding": "RGBA-Hilbert",
                "channels": {
                    "R": "Entropy (information density)",
                    "G": "Average byte value",
                    "B": "Variance indicator",
                    "A": "Opaque (255)"
                }
            },
            "vm_config": vm_config or {
                "memory": 4096,
                "cpus": 4,
                "vnc_port": 5900,
                "ssh_port": 2222,
                "boot_mode": "disk"
            },
            "bridge": {
                "script": "shotcut_vm_bridge.py",
                "port": 8768,
                "commands": ["boot", "screenshot", "input", "type", "click"]
            },
            "applications": {
                "shotcut": {
                    "installed": True,
                    "version": "latest",
                    "description": "Video editor"
                }
            }
        }

        # Save PNG
        print(f"[*] Saving cartridge image...")
        img = Image.fromarray(thumbnail, mode='RGBA')

        # Embed metadata in PNG text chunk
        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("ShotcutCartridge", json.dumps(metadata, separators=(',', ':')))
        img.save(output_path, pnginfo=pnginfo)

        # Save sidecar metadata
        print(f"[*] Saving metadata...")
        with open(meta_path, 'w') as f:
            json.dump(metadata, f, indent=2)

        print(f"\n✅ Cartridge created successfully!")
        print(f"   PNG: {output_path}")
        print(f"   Meta: {meta_path}")

        return str(output_path), str(meta_path)

    @staticmethod
    def load_cartridge(cartridge_path: str) -> dict:
        """
        Load cartridge metadata from PNG or JSON file.

        Args:
            cartridge_path: Path to .rts.png or .meta.json file

        Returns:
            Metadata dictionary
        """
        path = Path(cartridge_path)

        if path.suffix == '.json':
            with open(path, 'r') as f:
                return json.load(f)

        # Try to read from PNG
        img = Image.open(path)
        if "ShotcutCartridge" in img.info:
            return json.loads(img.info["ShotcutCartridge"])

        # Try sidecar JSON
        meta_path = path.with_suffix('.meta.json')
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                return json.load(f)

        raise ValueError(f"No cartridge metadata found in {cartridge_path}")

    @staticmethod
    def boot_from_cartridge(cartridge_path: str, bridge_url: str = "ws://localhost:8768"):
        """
        Boot VM from cartridge (requires running bridge).

        Args:
            cartridge_path: Path to cartridge file
            bridge_url: WebSocket bridge URL

        Returns:
            Boot response
        """
        import asyncio
        import websockets

        metadata = ShotcutCartridge.load_cartridge(cartridge_path)
        disk_path = metadata.get("source", {}).get("disk_path")

        if not disk_path:
            raise ValueError("Cartridge missing disk_path in metadata")

        vm_config = metadata.get("vm_config", {})

        async def boot():
            async with websockets.connect(bridge_url) as ws:
                command = {
                    "command": "boot",
                    "params": {
                        "disk": True,
                        "disk_path": disk_path,
                        **vm_config
                    }
                }
                await ws.send(json.dumps(command))
                response = await ws.recv()
                return json.loads(response)

        return asyncio.run(boot())


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Shotcut VM Cartridge System')
    parser.add_argument('disk', help='Path to qcow2 disk image')
    parser.add_argument('-o', '--output', help='Output directory')
    parser.add_argument('-s', '--size', type=int, default=512, help='Thumbnail size')
    parser.add_argument('--boot', action='store_true', help='Boot from cartridge')

    args = parser.parse_args()

    if args.boot:
        # Boot mode
        result = ShotcutCartridge.boot_from_cartridge(args.disk)
        print(json.dumps(result, indent=2))
    else:
        # Create mode
        cartridge = ShotcutCartridge(args.disk, args.output)
        png_path, meta_path = cartridge.create_cartridge(thumbnail_size=args.size)
        print(f"\nTo boot: python3 {__file__} {png_path} --boot")


if __name__ == "__main__":
    main()
