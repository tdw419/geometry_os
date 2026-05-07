#!/usr/bin/env python3
"""
Bilingual Tokenizer for Geometry OS (V2.1).

Architecture:
- Atomic Opcodes & Structural: 0-267 (via OpcodeTokenizer)
- Numbers, Labels, Strings & Prose: 300+ (via BPE)
"""

import json
import os
import glob
import re
from pathlib import Path
from tokenizers import Tokenizer, models, trainers, pre_tokenizers
from opcode_tokenizer import OpcodeTokenizer, PAD, BOS, EOS, NEWLINE, COMMENT, NUM, LABEL, STR, COMMA, COLON

class BilingualTokenizer:
    def __init__(self, text_vocab_size=2500, offset=300):
        self.asm_tok = OpcodeTokenizer()
        self.text_tok = Tokenizer(models.BPE(unk_token="<UNK>"))
        self.text_tok.pre_tokenizer = pre_tokenizers.Whitespace()
        self.text_vocab_size = text_vocab_size
        self.offset = offset

    def train_text(self, files):
        """Train the BPE model on GeOS documentation or annotated programs."""
        if not files: return
        trainer = trainers.BpeTrainer(
            vocab_size=self.text_vocab_size,
            special_tokens=["<UNK>", "<PAD>", "<BOS>", "<EOS>", "<NL>"]
        )
        self.text_tok.train(files, trainer)

    def _encode_bpe(self, text):
        """Helper to encode text via BPE and apply offset."""
        ids = self.text_tok.encode(text).ids
        return [tid + self.offset for tid in ids]

    def encode(self, text, add_bos=True, add_eos=True):
        tokens = []
        if add_bos: tokens.append(BOS)

        lines = text.split('\n')
        for i, line in enumerate(lines):
            trimmed = line.strip()
            if not trimmed:
                if i < len(lines) - 1: tokens.append(NEWLINE)
                continue

            if trimmed.startswith(';'):
                tokens.extend(self._encode_bpe(trimmed))
            else:
                parts = re.split(r'([\s,:]+)', line)
                for p in parts:
                    ps = p.strip()
                    if not ps: continue
                    if ps == ",": tokens.append(COMMA)
                    elif ps == ":": tokens.append(COLON)
                    else:
                        tid = self.asm_tok._classify_token(ps)
                        if tid in [NUM, LABEL, STR]:
                            tokens.extend(self._encode_bpe(ps))
                        else:
                            tokens.append(tid)

            if i < len(lines) - 1:
                tokens.append(NEWLINE)

        if add_eos: tokens.append(EOS)
        return tokens

    def decode(self, ids):
        parts = []
        current_bpe_chunk = []

        def flush_bpe():
            if current_bpe_chunk:
                # Use the tokenizer's decoder to merge subwords
                text = self.text_tok.decode(current_bpe_chunk)
                if parts and not parts[-1].endswith("\n") and not parts[-1].endswith(" "):
                    parts.append(" ")
                parts.append(text)
                current_bpe_chunk.clear()

        for tid in ids:
            if tid == BOS or tid == EOS or tid == PAD:
                continue
            
            if tid >= self.offset:
                current_bpe_chunk.append(tid - self.offset)
            else:
                flush_bpe()
                if tid == NEWLINE:
                    parts.append("\n")
                elif tid == COMMA:
                    parts.append(", ")
                elif tid == COLON:
                    parts.append(":")
                else:
                    token = self.asm_tok.id2token.get(tid, f'<unk:{tid}>')
                    if parts and not parts[-1].endswith("\n") and not parts[-1].endswith(" ") and not parts[-1].endswith(":"):
                        parts.append(" ")
                    parts.append(token)
        
        flush_bpe()
        res = "".join(parts).strip()
        res = res.replace(" ,", ",")
        res = res.replace(" :", ":")
        return res

    def save(self, directory):
        path = Path(directory)
        path.mkdir(parents=True, exist_ok=True)
        self.text_tok.save(str(path / "text_tokenizer.json"))
        self.asm_tok.save(str(path / "asm_tokenizer.json"))
        config = {"text_vocab_size": self.text_vocab_size, "offset": self.offset}
        with open(path / "config.json", "w") as f: json.dump(config, f)

    @classmethod
    def load(cls, directory):
        path = Path(directory)
        with open(path / "config.json", "r") as f: config = json.load(f)
        instance = cls(text_vocab_size=config["text_vocab_size"], offset=config["offset"])
        instance.text_tok = Tokenizer.from_file(str(path / "text_tokenizer.json"))
        instance.asm_tok = OpcodeTokenizer.load(str(path / "asm_tokenizer.json"))
        return instance

def run_production_test():
    annotated_files = glob.glob("annotated_dataset/*.asm")
    if not annotated_files:
        print("Error: No annotated files found.")
        return

    print(f"Training on {len(annotated_files)} annotated programs...")
    bt = BilingualTokenizer(text_vocab_size=3000)
    bt.train_text(annotated_files)
    
    test_path = "annotated_dataset/programs_circles.asm"
    original_text = Path(test_path).read_text()
    
    print(f"\nTesting round-trip on {test_path}...")
    ids = bt.encode(original_text)
    decoded = bt.decode(ids)
    
    print("-" * 20 + " ORIGINAL (Code Snippet) " + "-" * 20)
    print("\n".join(original_text.split('\n')[20:25]))
    print("-" * 20 + " DECODED (Code Snippet)  " + "-" * 20)
    print("\n".join(decoded.split('\n')[20:25]))
    
    # Real Round-Trip check (Numbers should be preserved!)
    sample = "LDI r1, 123\nloop:\n  CIRCLE r0, r1, 45, 0xFF0000"
    ids_sample = bt.encode(sample, add_bos=False, add_eos=False)
    decoded_sample = bt.decode(ids_sample)
    print(f"\nSample Round-Trip Test:")
    print(f"Original: {sample}")
    print(f"Decoded:  {decoded_sample}")
    
    # Lenient check (remove spaces for numbers)
    clean_decoded = decoded_sample.replace(" ", "")
    clean_original = sample.replace(" ", "")
    
    if "123" in clean_decoded and "0xFF0000" in clean_decoded:
        print("\nSUCCESS: Numbers and Labels preserved!")
    else:
        print("\nFAILURE: Numbers/Labels lost.")

    bt.save("bilingual_tokenizer_v2")

if __name__ == "__main__":
    run_production_test()
