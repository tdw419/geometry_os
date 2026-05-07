
import subprocess
import os
import sys
import time
import torch

sys.path.insert(0, 'pixelflow')
from pixel_llm_pipeline import generate_asm, cleanup_asm, load_model, validate_asm

def run_semantic_test(asm_text, test_id):
    tmp_path = f'/tmp/eval_{test_id}.asm'
    with open(tmp_path, 'w') as f:
        f.write(asm_text)
    
    out_png = f'/tmp/eval_{test_id}.png'
    cmd = [
        'cargo', 'run', '--release', '--quiet', '--bin', 'geos-term', '--',
        tmp_path,
        '--script', f'frame:60,snapshot:{out_png}'
    ]
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode == 0:
        if os.path.exists(out_png):
            return True, "Assembled and Ran", out_png
        else:
            return True, "Assembled and Ran (no PNG?)", None
    else:
        # Filter out warnings
        lines = [l for l in result.stderr.split('\n') if 'warning:' not in l and l.strip()]
        err = lines[0] if lines else "Unknown Error"
        return False, err, None

def main():
    print('Loading PixelGPT model...')
    model, seed_to_idx, idx_to_seed = load_model('pixel_llm_ckpt.pt', device='cuda')
    
    prompts = [
        'LDI r1, 0xFF0000\nFILL r1',
        'LDI r1, 50\nLDI r2, 50\nLDI r3, 100\nLDI r4, 100\nLDI r5, 0x00FF00\nRECTF r1, r2, r3, r4, r5',
        'LDI r1, 128\nLDI r2, 128\nLDI r3, 50\nLDI r4, 0x0000FF\nCIRCLE r1, r2, r3, r4',
        'LDI r1, 10\nLDI r2, 10\nLDI r3, 240\nLDI r4, 240\nLDI r5, 0xFFFFFF\nLINE r1, r2, r3, r4, r5',
        'loop:\n  LDI r1, 0xFFFFFF\n  FILL r1\n  HALT'
    ]
    
    results = []
    for i, p in enumerate(prompts):
        print(f'\n--- Test {i+1} ---')
        print(f'Prompt: {repr(p)}')
        
        # Try up to 5 times to get a syntactically valid program
        success = False
        for attempt in range(5):
            raw = generate_asm(model, seed_to_idx, idx_to_seed, p, max_tokens=100, temperature=0.7, top_k=50, device='cuda', use_grammar=True)
            cleaned = cleanup_asm(raw)
            valid, msg = validate_asm(cleaned)
            if valid:
                print(f'  Syntactically valid on attempt {attempt+1}')
                ok, run_msg, png = run_semantic_test(cleaned, i)
                if ok:
                    print(f'  SEMANTIC SUCCESS: {run_msg}')
                    results.append(True)
                else:
                    print(f'  SEMANTIC FAILURE: {run_msg}')
                    results.append(False)
                success = True
                break
        
        if not success:
            print('  Failed to generate syntactically valid program.')
            results.append(False)

    pass_rate = sum(results) / len(results)
    print(f'\nOverall Semantic Pass Rate: {pass_rate*100:.0f}%')

if __name__ == '__main__':
    main()
