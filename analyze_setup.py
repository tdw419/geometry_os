"""Test if setup seeds actually help and diagnose why they're not used."""
import time
from boot3 import encode_v3, _encode_with_context, _find_setup_candidates, make_v3_png
from expand3 import expand_from_png_v3

with open('expand.py', 'rb') as f:
    target = f.read()

print(f"Target: {len(target)} bytes")
print()

# Find setup candidates with MORE generous parameters
print("=== Setup candidates (default params) ===")
patterns = _find_setup_candidates(target, max_setup_seeds=12)
total_setup = sum(len(vs) for _, vs, _, _ in patterns)
print(f"Total setup seeds: {total_setup}")
print()

# Now try encoding WITH setup
print("=== Encoding with setup ===")
all_setup_seeds = []
setup_buffer = bytearray()
setup_ranges = {}

for pattern, v1_seeds, count, savings in patterns:
    all_setup_seeds.extend(v1_seeds)
    setup_buffer.extend(pattern)
    print(f"  Setup: {pattern!r} ({len(pattern)}B x{count}, saves ~{savings}px, {len(v1_seeds)} setup seeds)")
    pos = 0
    while True:
        idx = target.find(pattern, pos)
        if idx == -1:
            break
        setup_ranges[(idx, idx + len(pattern))] = True
        pos = idx + 1

print(f"Setup buffer: {len(setup_buffer)} bytes, {len(all_setup_seeds)} seeds")

# Encode with setup
t = time.time()
data_seeds_b = _encode_with_context(target, setup_buffer, setup_ranges,
                                     30.0, t)
elapsed = time.time() - t

if data_seeds_b:
    total_b = len(all_setup_seeds) + len(data_seeds_b)
    print(f"With-setup data seeds: {len(data_seeds_b)}")
    print(f"With-setup total: {total_b} ({len(all_setup_seeds)} setup + {len(data_seeds_b)} data)")
    print(f"Time: {elapsed:.1f}s")
    
    # Build PNG and verify
    png_b = make_v3_png(all_setup_seeds + data_seeds_b,
                        dict_only=len(all_setup_seeds))
    decoded_b = expand_from_png_v3(png_b)
    if decoded_b == target:
        print("Round-trip: PASS")
    else:
        print(f"Round-trip: FAIL (got {len(decoded_b)} bytes, expected {len(target)})")
        # Find divergence
        for i in range(min(len(decoded_b), len(target))):
            if decoded_b[i] != target[i]:
                print(f"  First divergence at byte {i}: got 0x{decoded_b[i]:02X}, expected 0x{target[i]:02X}")
                print(f"  Context: ...{target[max(0,i-10):i+10]!r}...")
                break
else:
    print("With-setup encoding FAILED")

# Compare with no-setup
print()
print("=== Encoding without setup ===")
t = time.time()
data_seeds_a = _encode_with_context(target, bytearray(), {},
                                     30.0, t)
elapsed = time.time() - t
if data_seeds_a:
    print(f"No-setup: {len(data_seeds_a)} seeds")
    print(f"Time: {elapsed:.1f}s")
