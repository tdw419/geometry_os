#!/usr/bin/env python3
"""
EPL Pattern Analyzer -- Mine repeating structures from the Epigenetic Persistence Layer.

Pipeline:
  EPL Journal (.epl)
    -> Replay entries, reconstruct 64x64 chunk snapshots
    -> Detect repeating patterns (RLE runs, tile repetition, structural shapes)
    -> Rank candidates by compression gain
    -> Output promotion proposals (PixelPack strategies / world_gen rules)

Usage:
  python3 scripts/epl_analyzer.py analyze <path.epl> [--min-freq 3] [--tile-size 8]
  python3 scripts/epl_analyzer.py summary <path.epl>
  python3 scripts/epl_analyzer.py dump <path.epl> [--chunk-id 0x50000000A]
"""

import struct
import sys
import os
import hashlib
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from typing import List, Dict, Tuple, Optional

# ─── EPL Format Constants (matching src/epl.rs) ──────────────────────

EPL_MAGIC = b"GEOS_EPL_V1"
HEADER_SIZE = 32
CHUNK_PIXELS = 64 * 64  # 4096 pixels per chunk
CHUNK_BYTES = CHUNK_PIXELS * 4  # 16384 bytes (u32 per pixel)


# ─── RLE Codec (matching src/epl.rs) ─────────────────────────────────

def rle_decompress(data: bytes, expected_len: int) -> bytes:
    """Decompress RLE data matching Rust implementation: [count: u8, value: u8] pairs."""
    out = bytearray()
    i = 0
    while i + 1 < len(data) and len(out) < expected_len:
        count = data[i]
        val = data[i + 1]
        to_write = min(count, expected_len - len(out))
        out.extend([val] * to_write)
        i += 2
    return bytes(out[:expected_len])


# ─── EPL Reader ──────────────────────────────────────────────────────

@dataclass
class EplEntry:
    chunk_id: int
    raw_len: int
    rle_data: bytes
    checksum: int
    file_offset: int


@dataclass
class EplJournal:
    path: str
    version: int
    sequence: int
    entries: Dict[int, EplEntry]  # chunk_id -> latest entry
    total_entries: int  # including superseded versions


def read_epl(path: str) -> EplJournal:
    """Read and validate an EPL journal file. Returns parsed journal."""
    with open(path, 'rb') as f:
        data = f.read()

    if len(data) < HEADER_SIZE:
        raise ValueError(f"File too small ({len(data)} bytes), not a valid EPL journal")

    # Validate header
    magic = data[0:11]
    if magic != EPL_MAGIC:
        raise ValueError(f"Invalid magic: {magic!r}, expected {EPL_MAGIC!r}")

    version = struct.unpack_from('<I', data, 11)[0]
    sequence = struct.unpack_from('<Q', data, 15)[0]

    # Parse entries (latest wins for duplicate chunk_ids)
    entries = {}
    total_entries = 0
    pos = HEADER_SIZE

    while pos + 24 <= len(data):  # minimum entry: 16 header + 0 data + 8 checksum
        chunk_id = struct.unpack_from('<Q', data, pos)[0]
        raw_len = struct.unpack_from('<I', data, pos + 8)[0]
        rle_len = struct.unpack_from('<I', data, pos + 12)[0]

        entry_total = 16 + rle_len + 8
        if pos + entry_total > len(data):
            break  # truncated -- crash recovery boundary

        rle_data = data[pos + 16: pos + 16 + rle_len]
        checksum = struct.unpack_from('<Q', data, pos + 16 + rle_len)[0]

        # Verify checksum (xxh3_64)
        import xxhash
        computed = xxhash.xxh3_64(rle_data).intdigest()
        if computed != checksum:
            break  # checksum mismatch -- crash recovery

        entries[chunk_id] = EplEntry(
            chunk_id=chunk_id,
            raw_len=raw_len,
            rle_data=rle_data,
            checksum=checksum,
            file_offset=pos,
        )
        total_entries += 1
        pos += entry_total

    return EplJournal(
        path=path,
        version=version,
        sequence=sequence,
        entries=entries,
        total_entries=total_entries,
    )


