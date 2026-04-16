#!/usr/bin/env python3
"""Simulation: what's the theoretical minimum seeds with aggressive LZ77?"""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib

print("Source:", repr(fib))
print(f"Total: {len(fib)} bytes")
print()

# Simulate: greedy LZ77-first, then BPE for literals
# Each seed = 28 bits of payload
# LZ77 seed: [16:offset][12:length] -> max offset 65535, max length 4096
# BPE seed: ~8 bytes output per seed (current average)

output_so_far = bytearray()
seeds_needed = 0
seed_log = []
pos = 0

while pos < len(fib):
    # Find longest match in output_so_far
    best_len = 0
    best_offset = 0
    max_match = min(4096, len(fib) - pos)  # LZ77 max length
    
    if len(output_so_far) > 0:
        for start in range(max(0, len(output_so_far) - 65535), len(output_so_far)):
            match_len = 0
            while match_len < max_match and pos + match_len < len(fib):
                if start + match_len < len(output_so_far):
                    if output_so_far[start + match_len] == fib[pos + match_len]:
                        match_len += 1
                    else:
                        break
                elif start + match_len == len(output_so_far) + match_len - (len(output_so_far) - start):
                    # Overlapping reference -- the byte at this position IS fib[pos + match_len]
                    # because we're copying from the overlap
                    break
                else:
                    break
            if match_len > best_len:
                best_len = match_len
                best_offset = len(output_so_far) - 1 - start
    
    if best_len >= 3:
        # Use LZ77 seed
        seeds_needed += 1
        seed_log.append(f"LZ77  offset={best_offset:3d} len={best_len:2d}  {repr(fib[pos:pos+min(best_len,40)])}")
        output_so_far.extend(fib[pos:pos+best_len])
        pos += best_len
    else:
        # Use BPE/literal seed -- encode up to 8 bytes
        chunk_size = min(8, len(fib) - pos)
        seeds_needed += 1
        seed_log.append(f"BPE   {chunk_size}B              {repr(fib[pos:pos+chunk_size])}")
        output_so_far.extend(fib[pos:pos+chunk_size])
        pos += chunk_size

print(f"Greedy LZ77-first simulation:")
print(f"Total seeds: {seeds_needed}")
print(f"LZ77 seeds: {sum(1 for s in seed_log if s.startswith('LZ77'))}")
print(f"BPE seeds:  {sum(1 for s in seed_log if s.startswith('BPE'))}")
print()
for i, log in enumerate(seed_log):
    print(f"  Seed {i:2d}: {log}")

# Now try: what about LZ77 with longer literal runs (up to 11 bytes)?
print("\n--- With extended BPE (up to 11 bytes) ---")
output_so_far = bytearray()
seeds_needed2 = 0
pos = 0

while pos < len(fib):
    best_len = 0
    best_offset = 0
    max_match = min(4096, len(fib) - pos)
    
    if len(output_so_far) > 0:
        for start in range(max(0, len(output_so_far) - 65535), len(output_so_far)):
            match_len = 0
            while match_len < max_match and pos + match_len < len(fib):
                if start + match_len < len(output_so_far):
                    if output_so_far[start + match_len] == fib[pos + match_len]:
                        match_len += 1
                    else:
                        break
                else:
                    break
            if match_len > best_len:
                best_len = match_len
                best_offset = len(output_so_far) - 1 - start
    
    if best_len >= 3:
        seeds_needed2 += 1
        output_so_far.extend(fib[pos:pos+best_len])
        pos += best_len
    else:
        # Extended BPE -- up to 11 bytes (DICTX5 max)
        chunk_size = min(11, len(fib) - pos)
        seeds_needed2 += 1
        output_so_far.extend(fib[pos:pos+chunk_size])
        pos += chunk_size

print(f"Total seeds: {seeds_needed2}")

# Even more aggressive: use LZ77 for any match >= 2 bytes
print("\n--- With min match length 2 ---")
output_so_far = bytearray()
seeds_needed3 = 0
pos = 0
lz77_count3 = 0

while pos < len(fib):
    best_len = 0
    best_offset = 0
    max_match = min(4096, len(fib) - pos)
    
    if len(output_so_far) > 0:
        for start in range(max(0, len(output_so_far) - 65535), len(output_so_far)):
            match_len = 0
            while match_len < max_match and pos + match_len < len(fib):
                if start + match_len < len(output_so_far):
                    if output_so_far[start + match_len] == fib[pos + match_len]:
                        match_len += 1
                    else:
                        break
                else:
                    break
            if match_len > best_len:
                best_len = match_len
                best_offset = len(output_so_far) - 1 - start
    
    if best_len >= 2:
        seeds_needed3 += 1
        lz77_count3 += 1
        output_so_far.extend(fib[pos:pos+best_len])
        pos += best_len
    else:
        chunk_size = min(11, len(fib) - pos)
        seeds_needed3 += 1
        output_so_far.extend(fib[pos:pos+chunk_size])
        pos += chunk_size

print(f"Total seeds: {seeds_needed3} (LZ77: {lz77_count3})")

print("\n" + "=" * 60)
print("COMPARISON")
print("=" * 60)
print(f"Current V3:        34 seeds")
print(f"LZ77-first (min3): {seeds_needed} seeds")
print(f"LZ77+extBPE:       {seeds_needed2} seeds")
print(f"LZ77 (min2):       {seeds_needed3} seeds")
