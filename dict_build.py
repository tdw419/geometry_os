"""
Pixelpack Dictionary Builder v2

Builds an auto-growing dictionary from a corpus of target programs.
Uses BPE (byte-pair encoding) with greedy frequency scoring.

BACKWARD COMPATIBILITY: V2 entries 0-31 are identical to V1 (DICTIONARY_EXT).
New entries 32+ are auto-discovered from corpus.

The dictionary is versioned and deterministic:
  - Same corpus = same dictionary, always
  - No randomness, sorted candidates
"""

from collections import Counter
from corpus import CORPUS


def build_dictionary(corpus=None, target_size=96):
    """
    Build a dictionary from corpus using greedy BPE.
    
    Strategy:
    1. Start with existing V1 dictionary (32 entries)
    2. Scan corpus for high-value n-grams (2-6 bytes)
    3. Score by: how many total bytes this pattern saves across the corpus
    4. Greedily add best non-overlapping candidates
    5. Deterministic: sort by score desc, length desc, bytes asc
    
    Returns a list of bytes entries.
    """
    if corpus is None:
        corpus = CORPUS
    
    # Import V1 - these entries are frozen at indices 0-31
    from expand import DICTIONARY_EXT
    base_dict = list(DICTIONARY_EXT)  # 32 entries
    
    # Count n-gram occurrences across all corpus documents
    ngram_total = Counter()
    for data in corpus:
        for n in range(2, 7):  # 2-6 byte n-grams
            for i in range(len(data) - n + 1):
                ngram_total[data[i:i+n]] += 1
    
    # Filter: must appear enough, not already in dict
    dict_set = set(base_dict)
    
    candidates = []
    for gram, total_count in ngram_total.items():
        glen = len(gram)
        if total_count < 3:
            continue
        if gram in dict_set:
            continue
        # Skip grams containing non-printable/non-ASCII (keep it clean)
        if any(b < 0x20 and b != 0x0A for b in gram):
            continue
        # Skip grams that are exact substrings of existing dict entries
        is_substring = False
        for entry in base_dict:
            if gram in entry and gram != entry:
                is_substring = True
                break
        if is_substring:
            continue
        
        # Score: total bytes saved = count * (len - index_cost)
        # index_cost = 6 bits (for 64-entry dict) ~= 0.75 bytes
        savings = total_count * (glen - 1)
        if savings < 5:
            continue
        candidates.append((gram, savings, total_count))
    
    # Sort deterministically: savings desc, length desc, bytes asc
    candidates.sort(key=lambda x: (-x[1], -len(x[0]), x[0]))
    
    # Greedy selection: avoid selecting overlapping grams
    selected = []
    selected_set = set()
    
    for gram, savings, count in candidates:
        # Skip if too similar to already-selected entries
        skip = False
        for existing in selected:
            # Skip if this gram is mostly contained in an existing entry
            overlap = 0
            shorter = gram if len(gram) <= len(existing) else existing
            longer = existing if len(gram) <= len(existing) else gram
            for i in range(len(longer) - len(shorter) + 1):
                if longer[i:i+len(shorter)] == shorter:
                    overlap = len(shorter)
                    break
            if overlap >= len(shorter) * 0.7:
                skip = True
                break
        if skip:
            continue
        
        selected.append(gram)
        if len(base_dict) + len(selected) >= target_size:
            break
    
    return base_dict + selected


def get_dictionary_v2():
    """Get the V2 dictionary."""
    return build_dictionary(CORPUS)


if __name__ == '__main__':
    from expand import DICTIONARY, DICTIONARY_EXT
    
    print("Building V2 dictionary from corpus...")
    print(f"Corpus: {len(CORPUS)} documents")
    print()
    
    v2 = get_dictionary_v2()
    
    print(f"V1: {len(DICTIONARY)} base + {len(DICTIONARY_EXT)-len(DICTIONARY)} ext = {len(DICTIONARY_EXT)} entries")
    print(f"V2: {len(v2)} entries ({len(v2)-32} new)")
    
    # Verify V1 compatibility
    ok = v2[:32] == list(DICTIONARY_EXT[:32])
    print(f"\nBackward compat: {'OK' if ok else 'BROKEN!'}")
    
    print("\nNew V2 entries (32+):")
    for i in range(32, len(v2)):
        try:
            txt = v2[i].decode('ascii')
            print(f"  {i:3d}: {txt!r:20s}  ({len(v2[i])} bytes)")
        except:
            print(f"  {i:3d}: {v2[i].hex():20s}  ({len(v2[i])} bytes)")
    
    # Show max output possible with 6-bit indices into V2 dict
    max_out = sum(len(e) for e in v2[:64]) // 64 * 7  # 7 entries avg
    print(f"\nTheoretical max single-pixel output (7 x avg_entry): ~{max_out} bytes")
    print(f"Actual max with DICT_7: {sum(len(v2[i]) for i in range(min(16, len(v2))))} bytes (base dict)")