def decompress_entry(entry: EplEntry) -> bytes:
    """Decompress an EPL entry back to raw chunk bytes."""
    return rle_decompress(entry.rle_data, entry.raw_len)


def chunk_id_to_coords(chunk_id: int) -> Tuple[int, int]:
    """Convert u64 chunk_id back to (cx, cy) coordinate pair."""
    cx = (chunk_id >> 32) & 0xFFFFFFFF
    cy = chunk_id & 0xFFFFFFFF
    # Sign-extend from i32
    if cx >= 0x80000000:
        cx -= 0x100000000
    if cy >= 0x80000000:
        cy -= 0x100000000
    return (cx, cy)


def bytes_to_pixels(data: bytes) -> List[int]:
    """Convert raw bytes to list of u32 pixel values."""
    pixels = []
    for i in range(0, len(data), 4):
        if i + 4 <= len(data):
            pixels.append(struct.unpack_from('<I', data, i)[0])
    return pixels


# ─── Pattern Detection ───────────────────────────────────────────────

@dataclass
class TilePattern:
    """A repeating tile pattern found across chunks."""
    hash: str
    size: int  # tile edge length (e.g. 8 for 8x8)
    pixel_data: bytes  # raw pixel data of the tile
    frequency: int  # how many times it appears
    locations: List[Tuple[int, int, int, int]]  # (chunk_cx, chunk_cy, local_x, local_y)
    compression_gain: float  # estimated ratio


@dataclass
class RLEPattern:
    """A common run-length pattern found in chunk data."""
    value: int  # the repeated pixel value
    avg_run_length: float
    total_runs: int
    total_pixels: int  # total pixels in runs of this value


@dataclass
class AnalysisResult:
    """Complete analysis of an EPL journal."""
    journal_path: str
    dirty_chunks: int
    total_entries: int
    sequence: int
    journal_size_bytes: int
    raw_data_bytes: int  # uncompressed size of all deltas
    compressed_bytes: int  # compressed size
    compression_ratio: float
    tile_patterns: List[TilePattern]
    rle_patterns: List[RLEPattern]
    unique_colors: int
    color_histogram: Counter
    spatial_extent: Tuple[int, int, int, int]  # (min_cx, min_cy, max_cx, max_cy)


def analyze_tile_repetition(
    entries: Dict[int, EplEntry],
    tile_size: int = 8,
    min_freq: int = 3,
) -> List[TilePattern]:
    """
    Hash sub-tiles within chunks and find ones that repeat across the journal.

    This detects structures like brick walls, floors, windows -- any repeating
    NxN block that appears in multiple locations.
    """
    tile_hashes: Dict[str, List[Tuple[int, int, int, int]]] = defaultdict(list)
    tile_data: Dict[str, bytes] = {}

    for chunk_id, entry in entries.items():
        cx, cy = chunk_id_to_coords(chunk_id)
        raw = decompress_entry(entry)
        pixels = bytes_to_pixels(raw)

        if len(pixels) != CHUNK_PIXELS:
            continue

        # Scan sub-tiles
        for ty in range(0, 64, tile_size):
            for tx in range(0, 64, tile_size):
                # Extract tile pixels
                tile_pixels = []
                for row in range(tile_size):
                    for col in range(tile_size):
                        idx = (ty + row) * 64 + (tx + col)
                        tile_pixels.append(pixels[idx])

                tile_bytes = struct.pack(f'<{len(tile_pixels)}I', *tile_pixels)
                h = hashlib.sha256(tile_bytes).hexdigest()

                tile_hashes[h].append((cx, cy, tx, ty))
                if h not in tile_data:
                    tile_data[h] = tile_bytes

    # Filter by frequency and compute compression gain
    patterns = []
    for h, locs in tile_hashes.items():
        if len(locs) < min_freq:
            continue

        tile_bytes = tile_data[h]
        tile_pixel_count = tile_size * tile_size

        # Compression gain: how many bytes does this save?
        # Without the pattern: locs * tile_bytes_size
        # With the pattern: tile_bytes_size + locs * (4+4+4) (tile_id + pos coords)
        raw_cost = len(locs) * len(tile_bytes)
        encoded_cost = len(tile_bytes) + len(locs) * 12  # id + x,y offsets
        gain = raw_cost / max(encoded_cost, 1)

        patterns.append(TilePattern(
            hash=h[:16],
            size=tile_size,
            pixel_data=tile_bytes,
            frequency=len(locs),
            locations=locs[:20],  # cap for display
            compression_gain=gain,
        ))

    # Sort by frequency * gain (best candidates first)
    patterns.sort(key=lambda p: p.frequency * p.compression_gain, reverse=True)
    return patterns


