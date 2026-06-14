#!/usr/bin/env python3
"""
Semantic Annotator for GeOS ASM Dataset.

Uses the local LLM (via model_choice) to generate English descriptions
for assembly programs. Creates paired code+text data for Bilingual PixelGPT.

Usage:
    python3 scripts/annotate_asm_dataset.py                  # annotate all
    python3 scripts/annotate_asm_dataset.py --batch 50       # first 50 per dir
    python3 scripts/annotate_asm_dataset.py --dir programs   # only real programs
"""

import os
import sys
import glob
import time
import argparse
from pathlib import Path
from model_choice import generate

PROGRAMS_DIR = "programs"
SYNTHETIC_DIR = "synthetic_programs"
OUTPUT_DIR = "annotated_dataset"

SYSTEM_PROMPT = (
    "You are a Geometry OS systems engineer. "
    "Provide a concise 1-2 sentence English description of what this GeOS assembly code does. "
    "Be technical and precise. Output ONLY the description, nothing else."
)

def annotate_file(file_path, max_retries=3):
    """Generate a description for a single .asm file with retry logic."""
    code = Path(file_path).read_text()
    prompt = f"Code:\n{code}\n\nDescription:"
    
    for attempt in range(max_retries):
        try:
            description = generate(
                prompt,
                system=SYSTEM_PROMPT,
                model='ollama/qwen2.5-coder:14b'
            ).strip()
            if description and len(description) > 10:
                return description
        except Exception as e:
            if attempt < max_retries - 1:
                wait = 2 ** (attempt + 1)
                print(f"retry({attempt+1})...", end=" ", flush=True)
                time.sleep(wait)
            else:
                raise
    return ""

def main():
    parser = argparse.ArgumentParser(description="Annotate GeOS ASM programs with English descriptions")
    parser.add_argument("--batch", type=int, default=0, help="Max files per directory (0=all)")
    parser.add_argument("--dir", type=str, default=None, help="Specific directory to process")
    parser.add_argument("--delay", type=float, default=0.5, help="Seconds between API calls (rate limit)")
    args = parser.parse_args()

    Path(OUTPUT_DIR).mkdir(exist_ok=True)

    if args.dir:
        target_dirs = [args.dir]
    else:
        target_dirs = [PROGRAMS_DIR, SYNTHETIC_DIR]

    total_annotated = 0
    total_skipped = 0
    total_errors = 0

    for target in target_dirs:
        if not Path(target).is_dir():
            print(f"Directory {target} not found, skipping")
            continue

        all_files = sorted(glob.glob(f"{target}/*.asm"))
        if args.batch > 0:
            all_files = all_files[:args.batch]

        print(f"[{target}] {len(all_files)} files to process")

        for f in all_files:
            out_name = f"{target.replace('/', '_')}_{os.path.basename(f)}"
            out_path = Path(OUTPUT_DIR) / out_name

            if out_path.exists():
                total_skipped += 1
                continue

            print(f"  {os.path.basename(f)}...", end=" ", flush=True)
            try:
                desc = annotate_file(f)
                content = f"; DESCRIPTION: {desc}\n\n" + Path(f).read_text()
                out_path.write_text(content)
                total_annotated += 1
                print(f"OK ({len(desc)} chars)")
            except Exception as e:
                total_errors += 1
                print(f"ERR: {e}")

            time.sleep(args.delay)

    total_files = len(list(Path(OUTPUT_DIR).glob('*.asm')))
    print(f"\nDone. Annotated: {total_annotated}, Skipped: {total_skipped}, Errors: {total_errors}")
    print(f"Total files in {OUTPUT_DIR}/: {total_files}")

if __name__ == "__main__":
    main()
