#!/usr/bin/env python3
"""
Memory Palace Block FUSE Driver

Presents a raw block device (disk image) backed by the Geometry OS
256x256 pixel canvas. Every byte in the disk maps to a pixel on the
canvas. QEMU writes to the disk become pixel writes on screen.

Pixel mapping: 256x256 RGBA pixels = 262,144 bytes (256 KB)
Each pixel = 4 bytes (R, G, B, A)
Pixel index i → screen coordinates (i % 256, i // 256)

The driver connects to the GeoOS socket at /tmp/geo_cmd.sock to
read/write pixel data. When QEMU writes sector data, those bytes
appear as 128 painted pixels on the canvas (512 bytes / 4 = 128 pixels).

Usage:
    mkdir -p /mnt/memory_palace
    python3 palace_block_fuse.py /mnt/memory_palace &
    qemu-system-... -drive file=/mnt/memory_palace/pixel_disk.raw,format=raw
    fusermount -u /mnt/memory_palace  # Unmount
"""

import errno
import json
import logging
import os
import socket
import struct
import sys
import threading
import time
from pathlib import Path

try:
    from fuse import FUSE, FuseOSError, Operations
except ImportError:
    print("FUSE not installed. Install with: pip3 install fusepy")
    sys.exit(1)

# Configuration
BACKING_FILE = Path("/tmp/palace_block_backing.bin")
CANVAS_SIZE = 256 * 256  # 65,536 pixels
PIXEL_BYTES = 4
DISK_SIZE = CANVAS_SIZE * PIXEL_BYTES  # 262,144 bytes (256 KB)
SOCKET_PATH = "/tmp/geo_cmd.sock"
SOCKET_TIMEOUT = 2.0

logging.basicConfig(level=logging.INFO, format="[palace_block] %(message)s")
logger = logging.getLogger(__name__)


