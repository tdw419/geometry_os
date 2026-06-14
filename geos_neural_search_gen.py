#!/usr/bin/env python3
"""
GeOS Neural Search Generator v5 (Hybrid RAG)
--------------------------------------------
1. Performs a keyword-based rerank to select the 8 most relevant programs.
2. Generates an ASM program that works perfectly headlessly via LLM (0x9C).
3. Renders the candidates to the screen for 'Visual Hard Drive' aesthetic.
4. Correctly displays the multi-line LLM response from RAM.
"""

import json
import re
import os

REGISTRY_FILE = "programs/spatial_registry.json"
QUERY = "lsystem"

def pre_filter_registry(registry, query, count=8):
    stop_words = {"which", "program", "simulates", "helps", "me", "find", "the", "a", "an", "is", "in", "to", "for", "with"}
    keywords = [w for w in re.findall(r"\w+", query.lower()) if w not in stop_words]
    
    scores = []
    for entry in registry:
        score = 0
        text = (entry['name'] + " " + entry['summary']).lower()
        for kw in keywords:
            if kw in text: score += 10
        for kw in keywords:
            if kw in entry['name'].lower(): score += 5
        scores.append((score, entry))
    
    scores.sort(key=lambda x: (-x[0], x[1]['name']))
    return [s[1] for s in scores[:count]]
def generate_search_asm():
    if not os.path.exists(REGISTRY_FILE):
        print(f"Error: {REGISTRY_FILE} not found. Run spatial_registry.py first.")
        return

    with open(REGISTRY_FILE, 'r') as f:
        registry = json.load(f)

    # 1. Pre-filter context based on query (REDUCED to 3 for speed)
    context = pre_filter_registry(registry, QUERY, count=3)

    
    asm = "; --- NEURAL SEARCH AGENT (v5 Hybrid) ---\n"
    asm += "; Uses text-mode LLM (0x9C) for headless reliability.\n\n"
    
    asm += "#define PROMPT_RAM 0x5000\n"
    asm += "#define RESP_RAM   0x6400\n\n"
    
    # 1. Visuals: Render Glance
    asm += "LDI r1, 0x1a1a2e\nFILL r1\n\n"
    asm += "LDI r1, 10\nLDI r2, 10\nLDI r3, :header_txt\nLDI r4, 0x00FF00\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n\n"
    
    y = 30
    for i, entry in enumerate(context):
        label = f"item_{i}"
        asm += f"LDI r1, 10\nLDI r2, {y}\nLDI r3, :{label}_txt\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
        y += 12
    
    # 2. Setup Prompt
    asm += "\n; --- Setup Text-Mode LLM call ---\n"
    asm += "LDI r10, :full_prompt\n"
    asm += "LDI r11, RESP_RAM\n"
    asm += "LDI r12, 512\n"
    asm += "LLM r10, r11, r12\n"
    
    # 3. Display Result
    asm += "\n; Draw Response Label\n"
    asm += "LDI r1, 10\nLDI r2, 150\nLDI r3, :resp_label\nLDI r4, 0x00FFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    
    asm += "\n; Draw LLM Response (Multi-line wrap)\n"
    asm += "LDI r1, 10\nLDI r2, 165\nLDI r13, RESP_RAM\nLDI r14, 0xFFFFFF\nLDI r15, 0\nDRAWTEXT r1, r2, r13, r14, r15\n"
    
    # Simple line 2 wrap at offset 42
    asm += "LDI r2, 177\nLDI r12, 42\nADD r13, r12\nDRAWTEXT r1, r2, r13, r14, r15\n"
    
    asm += "\nHALT\n\n"
    
    # 4. Data Section
    asm += ":header_txt .str \"NEURAL REGISTRY SEARCH (HEADLESS)\"\n"
    asm += ":resp_label .str \"AI SEARCH RESULT:\"\n"
    for i, entry in enumerate(context):
        label = f"item_{i}"
        txt = f"{entry['name']}: {entry['summary'][:45]}"
        asm += f":{label}_txt .str \"{txt}\"\n"
    
    # Build the massive text prompt
    prompt_header = f"Task: Search this registry for '{QUERY}'. Return the filename and a reason.\\n\\nRegistry:\\n"
    prompt_body = "\\n".join([f"- {e['name']}: {e['summary']}" for e in context])
    full_prompt = prompt_header + prompt_body
    asm += f":full_prompt .str \"{full_prompt}\"\n"

    with open("programs/neural_search.asm", "w") as f:
        f.write(asm)
    print("Generated programs/neural_search.asm (v5 Hybrid)")

if __name__ == "__main__":
    generate_search_asm()