def analyze_rle_patterns(entries: Dict[int, EplEntry]) -> List[RLEPattern]:
    """
    Analyze run-length distributions across all chunk data.

    Identifies pixel values that form long runs -- candidates for
    PixelPack Strategy 0x01 (RLE encoding).
    """
    run_data: Dict[int, List[int]] = defaultdict(list)  # pixel_value -> [run_lengths]
    total_pixels = 0

    for chunk_id, entry in entries.items():
        raw = decompress_entry(entry)
        pixels = bytes_to_pixels(raw)

        if not pixels:
            continue

        total_pixels += len(pixels)

        # Find runs
        current_val = pixels[0]
        current_run = 1

        for i in range(1, len(pixels)):
            if pixels[i] == current_val:
                current_run += 1
            else:
                run_data[current_val].append(current_run)
                current_val = pixels[i]
                current_run = 1
        run_data[current_val].append(current_run)

    # Build RLE pattern stats
    patterns = []
    for value, runs in run_data.items():
        total_run_pixels = sum(runs)
        if total_run_pixels < 10:  # skip trivial
            continue
        patterns.append(RLEPattern(
            value=value,
            avg_run_length=sum(runs) / len(runs),
            total_runs=len(runs),
            total_pixels=total_run_pixels,
        ))

    patterns.sort(key=lambda p: p.total_pixels, reverse=True)
    return patterns


def analyze_color_distribution(entries: Dict[int, EplEntry]) -> Tuple[int, Counter]:
    """Analyze color usage across all chunk data."""
    color_hist = Counter()

    for chunk_id, entry in entries.items():
        raw = decompress_entry(entry)
        pixels = bytes_to_pixels(raw)
        color_hist.update(pixels)

    return len(color_hist), color_hist


def analyze(epl_path: str, min_freq: int = 3, tile_size: int = 8) -> AnalysisResult:
    """Run full analysis on an EPL journal."""
    journal = read_epl(epl_path)
    file_size = os.path.getsize(epl_path)

    raw_bytes = sum(e.raw_len for e in journal.entries.values())
    compressed_bytes = sum(len(e.rle_data) for e in journal.entries.values())
    compression_ratio = raw_bytes / max(compressed_bytes, 1)

    # Spatial extent
    coords = [chunk_id_to_coords(cid) for cid in journal.entries]
    if coords:
        min_cx = min(c[0] for c in coords)
        min_cy = min(c[1] for c in coords)
        max_cx = max(c[0] for c in coords)
        max_cy = max(c[1] for c in coords)
    else:
        min_cx = min_cy = max_cx = max_cy = 0

    tile_patterns = analyze_tile_repetition(journal.entries, tile_size, min_freq)
    rle_patterns = analyze_rle_patterns(journal.entries)
    unique_colors, color_hist = analyze_color_distribution(journal.entries)

    return AnalysisResult(
        journal_path=epl_path,
        dirty_chunks=len(journal.entries),
        total_entries=journal.total_entries,
        sequence=journal.sequence,
        journal_size_bytes=file_size,
        raw_data_bytes=raw_bytes,
        compressed_bytes=compressed_bytes,
        compression_ratio=compression_ratio,
        tile_patterns=tile_patterns,
        rle_patterns=rle_patterns,
        unique_colors=unique_colors,
        color_histogram=color_hist,
        spatial_extent=(min_cx, min_cy, max_cx, max_cy),
    )


# ─── Output Formatting ──────────────────────────────────────────────

def fmt_bytes(n: int) -> str:
    if n < 1024:
        return f"{n} B"
    elif n < 1024 * 1024:
        return f"{n / 1024:.1f} KB"
    else:
        return f"{n / (1024 * 1024):.2f} MB"


