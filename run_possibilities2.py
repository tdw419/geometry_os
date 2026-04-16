#!/usr/bin/env python3
"""Run possibilities exploration with grounded context from simulations."""
import sys, os, json, time, re
import litellm

ctx = (
    "Pixelpack: encode files as PNG where 32-bit RGBA pixels (seeds) expand to bytes "
    "via BPE + generative strategies. Boot pixels configure decoder (4 opcodes: "
    "BOOT_END, SET_PROFILE, SET_BPE_TABLE, SET_TRANSFORM). "
    "Current encoder uses DP optimal parsing across strategies: BPE (8B/seed, fixed "
    "128-pair table), DICTX5 (11B/seed, extended dictionary), BYTEPACK (3-5B/seed), "
    "LZ77 (backref into output buffer), NIBBLE (7 nibbles = 3.5B). "
    "SIMULATION FINDINGS: fibonacci.py 254B = 34 seeds (near-optimal). PRNG-based "
    "custom BPE tables are random garbage (43 seeds -- worse than default). LZ77 "
    "already saves 5 seeds but brute-force search is O(n^2). Encoder TIMES OUT on "
    "files over 1KB. The fixed BPE table has 76 of the pairs fibonacci needs but "
    "the 12 missing pairs each appear only 1-4 times. No mechanism to augment the "
    "table with file-specific pairs without replacing the entire 128-entry table."
)

seed_q = (
    "What 5 architectural changes would make pixelpack effective on real files (1-10KB "
    "Python source)? The encoder must finish in under 30 seconds. Current bottleneck: "
    "O(n^2) LZ77 search, fixed BPE table that cant be augmented, and DP that times out "
    "on large match graphs. "
    "Think about: hash-chain LZ77 (like zlib), two-pass encoding where pass 1 analyzes "
    "the file and pass 2 encodes with file-specific settings, BPE table augmentation "
    "that adds pairs without replacing the whole table, or hierarchical encoding where "
    "blocks of seeds reference a shared dictionary built from the file."
)

def ask_ollama(prompt):
    resp = litellm.completion(
        model="ollama/qwen2.5-coder:14b",
        messages=[{"role": "user", "content": prompt}],
        api_base="http://localhost:11434",
        max_tokens=3000,
        temperature=0.9,
    )
    return resp.choices[0].message.content

def parse_json(text):
    text = text.strip()
    if "```" in text:
        blocks = re.findall(r'```(?:json)?\s*\n(.*?)```', text, re.DOTALL)
        for block in blocks:
            try:
                r = json.loads(block.strip())
                return r if isinstance(r, list) else [r]
            except json.JSONDecodeError:
                continue
    bracket = text.find("[")
    if bracket != -1:
        try:
            return json.loads(text[bracket:])
        except json.JSONDecodeError:
            pass
    try:
        r = json.loads(text)
        return r if isinstance(r, list) else [r]
    except json.JSONDecodeError:
        return []

# Depth 0
prompt0 = (
    "You are an expert in data compression and encoding system design.\n\n"
    "Context:\n" + ctx + "\n\n"
    "Question:\n" + seed_q + "\n\n"
    'Return ONLY a JSON array of 5 ideas. Each idea:\n'
    '{"title": "short name", "description": "1-2 sentences with specific algorithms", '
    '"enables": ["thing1", "thing2"], "risk": "what could go wrong", '
    '"category": "obvious|contrarian|wildcard|foundational"}\n'
    "At least 1 contrarian and 1 wildcard. Be SPECIFIC."
)

print("Depth 0: broad exploration...")
raw0 = ask_ollama(prompt0)
branches0 = parse_json(raw0)
print(f"Got {len(branches0)} branches\n")

if not branches0:
    print("FAILED to parse. Raw response:")
    print(raw0[:2000])
    sys.exit(1)

for b in branches0:
    cat = b.get("category", "?")
    title = b.get("title", "?")
    desc = b.get("description", "")[:150]
    enables = b.get("enables", [])
    risk = b.get("risk", "")[:100]
    print(f"  [{cat.upper()}] {title}")
    print(f"    {desc}")
    print(f"    Enables: {', '.join(str(e) for e in enables[:3])}")
    print(f"    Risk: {risk}")
    print()

# Depth 1 -- expand each branch
all_tree = {"title": "Pixelpack architectural improvements", "children": []}
for b in branches0:
    node = {"title": b.get("title"), "category": b.get("category"), 
            "description": b.get("description"), "children": []}
    
    sub_q = b.get("title", "") + ": " + b.get("description", "")
    prompt1 = (
        "Context: " + ctx + "\n\n"
        "Go deeper on: " + sub_q + "\n\n"
        "Give 3 specific implementation steps or sub-ideas.\n"
        'Return JSON array: [{"title": "...", "description": "...", '
        '"enables": [...], "risk": "...", "category": "..."}]\n'
        "Name specific algorithms, data structures, or byte layouts."
    )
    
    print(f"Expanding [{b.get('category')}] {b.get('title')}...")
    raw1 = ask_ollama(prompt1)
    subs = parse_json(raw1)
    print(f"  {len(subs)} sub-branches")
    for s in subs:
        print(f"    {s.get('title', '?')}")
        node["children"].append(s)
    time.sleep(0.5)
    
    all_tree["children"].append(node)

# Save tree
out = os.path.expanduser("~/zion/projects/pixelpack/trees/phase6_architectural.json")
with open(out, "w") as f:
    json.dump(all_tree, f, indent=2)

# Print summary with fertility scoring
print("\n" + "=" * 60)
print("RANKED IDEAS (by sub-branch count = fertility proxy)")
print("=" * 60)
for node in sorted(all_tree["children"], key=lambda x: len(x["children"]), reverse=True):
    n_children = len(node["children"])
    print(f"  [{n_children} subs] {node['category'].upper()}: {node['title']}")
    for c in node["children"]:
        print(f"            {c.get('title', '?')}")

print(f"\nSaved to {out}")
