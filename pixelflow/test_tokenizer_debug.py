#!/usr/bin/env python3
import sys
import os

# Add pixelflow to path
sys.path.insert(0, os.path.join(os.getcwd(), "pixelflow"))
from bilingual_tokenizer import BilingualTokenizer

def test_tokenizer():
    tokenizer_path = "pixelflow/bilingual_tokenizer_v4"
    if not os.path.exists(tokenizer_path):
        print(f"Error: Tokenizer path {tokenizer_path} not found.")
        return

    print(f"[*] Loading tokenizer from {tokenizer_path}...")
    tokenizer = BilingualTokenizer.load(tokenizer_path)

    test_sentences = [
        "; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.",
        "LDI r1, 10",
        "loop:",
        "PSET r1, r2, 0xFF0000",
        "; This is a comment with numbers 123 and hex 0xABC"
    ]

    for sent in test_sentences:
        print(f"\n--- Test: '{sent}' ---")
        ids = tokenizer.encode(sent, add_bos=False, add_eos=False)
        print(f"IDs: {ids}")
        
        # Breakdown IDs
        breakdown = []
        for tid in ids:
            if tid < tokenizer.offset:
                # ASM/Char range
                if hasattr(tokenizer, 'ID_TO_CHAR') and tid in tokenizer.ID_TO_CHAR:
                    breakdown.append(f"CHAR({tokenizer.ID_TO_CHAR[tid]})")
                else:
                    # Look up in ASM tokenizer if possible
                    # This depends on internal structure
                    breakdown.append(f"ASM({tid})")
            else:
                # BPE range
                word = tokenizer.text_tok.id_to_token(tid - tokenizer.offset)
                breakdown.append(f"BPE('{word}')")
        
        print(f"Breakdown: {' '.join(breakdown)}")
        
        decoded = tokenizer.decode(ids)
        print(f"Decoded: '{decoded}'")
        
        if decoded != sent:
            print(f"[!] MISMATCH!")
            # Check for space injection specifically
            if decoded.replace(" ", "") == sent.replace(" ", ""):
                print("    Note: Mismatch is purely whitespace/fragmentation.")

if __name__ == "__main__":
    test_tokenizer()