class GeoOSSocket:
    """Connection to the GeoOS /tmp/geo_cmd.sock for pixel I/O."""

    def __init__(self):
        self.sock = None
        self.lock = threading.Lock()

    def connect(self):
        """Connect to the GeoOS socket. Returns True on success."""
        if self.sock is not None:
            return True
        try:
            self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            self.sock.settimeout(SOCKET_TIMEOUT)
            self.sock.connect(SOCKET_PATH)
            logger.info("Connected to GeoOS socket")
            return True
        except (socket.error, FileNotFoundError) as e:
            logger.warning(f"Cannot connect to GeoOS socket: {e}")
            self.sock = None
            return False

    def disconnect(self):
        if self.sock is not None:
            try:
                self.sock.close()
            except Exception:
                pass
            self.sock = None

    def send_command(self, command: str) -> str:
        """Send a command and receive the full response."""
        with self.lock:
            if self.sock is None:
                if not self.connect():
                    return ""
            try:
                payload = (command.strip() + "\n").encode("utf-8")
                self.sock.sendall(payload)

                # Read response (commands return a single line or multiple lines)
                response = b""
                self.sock.settimeout(2.0)
                while True:
                    try:
                        chunk = self.sock.recv(65536)
                        if not chunk:
                            break
                        response += chunk
                        # If the response ends with a prompt-looking newline, stop
                        if response.endswith(b"\n") and not any(
                            cmd in command for cmd in ["screen_dump", "screen"]
                        ):
                            break
                        # For screen_dump, wait for the full dump (256 lines)
                        if command in ("screen", "screen_dump"):
                            lines = response.count(b"\n")
                            if lines >= 256:
                                break
                        # Time budget exceeded
                    except socket.timeout:
                        break
                    except (ConnectionError, BrokenPipeError):
                        break
                return response.decode("utf-8", errors="replace")
            except (socket.error, ConnectionError, BrokenPipeError) as e:
                logger.warning(f"Socket error: {e}")
                self.disconnect()
                return ""

    def read_pixels(self) -> bytes:
        """Read the full 256x256 canvas as RGBA bytes (262,144 bytes)."""
        response = self.send_command("screen_dump")
        if not response:
            return b""

        try:
            # Parse the screen dump: 256 lines of space-separated RRGGBB hex values
            pixels = bytearray(DISK_SIZE)
            lines = response.strip().split("\n")
            for y, line in enumerate(lines[:256]):
                parts = line.strip().split()
                for x, hex_val in enumerate(parts[:256]):
                    if len(hex_val) >= 6:
                        rgb = int(hex_val[:6], 16)
                        idx = (y * 256 + x) * 4
                        pixels[idx] = (rgb >> 16) & 0xFF       # R
                        pixels[idx + 1] = (rgb >> 8) & 0xFF    # G
                        pixels[idx + 2] = rgb & 0xFF            # B
                        pixels[idx + 3] = 0xFF                  # A
            return bytes(pixels)
        except (ValueError, IndexError) as e:
            logger.warning(f"Error parsing screen dump: {e}")
            return b""

    def write_pixels(self, data: bytes, offset_pixels: int = 0):
        """Write RGBA pixel data to the canvas starting at pixel offset.

        data: RGBA bytes, 4 bytes per pixel
        offset_pixels: starting pixel index on canvas
        """
        if not data:
            return 0

        # Convert RGBA bytes to RRGGBB hex values for the socket command
        pixel_count = len(data) // 4
        hex_values = []
        for i in range(pixel_count):
            idx = i * 4
            if idx + 3 < len(data):
                r, g, b = data[idx], data[idx + 1], data[idx + 2]
                hex_values.append(f"{r:02x}{g:02x}{b:02x}")

        if not hex_values:
            return 0

        # Send in chunks of 128 pixels (64 pixels to keep socket messages reasonable)
        chunk_size = 128
        total_written = 0
        for chunk_start in range(0, len(hex_values), chunk_size):
            chunk = hex_values[chunk_start:chunk_start + chunk_size]
            cmd = f"write_pixels {offset_pixels + chunk_start} {' '.join(chunk)}"
            resp = self.send_command(cmd)
            total_written += len(chunk)
            if not resp or "ok" not in resp:
                logger.warning(f"write_pixels response: {resp.strip()}")

        return total_written * 4  # bytes written

    def sync_to_canvas(self, data: bytes, byte_offset: int, byte_length: int):
        """Sync a byte range of the backing file to the canvas pixels."""
        data_len = len(data)
        if byte_offset >= data_len:
            return

        # Clamp to our disk size
        end = min(byte_offset + byte_length, data_len, DISK_SIZE)
        if end <= byte_offset:
            return

        # Convert byte offset to pixel offset
        pix_start = byte_offset // 4
        pix_end = (end + 3) // 4  # ceiling

        # Extract the relevant pixel data
        pixel_data = data[pix_start * 4:pix_end * 4]

        if pixel_data:
            self.write_pixels(pixel_data, pix_start)


