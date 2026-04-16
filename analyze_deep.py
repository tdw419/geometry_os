"""Deeper analysis of what improvements could help."""
from expand3 import ExpandContext, expand_with_context
from boot3 import encode_v3
import time

with open('expand.py', 'rb') as f:
    target = f.read()

# 1. Find longest repeated substrings in target
print("=== Repeated substring analysis ===")
# Use suffix array approach for efficiency
tlen = len(target)

# For each length L, count how many substrings of that length repeat
for L in [10, 20, 30, 50, 100, 200]:
    seen = {}
    repeats = 0
    total = 0
    for i in range(tlen - L + 1):
        sub = target[i:i+L]
        total += 1
        if sub in seen:
            repeats += 1
        else:
            seen[sub] = i
    print(f"  Length {L}: {repeats}/{total} positions have repeated substrings")

# 2. What's the longest repeated substring?
print("\n=== Longest repeated substrings ===")
# Binary search for longest repeated substring
for L in [500, 400, 300, 200, 150, 100, 80, 60, 40]:
    seen = {}
    found = False
    for i in range(tlen - L + 1):
        sub = target[i:i+L]
        if sub in seen:
            print(f"  Length {L}: '{sub[:60]}...' at positions {seen[sub]} and {i}")
            found = True
            break
        seen[sub] = i
    if not found:
        print(f"  Length {L}: NO repeats")

# 3. Analyze the "unique" content - what BYTEPACK covers
print("\n=== BYTEPACK residue analysis ===")
seeds, png = encode_v3(target, timeout=55.0)

if seeds:
    ctx = ExpandContext()
    seed_map = []
    pos = 0
    for s in seeds:
        result = expand_with_context(s, ctx)
        strat = (s >> 28) & 0xF
        seed_map.append((pos, pos + len(result), s, strat))
        pos += len(result)
    
    # Get BYTEPACK positions
    bp_positions = [(sp, ep) for sp, ep, s, st in seed_map if st == 0xE]
    
    # For each BYTEPACK position, check if its content appears as a SUBSTRING
    # anywhere else in the file (not just as a complete earlier match)
    partial_match_count = 0
    partial_match_saves = 0
    for sp, ep in bp_positions:
        data = target[sp:ep]
        # Check all occurrences of data[0] in target
        for start in range(tlen - len(data) + 1):
            if start == sp:
                continue
            if target[start:start+len(data)] == data:
                partial_match_count += 1
                break
    
    print(f"BYTEPACK segments with ANY match elsewhere: {partial_match_count}/{len(bp_positions)}")
    
    # 4. What about overlapping matches?
    # For each BYTEPACK seed, check if the content overlaps with any 
    # previously emitted content (even partial matches)
    print("\n=== Partial overlap analysis ===")
    bp_bytes_total = sum(ep - sp for sp, ep in bp_positions)
    overlap_bytes = 0
    for sp, ep in bp_positions:
        data = target[sp:ep]
        # Check if any substring of length >= 2 appears earlier
        for sublen in range(len(data), 1, -1):
            for offset in range(len(data) - sublen + 1):
                sub = data[offset:offset+sublen]
                if target[:sp].find(sub) >= 0:
                    overlap_bytes += sublen
                    break
            else:
                continue
            break
    
    print(f"BYTEPACK bytes with any 2+ byte overlap in earlier target: {overlap_bytes}/{bp_bytes_total}")
    
    # 5. What if we could use LZ77 for partial matches?
    # Count how many BYTEPACK bytes could be covered by LZ77 if we
    # allowed "partial" coverage (LZ77 covers the matching prefix, 
    # BYTEPACK covers the rest)
    partial_lz77_bytes = 0
    for sp, ep in bp_positions:
        data = target[sp:ep]
        # Find longest prefix of data that appears in target[:sp]
        best = 0
        for sublen in range(min(len(data), 0xFFF), 1, -1):
            sub = data[:sublen]
            if target[:sp].find(sub) >= 0:
                best = sublen
                break
        partial_lz77_bytes += best
    
    print(f"BYTEPACK bytes covered by longest-prefix LZ77: {partial_lz77_bytes}/{bp_bytes_total}")
    
    # 6. What's the total LZ77 potential?
    # For the ENTIRE file, find the longest LZ77 match at every position
    print("\n=== Optimal LZ77 potential ===")
    total_lz77 = 0
    lz77_at = [0] * tlen
    for pos in range(tlen):
        remaining = tlen - pos
        best_len = 0
        # Search for longest match in target[:pos]
        search_buf = target[:pos]
        for start in range(max(0, pos - 32768), pos):
            match_len = 0
            while match_len < remaining and match_len < 4095:
                if start + match_len < pos:
                    if target[start + match_len] == target[pos + match_len]:
                        match_len += 1
                    else:
                        break
                else:
                    # overlapping
                    wrap = start + match_len - pos
                    if wrap < match_len:
                        if target[pos + wrap] == target[pos + match_len]:
                            match_len += 1
                        else:
                            break
                    else:
                        break
            if match_len > best_len:
                best_len = match_len
        lz77_at[pos] = best_len
    
    # DP with optimal LZ77
    dp = [float('inf')] * (tlen + 1)
    dp[0] = 0
    for pos in range(tlen):
        if dp[pos] == float('inf'):
            continue
        # LZ77 match
        if lz77_at[pos] >= 2:
            for length in range(2, lz77_at[pos] + 1):
                if dp[pos] + 1 < dp[pos + length]:
                    dp[pos + length] = dp[pos] + 1
        # BYTEPACK (3 bytes per seed)
        for length in range(1, 6):
            if pos + length <= tlen and dp[pos] + 1 < dp[pos + length]:
                dp[pos + length] = dp[pos] + 1
    
    print(f"Optimal LZ77-only + BYTEPACK DP: {dp[tlen]} seeds")
    
    # Show coverage stats
    covered_by_lz77 = sum(1 for pos in range(tlen) if lz77_at[pos] >= 3)
    print(f"Positions with LZ77 match >= 3: {covered_by_lz77}/{tlen}")
    covered_by_lz77_long = sum(1 for pos in range(tlen) if lz77_at[pos] >= 10)
    print(f"Positions with LZ77 match >= 10: {covered_by_lz77_long}/{tlen}")
