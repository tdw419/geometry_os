#!/usr/bin/env python3
import json
import re
import os
import shutil
import subprocess
from pathlib import Path

SYNTH_PATH = Path("pixelflow/program_synthesizer.py")
EVAL_PATH = Path("pixelflow/smoke_results/evaluation.json")

def boost_weight(category, boost_factor=2):
    print(f"[*] Boosting weight for category: {category}")
    content = SYNTH_PATH.read_text()
    
    # Backup
    shutil.copy(SYNTH_PATH, SYNTH_PATH.with_suffix(".py.bak"))
    
    # Regex to find (self.generate_CATEGORY, WEIGHT)
    # We need to handle the case where it's already been boosted or has a different weight
    pattern = fr'\(self\.generate_{category},\s*(\d+)\)'
    match = re.search(pattern, content)
    
    if match:
        old_weight = int(match.group(1))
        new_weight = old_weight * boost_factor
        # Cap weight at 100 to avoid overwhelming
        new_weight = min(new_weight, 100)
        
        new_content = re.sub(pattern, f'(self.generate_{category}, {new_weight})', content)
        SYNTH_PATH.write_text(new_content)
        print(f"    Weight updated: {old_weight} -> {new_weight}")
        return True
    else:
        print(f"[!] Could not find category {category} in {SYNTH_PATH}")
        return False

def regenerate_dataset():
    print("[*] Regenerating dataset...")
    try:
        # Run synthesizer
        # It defaults to 100,000 samples and synthetic_dataset_v13 output_dir
        subprocess.run(["python3", "pixelflow/program_synthesizer.py"], check=True)
        print("[*] Dataset regenerated.")
        
        # Build NPZ
        print("[*] Rebuilding NPZ...")
        subprocess.run([
            "python3", "pixelflow/build_bilingual_dataset.py", 
            "--data-dir", "synthetic_dataset_v13",
            "--output", "bilingual_dataset.npz"
        ], check=True)
        print("[*] NPZ rebuilt.")
        return True
    except subprocess.CalledProcessError as e:
        print(f"[!] Regeneration failed: {e}")
        return False

def main():
    if not EVAL_PATH.exists():
        print(f"[!] {EVAL_PATH} not found.")
        return

    with open(EVAL_PATH, "r") as f:
        eval_data = json.load(f)

    weakest = eval_data["weakest_category"]
    score = eval_data["min_score"]

    if score >= 0.9:
        print(f"[*] Performance is high ({score:.1%}). No adjustment needed.")
        return

    print(f"[*] Detected performance bottleneck in '{weakest}' ({score:.1%})")
    
    if boost_weight(weakest):
        if regenerate_dataset():
            print("[*] META-LOOP: Act Phase Complete. Curriculum updated and dataset ready for next epoch.")
        else:
            print("[!] Act Phase failed during regeneration.")
    else:
        print("[!] Act Phase failed during weight adjustment.")

if __name__ == "__main__":
    main()