class PalaceBlockFS(Operations):
    """FUSE filesystem exposing a block device backed by the GeoOS canvas."""

    def __init__(self, geo_sock: GeoOSSocket):
        logger.info("Initializing PalaceBlockFS...")
        self.geo = geo_sock
        self._init_backing()

    def _init_backing(self):
        """Initialize the backing file from canvas pixels or empty file."""
        if BACKING_FILE.exists() and BACKING_FILE.stat().st_size == DISK_SIZE:
            logger.info(f"Backing file exists: {BACKING_FILE}")
            return

        # Try to read from canvas
        pixels = self.geo.read_pixels()
        if pixels and len(pixels) == DISK_SIZE:
            BACKING_FILE.write_bytes(pixels)
            logger.info("Initialized backing from canvas pixels")
        else:
            # Create empty disk
            data = bytearray(DISK_SIZE)
            # Put a checkerboard pattern so we can see something
            for y in range(256):
                for x in range(256):
                    idx = (y * 256 + x) * 4
                    if (x // 8 + y // 8) % 2 == 0:
                        data[idx] = 0x20       # R
                        data[idx + 1] = 0x30   # G
                        data[idx + 2] = 0x40   # B
                    else:
                        data[idx] = 0x10
                        data[idx + 1] = 0x18
                        data[idx + 2] = 0x20
                    data[idx + 3] = 0xFF
            BACKING_FILE.write_bytes(data)
            logger.info("Created empty 256KB backing file")

    # FUSE Operations

    def getattr(self, path, fh=None):
        if path == "/":
            return {
                "st_mode": 0o40755,
                "st_nlink": 2,
                "st_size": 4096,
                "st_atime": time.time(),
                "st_mtime": time.time(),
                "st_ctime": time.time(),
                "st_uid": os.getuid(),
                "st_gid": os.getgid(),
            }

        # Our disk image file
        if path == "/pixel_disk.raw" or path == "/pixel_disk.img":
            mtime = BACKING_FILE.stat().st_mtime if BACKING_FILE.exists() else time.time()
            return {
                "st_mode": 0o100644,
                "st_nlink": 1,
                "st_size": DISK_SIZE,
                "st_atime": time.time(),
                "st_mtime": mtime,
                "st_ctime": mtime,
                "st_uid": os.getuid(),
                "st_gid": os.getgid(),
            }

        # Also expose disk_mirror with a larger logical size so the bootloader trick works
        # No, keep it simple - just one file

        raise FuseOSError(errno.ENOENT)

    def readdir(self, path, fh):
        entries = [".", ".."]
        if path == "/":
            entries.append("pixel_disk.raw")
        return entries

    def open(self, path, flags):
        if path in ("/pixel_disk.raw", "/pixel_disk.img"):
            return 1  # file handle
        raise FuseOSError(errno.ENOENT)

    def read(self, path, size, offset, fh):
        if path not in ("/pixel_disk.raw", "/pixel_disk.img"):
            raise FuseOSError(errno.ENOENT)

        if offset >= DISK_SIZE:
            return b""

        end = min(offset + size, DISK_SIZE)
        actual_size = end - offset

        try:
            with open(BACKING_FILE, "rb") as f:
                f.seek(offset)
                return f.read(actual_size)
        except (IOError, OSError) as e:
            logger.error(f"Read error: {e}")
            return b""

    def write(self, path, data, offset, fh):
        if path not in ("/pixel_disk.raw", "/pixel_disk.img"):
            raise FuseOSError(errno.ENOENT)

        if offset >= DISK_SIZE:
            return 0

        end = min(offset + len(data), DISK_SIZE)
        actual_len = end - offset

        try:
            # Write to backing file
            with open(BACKING_FILE, "r+b") as f:
                f.seek(offset)
                f.write(data[:actual_len])

            # Sync to canvas in background thread
            if self.geo is not None:
                full_data = BACKING_FILE.read_bytes()
                t = threading.Thread(
                    target=self.geo.sync_to_canvas,
                    args=(full_data, offset, actual_len),
                    daemon=True,
                )
                t.start()

            return actual_len
        except (IOError, OSError) as e:
            logger.error(f"Write error: {e}")
            return 0

    def release(self, path, fh):
        return 0

    def create(self, path, mode):
        if path in ("/pixel_disk.raw", "/pixel_disk.img"):
            return 1
        raise FuseOSError(errno.EROFS)

    def truncate(self, path, length, fh=None):
        if path in ("/pixel_disk.raw", "/pixel_disk.img"):
            return 0
        raise FuseOSError(errno.ENOENT)


def main(mountpoint: str):
    mount_path = Path(mountpoint)
    mount_path.mkdir(parents=True, exist_ok=True)

    geo = GeoOSSocket()
    geo.connect()

    logger.info(f"Mounting Palace Block FS at: {mountpoint}")
    logger.info(f"  Disk file:    {mountpoint}/pixel_disk.raw")
    logger.info(f"  Disk size:    {DISK_SIZE} bytes ({DISK_SIZE // 1024} KB)")
    logger.info(f"  Canvas:       256x256 pixels")
    logger.info(f"  Backing file: {BACKING_FILE}")
    logger.info(f"  GeoOS socket: {SOCKET_PATH}")
    logger.info("")
    logger.info("Boot QEMU with:")
    logger.info(f"  -drive file={mountpoint}/pixel_disk.raw,format=raw")
    logger.info("")
    logger.info("Unmount with: fusermount -u {mountpoint}")

    FUSE(PalaceBlockFS(geo), mountpoint, nothreads=True, foreground=True)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: palace_block_fuse.py <mountpoint>")
        print()
        print("Example:")
        print("  mkdir -p /mnt/memory_palace")
        print("  python3 palace_block_fuse.py /mnt/memory_palace")
        sys.exit(1)

    try:
        main(sys.argv[1])
    except KeyboardInterrupt:
        print("\nUnmounting...")
        os.system(f"fusermount -uz {sys.argv[1]} 2>/dev/null")
        print("Done.")