def fmt_color(color: int) -> str:
    r = (color >> 16) & 0xFF
    g = (color >> 8) & 0xFF
    b = color & 0xFF
    return f"#{r:02X}{g:02X}{b:02X}"


def print_summary(result: AnalysisResult):
    """Print a human-readable analysis summary."""
    r = result
    min_cx, min_cy, max_cx, max_cy = r.spatial_extent

    print("=" * 70)
    print("  EPL PATTERN ANALYZER -- Epigenome Mining Report")
    print("=" * 70)
    print()
    print(f"  Journal:       {r.journal_path}")
    print(f"  File Size:     {fmt_bytes(r.journal_size_bytes)}")
    print(f"  Dirty Chunks:  {r.dirty_chunks}")
    print(f"  Superseded:    {r.total_entries - r.dirty_chunks} (compacted away)")
    print(f"  Sequence:      {r.sequence}")
    print()
    print(f"  Raw Data:      {fmt_bytes(r.raw_data_bytes)}")
    print(f"  Compressed:    {fmt_bytes(r.compressed_bytes)}")
    print(f"  RLE Ratio:     {r.compression_ratio:.2f}x")
    print()
    print(f"  Spatial Extent: ({min_cx},{min_cy}) to ({max_cx},{max_cy})")
    span_x = max_cx - min_cx + 1
    span_y = max_cy - min_cy + 1
    print(f"  Span:          {span_x}x{span_y} chunks ({span_x * 64}x{span_y * 64} pixels)")
    print()
    print(f"  Unique Colors: {r.unique_colors}")
    print()

    # Top colors
    print("-" * 70)
    print("  TOP COLORS (by pixel count)")
    print("-" * 70)
    for color, count in r.color_histogram.most_common(15):
        pct = count / max(CHUNK_PIXELS * r.dirty_chunks, 1) * 100
        print(f"    {fmt_color(color)}  {count:>8} px  ({pct:5.1f}%)")
    print()

    # RLE patterns
    if r.rle_patterns:
        print("-" * 70)
        print("  RLE RUN PATTERNS (top values by coverage)")
        print("-" * 70)
        total_pixels = CHUNK_PIXELS * r.dirty_chunks
        for p in r.rle_patterns[:10]:
            pct = p.total_pixels / max(total_pixels, 1) * 100
            print(f"    {fmt_color(p.value)}  avg run: {p.avg_run_length:>6.1f}  "
                  f"runs: {p.total_runs:>5}  coverage: {pct:5.1f}%")
        print()

    # Tile repetition
    if r.tile_patterns:
        print("-" * 70)
        print(f"  TILE REPETITION ({len(r.tile_patterns)} patterns, tile_size={r.tile_patterns[0].size})")
        print("-" * 70)
        for p in r.tile_patterns[:15]:
            print(f"    [{p.hash}]  freq: {p.frequency:>5}x  gain: {p.compression_gain:.1f}x  "
                  f"savings: {fmt_bytes(int(len(p.pixel_data) * p.frequency * (1 - 1/p.compression_gain)))}")
        print()

        # Promotion candidates
        candidates = [p for p in r.tile_patterns if p.frequency >= 5 and p.compression_gain >= 3.0]
        if candidates:
            print("=" * 70)
            print("  PROMOTION CANDIDATES (freq >= 5, gain >= 3.0x)")
            print("=" * 70)
            total_savings = 0
            for p in candidates:
                savings = int(len(p.pixel_data) * p.frequency * (1 - 1/p.compression_gain))
                total_savings += savings
                print(f"    [{p.hash}]  {p.size}x{p.size} tile  "
                      f"freq={p.frequency}  gain={p.compression_gain:.1f}x  "
                      f"save={fmt_bytes(savings)}")
                # Show first location
                if p.locations:
                    loc = p.locations[0]
                    print(f"              first seen: chunk ({loc[0]},{loc[1]}) local ({loc[2]},{loc[3]})")
            print()
            print(f"  Total potential savings: {fmt_bytes(total_savings)}")
            print()

            # Coverage percentage
            total_dirty_data = r.raw_data_bytes
            if total_dirty_data > 0:
                coverage = total_savings / total_dirty_data * 100
                print(f"  Epigenome reduction: {coverage:.1f}%")
    else:
        print("-" * 70)
        print("  No repeating tile patterns detected.")
        print("  (Journal may be too small or mutations too sparse)")
        print()


