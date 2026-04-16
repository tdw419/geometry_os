#!/usr/bin/env python3
"""Run possibilities exploration for pixelpack phase 6 breakthrough.
Uses Ollama directly since ZAI is unresponsive.
"""

import sys
import os
import json
import time

sys.path.insert(0, os.path.expanduser("~/zion/projects/ai_possibilities/ai_possibilities"))

from possibilities.models import PossibilityNode
from possibilities.scorer import compute_fertility, rank_paths
import litellm

# Direct litellm call to Ollama
def ask_ollama(prompt, model="ollama/qwen2.5-coder:14b"):
    resp = litellm.completion(
        model=model,
        messages=[{"role": "user", "content": prompt}],
        api_base="http://localhost:11434",
        max_tokens=2000,
        temperature=0.9,
    )
    return resp.choices[0].message.content


def parse_json(text):
    """Extract JSON array from response."""
    import re
    text = text.strip()
    if "```" in text:
        blocks = re.findall(r'```(?:json)?\s*\n(.*?)```', text, re.DOTALL)
        for block in blocks:
            try:
                r = json.loads(block.strip())
                if isinstance(r, list):
                    return r
                return [r]
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


ctx = (
    "Pixelpack: a system where 32-bit RGBA pixels encode generative recipes. "
    "Each pixel expands into bytes via BPE (byte-pair encoding) + 16 expansion strategies. "
    "Phase 6 adds boot pixels (4 opcodes): BOOT_END, SET_PROFILE, SET_BPE_TABLE, SET_TRANSFORM. "
    "Test benchmark: fibonacci(500) Python source = 34 seeds (pixels). "
    "The BPE dictionary is already optimized for Python -- custom tables don't help further. "
    "Need strategies that go beyond BPE optimization."
)

seed_q = (
    "What 5 concrete encoding techniques would cut pixelpack from 34 seeds to under 25? "
    "Each seed is 32 bits that expands to ~15 bytes via BPE+strategy. "
    "BPE is maxed out for Python. Think about: "
    "1) Cross-seed backreferences where seed N can reference decoded bytes from seed N-1. "
    "2) Per-region BPE tables within one image. "
    "3) Seed merging where adjacent seeds share boundary byte pairs. "
    "4) Variable-length seed encoding (2 pixels = 64 bits for complex regions). "
    "5) Delta encoding between adjacent expanded seeds. "
    "Or something I haven't thought of. Give specific, implementable ideas."
)

prompt0 = (
    "You are an expert in data compression and encoding systems.\n\n"
    "Context:\n" + ctx + "\n\n"
    "Question:\n" + seed_q + "\n\n"
    "Return ONLY a JSON array of 5 ideas. Each idea:\n"
    '{"title": "short name", "description": "1-2 sentences", '
    '"enables": ["thing1", "thing2"], "risk": "what could go wrong", '
    '"category": "obvious|contrarian|wildcard|foundational"}\n'
    "At least 1 contrarian and 1 wildcard. Be SPECIFIC about algorithms and data layouts."
)

print("Calling Ollama qwen2.5-coder:14b...")
print(f"Prompt: {len(prompt0)} chars")

raw0 = ask_ollama(prompt0)
print(f"Response: {len(raw0)} chars\n")

branches0 = parse_json(raw0)
print(f"Parsed {len(branches0)} branches\n")

if not branches0:
    print("Full response:")
    print(raw0)
    print("\nFailed to parse JSON. Trying again with simpler prompt...")
    prompt_simple = (
        "List 5 specific encoding techniques to compress Python source code beyond BPE. "
        "Return JSON array with title, description, enables, risk, category fields."
    )
    raw0 = ask_ollama(prompt_simple)
    branches0 = parse_json(raw0)
    print(f"Retry: {len(branches0)} branches")
    if not branches0:
        print(raw0)
        sys.exit(1)

# Build tree
root = PossibilityNode(
    title="Phase 6: cut 34->25 seeds",
    description=seed_q,
    depth=0,
)

for b in branches0:
    child = PossibilityNode(
        title=b.get("title", "untitled"),
        description=b.get("description", ""),
        enables=b.get("enables", []),
        risk=b.get("risk", ""),
        category=b.get("category", "obvious"),
        depth=1,
        parent_id=root.id,
        model_used="ollama/qwen2.5-coder:14b",
    )
    root.children.append(child)
    print(f"  [{child.category.upper()}] {child.title}")
    print(f"    {child.description[:150]}")
    print(f"    Enables: {', '.join(child.enables[:3])}")
    print(f"    Risk: {child.risk[:100]}")
    print()

# Depth 1 -- expand each branch
for i, branch in enumerate(root.children):
    print(f"Expanding [{branch.category}] {branch.title}...")
    sub_prompt = (
        "For the encoding technique '" + branch.title + "': " + branch.description + "\n"
        "Context: " + ctx + "\n"
        "Give 3 specific implementation steps or sub-ideas. "
        "Return JSON array with title, description, enables, risk, category."
    )
    raw1 = ask_ollama(sub_prompt)
    branches1 = parse_json(raw1)
    print(f"  {len(branches1)} sub-branches")
    for b in branches1:
        child2 = PossibilityNode(
            title=b.get("title", "untitled"),
            description=b.get("description", ""),
            enables=b.get("enables", []),
            risk=b.get("risk", ""),
            category=b.get("category", "obvious"),
            depth=2,
            parent_id=branch.id,
            model_used="ollama/qwen2.5-coder:14b",
        )
        branch.children.append(child2)
        print(f"    {child2.title}")
    time.sleep(0.5)

# Score
compute_fertility(root)
paths = rank_paths(root, top_n=10)

print("\n" + "=" * 60)
print("RANKED PATHS (most to least fertile)")
print("=" * 60)
for i, path in enumerate(paths[:10]):
    titles = " -> ".join(n.title for n in path)
    score = sum(n.fertility_score for n in path)
    print(f"  #{i+1} [score: {score:.2f}] {titles}")

# Save
tree_data = root.to_dict()
out_path = os.path.expanduser("~/zion/projects/pixelpack/trees/phase6_breakthrough.json")
with open(out_path, "w") as f:
    json.dump(tree_data, f, indent=2)
print(f"\nSaved to {out_path}")
print(f"Total: {root.total_descendants + 1} nodes")
