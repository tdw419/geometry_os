#!/usr/bin/env python3
import json
import os

REGISTRY_FILE = "programs/spatial_registry.json"
BOOT_ASM = "programs/boot.asm"

def generate_boot():
    if not os.path.exists(REGISTRY_FILE):
        print("Registry missing. Run spatial_registry.py first.")
        return

    with open(REGISTRY_FILE, 'r') as f:
        registry = json.load(f)

    # 1. Stats
    total_programs = len(registry)
    # We'll hardcode the 13.6 BPP for now as a "system milestone"
    density = "13.6 BPP"
    
    # 2. Categories
    categories = {}
    for entry in registry:
        cat = entry.get('category', 'Utility')
        categories[cat] = categories.get(cat, 0) + 1
    
    # Sort categories by count
    sorted_cats = sorted(categories.items(), key=lambda x: -x[1])
    cat_summary = ", ".join([f"{c}: {n}" for c, n in sorted_cats[:3]])

    asm = "; --- GEOMETRY OS INTELLIGENT BOOT (v1) ---\n"
    asm += "; Self-Indexing Cognitive Entry Point\n\n"
    
    # Visual Theme: Deep Blue / Purple Gradient-ish
    asm += "LDI r1, 0x050508\nFILL r1\n\n"
    
    # Title
    asm += "LDI r1, 10\nLDI r2, 10\nLDI r3, :title_txt\nLDI r4, 0x00FFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n\n"
    
    # Stats Block
    asm += "LDI r1, 10\nLDI r2, 30\nLDI r3, :stats_txt\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    asm += "LDI r1, 10\nLDI r2, 42\nLDI r3, :density_txt\nLDI r4, 0x00FF00\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n\n"
    
    # Semantic Awareness
    asm += "LDI r1, 10\nLDI r2, 60\nLDI r3, :summary_label\nLDI r4, 0xAAAAAA\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    asm += "LDI r1, 10\nLDI r2, 72\nLDI r3, :summary_txt\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n\n"
    
    # Launch Options
    asm += "LDI r1, 10\nLDI r2, 100\nLDI r3, :launch_txt\nLDI r4, 0x00FFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    asm += "LDI r1, 15\nLDI r2, 115\nLDI r3, :opt1\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    asm += "LDI r1, 15\nLDI r2, 127\nLDI r3, :opt2\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n"
    asm += "LDI r1, 15\nLDI r2, 139\nLDI r3, :opt3\nLDI r4, 0xFFFFFF\nLDI r5, 0\nDRAWTEXT r1, r2, r3, r4, r5\n\n"

    # Input Loop
    asm += ":input_loop\n"
    asm += "FRAME\n"
    asm += "IKEY r10\n"
    
    # 'S' = 115 (Search)
    asm += "CMPI r10, 115\n"
    asm += "JZ r0, :start_search\n"
    
    # 'T' = 116 (Tools/Terminal)
    asm += "CMPI r10, 116\n"
    asm += "JZ r0, :start_term\n"
    
    # 'R' = 114 (Registry)
    asm += "CMPI r10, 114\n"
    asm += "JZ r0, :start_reg\n"
    
    asm += "JMP :input_loop\n\n"
    
    # Launch Actions
    asm += ":start_search\n"
    asm += "LDI r1, :search_path\n"
    asm += "CHAIN r1\n"
    asm += "HALT\n\n"
    
    asm += ":start_term\n"
    asm += "LDI r1, :term_path\n"
    asm += "CHAIN r1\n"
    asm += "HALT\n\n"
    
    asm += ":start_reg\n"
    asm += "LDI r1, :reg_path\n"
    asm += "CHAIN r1\n"
    asm += "HALT\n\n"

    # Data
    asm += ":title_txt .str \"GEOMETRY OS: INTELLIGENT BOOT\"\n"
    asm += f":stats_txt .str \"SYSTEM: {total_programs} Programs Indexed\"\n"
    asm += f":density_txt .str \"STORAGE DENSITY: {density}\"\n"
    asm += ":summary_label .str \"SEMANTIC LANDSCAPE:\"\n"
    asm += f":summary_txt .str \"{cat_summary}...\"\n"
    asm += ":launch_txt .str \"INTENT-BASED LAUNCH:\"\n"
    asm += ":opt1 .str \"[S] SEARCH - Neural Discovery\"\n"
    asm += ":opt2 .str \"[T] TOOLS  - System Utilities\"\n"
    asm += ":opt3 .str \"[R] REGISTRY - Visual Index\"\n"
    
    # Filenames (Absolute or Relative to project root / FS_DIR)
    # The VM CHAIN opcode checks read_file_by_name which checks FS_DIR fallback.
    # We'll use the .asm files from the programs/ directory.
    asm += ":search_path .str \"programs/neural_search.asm\"\n"
    asm += ":term_path .str \"programs/hermes_term.asm\"\n"
    asm += ":reg_path .str \"programs/hello.asm\" ; Placeholder for registry browser\n"
    
    with open(BOOT_ASM, "w") as f:
        f.write(asm)
    print(f"Generated {BOOT_ASM}")

if __name__ == "__main__":
    generate_boot()
