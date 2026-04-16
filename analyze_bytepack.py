"""Analyze BYTEPACK seed patterns to understand consolidation opportunities."""
import time
from boot3 import encode_v3
from expand3 import ExpandContext, expand_with_context

with open('expand.py', 'rb') as f:
    target = f.read()

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
    
    # Count BYTEPACK adjacency
    bytepack_runs = []
    short_runs = []  # runs of ANY non-LZ77 seeds covering <=5 bytes each
    current_run = []
    current_short_run = []
    
    for i, (sp, ep, s, st) in enumerate(seed_map):
        seg_len = ep - sp
        if st == 0xE:  # BYTEPACK
            current_run.append(i)
        else:
            if len(current_run) >= 2:
                bytepack_runs.append(list(current_run))
            current_run = []
        
        if st != 0xC and seg_len <= 5:
            current_short_run.append(i)
        else:
            if len(current_short_run) >= 2:
                short_runs.append(list(current_short_run))
            current_short_run = []
    
    if len(current_run) >= 2:
        bytepack_runs.append(list(current_run))
    if len(current_short_run) >= 2:
        short_runs.append(list(current_short_run))
    
    print(f'Total seeds: {len(seeds)}')
    print(f'BYTEPACK runs of 2+: {len(bytepack_runs)}')
    total_in_bp_runs = sum(len(r) for r in bytepack_runs)
    print(f'BYTEPACK seeds in runs: {total_in_bp_runs}')
    
    print(f'Short-seed runs of 2+: {len(short_runs)}')
    total_in_short = sum(len(r) for r in short_runs)
    print(f'Seeds in short runs: {total_in_short}')
    
    # For each short run, check if combined content appears before it
    mergable_count = 0
    mergable_saves = 0
    for run in short_runs:
        sp = seed_map[run[0]][0]
        ep = seed_map[run[-1]][1]
        combined = target[sp:ep]
        search_buf = target[:sp]
        if len(combined) <= 0xFFF and search_buf.rfind(combined) >= 0:
            mergable_count += 1
            mergable_saves += len(run) - 1
    print(f'Short runs mergable: {mergable_count} (saves {mergable_saves})')
    
    # Count isolated BYTEPACK seeds
    bp_indices = [i for i, (_, _, _, st) in enumerate(seed_map) if st == 0xE]
    isolated = sum(1 for i in bp_indices 
                   if (i == 0 or seed_map[i-1][3] != 0xE) and 
                      (i == len(seed_map)-1 or seed_map[i+1][3] != 0xE))
    print(f'Isolated BYTEPACK: {isolated}')
    
    # BYTEPACK length distribution
    bp_lens = {}
    for i in bp_indices:
        l = seed_map[i][1] - seed_map[i][0]
        bp_lens[l] = bp_lens.get(l, 0) + 1
    print(f'BYTEPACK length dist: {sorted(bp_lens.items())}')
    
    # All-seed length distribution by strategy
    from collections import defaultdict
    strat_lens = defaultdict(list)
    names = {0:'DICT_1',1:'DICT_2',2:'DICT_3',3:'DICT_4',4:'DICT_5',
             5:'DICT_6',6:'DICT_7',7:'NIBBLE',8:'DICTX5',9:'BPE',
             0xA:'DICTX7',0xB:'RLE',0xC:'LZ77',0xD:'DYN_DICT',
             0xE:'BYTEPACK',0xF:'TEMPLATE'}
    for sp, ep, s, st in seed_map:
        strat_lens[st].append(ep - sp)
    
    print('\nBytes per seed by strategy:')
    for st in sorted(strat_lens.keys()):
        lens = strat_lens[st]
        avg = sum(lens) / len(lens)
        print(f'  {names.get(st, f"?{st:X}"):12s}: avg={avg:.1f} min={min(lens)} max={max(lens)} count={len(lens)}')
    
    # Show top 10 longest BYTEPACK runs
    bytepack_runs.sort(key=lambda r: len(r), reverse=True)
    print(f'\nTop 10 BYTEPACK runs:')
    for run in bytepack_runs[:10]:
        sp = seed_map[run[0]][0]
        ep = seed_map[run[-1]][1]
        combined = target[sp:ep]
        found = target[:sp].rfind(combined)
        print(f'  Run of {len(run)} seeds ({ep-sp}B) @ {sp}: {combined[:50]!r}')
        print(f'    Found earlier: {found >= 0}')
    
    # Check: for ALL positions with BYTEPACK, can they be LZ77 from buffer?
    # (not just runs - individual seeds too)
    bp_as_lz77 = 0
    for i in bp_indices:
        sp, ep, s, st = seed_map[i]
        data = target[sp:ep]
        search_buf = target[:sp]
        if len(data) >= 2 and search_buf.rfind(data) >= 0:
            bp_as_lz77 += 1
    print(f'\nIndividual BYTEPACK convertible to LZ77: {bp_as_lz77}/{len(bp_indices)}')
    
    # What about mixed runs (BYTEPACK next to other short seeds)?
    mixed_runs = []
    current_mixed = []
    for i, (sp, ep, s, st) in enumerate(seed_map):
        seg_len = ep - sp
        if st != 0xC and seg_len <= 5:
            current_mixed.append(i)
        else:
            if len(current_mixed) >= 2:
                mixed_runs.append(list(current_mixed))
            current_mixed = []
    if len(current_mixed) >= 2:
        mixed_runs.append(list(current_mixed))
    
    mixed_mergable = 0
    mixed_saves = 0
    for run in mixed_runs:
        sp = seed_map[run[0]][0]
        ep = seed_map[run[-1]][1]
        combined = target[sp:ep]
        search_buf = target[:sp]
        if len(combined) <= 0xFFF and len(combined) >= 2:
            if search_buf.rfind(combined) >= 0:
                mixed_mergable += 1
                mixed_saves += len(run) - 1
    print(f'Mixed runs (any short non-LZ77): {len(mixed_runs)}')
    print(f'Mixed mergable: {mixed_mergable} (saves {mixed_saves})')
    
    # What if we look at ALL substrings, not just runs?
    # For every position in target, find longest match in earlier target
    total_lz77_potential = 0
    lz77_misses = 0
    for i, (sp, ep, s, st) in enumerate(seed_map):
        if st == 0xC:  # already LZ77
            continue
        seg_len = ep - sp
        if seg_len < 2:
            continue
        data = target[sp:ep]
        # Try to find this data earlier
        if sp >= seg_len:
            found = target[:sp].rfind(data)
            if found >= 0:
                total_lz77_potential += 1
            else:
                lz77_misses += 1
        else:
            lz77_misses += 1
    print(f'\nNon-LZ77 seeds convertible to LZ77 (individual): {total_lz77_potential}')
    print(f'Non-LZ77 seeds NOT convertible: {lz77_misses}')