def print_dump(journal: EplJournal, target_chunk_id: Optional[int] = None):
    """Dump journal entry details."""
    print(f"Journal: {journal.path}")
    print(f"Version: {journal.version}, Sequence: {journal.sequence}")
    print(f"Active entries: {len(journal.entries)}, Total written: {journal.total_entries}")
    print()

    entries = journal.entries
    if target_chunk_id is not None:
        if target_chunk_id in entries:
            entries = {target_chunk_id: entries[target_chunk_id]}
        else:
            print(f"Chunk ID {target_chunk_id:#x} not found in journal.")
            return

    for cid, entry in sorted(entries.items()):
        cx, cy = chunk_id_to_coords(cid)
        raw = decompress_entry(entry)
        pixels = bytes_to_pixels(raw)

        print(f"  Chunk ({cx:>4},{cy:>4})  ID={cid:#018x}  "
              f"raw={fmt_bytes(entry.raw_len)}  "
              f"rle={fmt_bytes(len(entry.rle_data))}  "
              f"ratio={entry.raw_len / max(len(entry.rle_data), 1):.2f}x")

        # Color distribution for this chunk
        unique = len(set(pixels))
        print(f"    unique colors: {unique}/{CHUNK_PIXELS}")


# ─── CLI ─────────────────────────────────────────────────────────────

def main():
    if len(sys.argv) < 3:
        print("Usage:")
        print("  epl_analyzer.py analyze <path.epl> [--min-freq 3] [--tile-size 8]")
        print("  epl_analyzer.py summary <path.epl>")
        print("  epl_analyzer.py dump <path.epl> [--chunk-id 0x50000000A]")
        sys.exit(1)

    cmd = sys.argv[1]
    path = sys.argv[2]

    if not os.path.exists(path):
        print(f"Error: {path} not found")
        sys.exit(1)

    # Parse flags
    args = sys.argv[3:]
    min_freq = 3
    tile_size = 8
    chunk_id = None

    i = 0
    while i < len(args):
        if args[i] == '--min-freq' and i + 1 < len(args):
            min_freq = int(args[i + 1])
            i += 2
        elif args[i] == '--tile-size' and i + 1 < len(args):
            tile_size = int(args[i + 1])
            i += 2
        elif args[i] == '--chunk-id' and i + 1 < len(args):
            chunk_id = int(args[i + 1], 16)
            i += 2
        else:
            i += 1

    if cmd == 'analyze':
        result = analyze(path, min_freq=min_freq, tile_size=tile_size)
        print_summary(result)

    elif cmd == 'summary':
        journal = read_epl(path)
        print(f"EPL Journal: {path}")
        print(f"  Version: {journal.version}")
        print(f"  Sequence: {journal.sequence}")
        print(f"  Dirty chunks: {len(journal.entries)}")
        print(f"  Total entries written: {journal.total_entries}")
        print(f"  File size: {fmt_bytes(os.path.getsize(path))}")
        raw = sum(e.raw_len for e in journal.entries.values())
        comp = sum(len(e.rle_data) for e in journal.entries.values())
        print(f"  Raw data: {fmt_bytes(raw)}")
        print(f"  Compressed: {fmt_bytes(comp)}")
        if comp > 0:
            print(f"  Compression: {raw/comp:.2f}x")
        if journal.entries:
            coords = [chunk_id_to_coords(cid) for cid in journal.entries]
            min_cx = min(c[0] for c in coords)
            min_cy = min(c[1] for c in coords)
            max_cx = max(c[0] for c in coords)
            max_cy = max(c[1] for c in coords)
            print(f"  Spatial extent: ({min_cx},{min_cy}) to ({max_cx},{max_cy})")

    elif cmd == 'dump':
        journal = read_epl(path)
        print_dump(journal, chunk_id)

    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)


if __name__ == '__main__':
    main()
