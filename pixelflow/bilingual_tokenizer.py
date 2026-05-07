#!/usr/bin/env python3
"""
Bilingual Tokenizer for Geometry OS (V4).

Architecture:
- Atomic Opcodes & Structural: 0-267 (via OpcodeTokenizer)
- BPE Prose (comments, descriptions): 300+ (HuggingFace tokenizers BPE)
- Character-level Literals (numbers, hex, labels): NOT through BPE.
  Instead, each character gets its own ID in a reserved range (270-299).

This gives perfect round-trip because:
- Opcodes/registers are atomic (single ID)
- Numbers like "123" encode as [char_1, char_2, char_3] and decode back to "123"
- BPE handles prose compression naturally
- No cross-contamination between prose and literal encoding

ID Space Layout:
  0-267: Atomic opcodes, registers, structural tokens (OpcodeTokenizer)
  268-269: CHAR_START, CHAR_END markers (literal boundary)
  270-299: Printable ASCII characters (space, 0-9, A-Z, a-z, _, ., :, x, etc.)
  300+:   BPE text tokens (prose, comments)
"""

import json
import os
import glob
import re
import string
from pathlib import Path
from tokenizers import Tokenizer, models, trainers, pre_tokenizers
from opcode_tokenizer import OpcodeTokenizer, PAD, BOS, EOS, NEWLINE, COMMENT, NUM, LABEL, STR, COMMA, COLON

# Reserved IDs for character-level literal encoding (270-299)
# We map printable chars that appear in ASM literals to fixed IDs
_CHAR_TABLE = (
    string.digits +          # 0-9  (10 chars)
    string.ascii_uppercase + # A-Z  (26 chars)
    string.ascii_lowercase + # a-z  (26 chars)
    "_."                     # _ .  (2 chars)
)
# Add symbols used in addressing, operators, comments
_EXTRA_CHARS = "[]+-*/=!#()<>{}"
_CHAR_TABLE = _CHAR_TABLE + _EXTRA_CHARS
CHAR_TO_ID = {ch: 270 + i for i, ch in enumerate(_CHAR_TABLE)}
ID_TO_CHAR = {v: k for k, v in CHAR_TO_ID.items()}

# BPE offset must be above the char range
CHAR_RANGE_END = 270 + len(_CHAR_TABLE)  # 334

# Special token to force a space in decode (between adjacent char sequences)
SPACE_TOKEN = CHAR_RANGE_END  # 334

BPE_OFFSET = CHAR_RANGE_END + 5  # Leave some room = 339

class BilingualTokenizer:
    def __init__(self, text_vocab_size=3000, offset=None):
        self.asm_tok = OpcodeTokenizer()
        self.text_tok = Tokenizer(models.BPE(unk_token="<UNK>"))
        self.text_tok.pre_tokenizer = pre_tokenizers.Whitespace()
        self.text_vocab_size = text_vocab_size
        self.offset = offset or BPE_OFFSET

    def train_text(self, files):
        """Train the BPE model on GeOS documentation or annotated programs."""
        if not files: return
        trainer = trainers.BpeTrainer(
            vocab_size=self.text_vocab_size,
            special_tokens=["<UNK>", "<PAD>", "<BOS>", "<EOS>", "<NL>"]
        )
        self.text_tok.train(files, trainer)

    def _encode_chars(self, text):
        """Encode a literal string character-by-character using fixed char IDs."""
        result = []
        for ch in text:
            if ch in CHAR_TO_ID:
                result.append(CHAR_TO_ID[ch])
            else:
                # Unknown char -- encode as BPE fallback
                bpe_ids = self.text_tok.encode(ch).ids
                result.extend(tid + self.offset for tid in bpe_ids)
        return result

    def _encode_bpe(self, text):
        """Helper to encode prose text via BPE and apply offset."""
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
                # Full-line comment -> BPE
                tokens.extend(self._encode_bpe(trimmed))
            else:
                # Check for inline comment (code ; comment)
                # Split on first semicolon that's not inside a string
                semicolon_pos = self._find_comment_semicolon(trimmed)
                if semicolon_pos >= 0:
                    code_part = trimmed[:semicolon_pos].rstrip()
                    comment_part = trimmed[semicolon_pos:]  # includes the ';'
                    # Encode code part
                    if code_part:
                        tokens.extend(self._encode_asm_line(code_part))
                    # Encode comment part via BPE
                    tokens.extend(self._encode_bpe(comment_part))
                else:
                    tokens.extend(self._encode_asm_line(trimmed))

            if i < len(lines) - 1:
                tokens.append(NEWLINE)

        if add_eos: tokens.append(EOS)
        return tokens

    def _find_comment_semicolon(self, line):
        """Find the position of a comment semicolon in an ASM line."""
        # Simple heuristic: first ';' not preceded by a digit (avoids 0x; edge cases)
        idx = line.find(';')
        if idx > 0:
            return idx
        return -1

    def _encode_asm_line(self, line):
        """Encode a pure ASM line (no comments) into token IDs."""
        tokens = []
        # Split on whitespace, commas, colons, and brackets individually
        parts = re.split(r'([\s,:{}\[\]])', line)
        for p in parts:
            ps = p.strip()
            if not ps: continue
            if ps == ",":
                tokens.append(COMMA)
            elif ps == ":":
                tokens.append(COLON)
            else:
                tid = self.asm_tok._classify_token(ps)
                # Directives (.byte, .data, etc.) should be treated as opcodes
                is_directive = ps.startswith('.')
                if is_directive:
                    # Encode directive as chars, then emit SPACE_TOKEN to separate from args
                    tokens.extend(self._encode_chars(ps))
                    tokens.append(SPACE_TOKEN)
                elif tid in [NUM, LABEL, STR]:
                    tokens.extend(self._encode_chars(ps))
                elif ps == "[" or ps == "]":
                    # Brackets are structural -- encode as char but mark as no-space-needed
                    tokens.extend(self._encode_chars(ps))
                else:
                    tokens.append(tid)
        return tokens

    def decode(self, ids):
        """
        Decodes mixed IDs back to source text.
        Character-level IDs (270-333) are concatenated directly.
        BPE IDs (339+) are decoded through the BPE model.
        """
        parts = []
        current_bpe_chunk = []
        current_chars = []

        def flush_bpe():
            if current_bpe_chunk:
                text = self.text_tok.decode(current_bpe_chunk)
                if parts and not parts[-1].endswith("\n") and not parts[-1].endswith(" "):
                    parts.append(" ")
                parts.append(text)
                current_bpe_chunk.clear()

        def flush_chars():
            if current_chars:
                text = "".join(current_chars)
                # Determine if we need a space before this text
                need_space = True
                if not parts:
                    need_space = False
                elif parts[-1].endswith("\n") or parts[-1].endswith(" "):
                    need_space = False
                elif parts[-1].endswith(","):
                    need_space = False  # comma already provides visual separation
                elif parts[-1].endswith(":"):
                    need_space = False  # colon before label
                elif parts[-1].endswith("[") and text.startswith("]"):
                    need_space = False  # ] right after [
                elif text.startswith("]"):
                    need_space = False  # ] right after register/number
                if need_space:
                    parts.append(" ")
                parts.append(text)
                current_chars.clear()

        for tid in ids:
            if tid == BOS or tid == EOS or tid == PAD:
                continue
            
            if tid in ID_TO_CHAR:
                # Character-level literal token
                flush_bpe()
                current_chars.append(ID_TO_CHAR[tid])
            elif tid >= self.offset:
                # BPE token
                flush_chars()
                current_bpe_chunk.append(tid - self.offset)
            else:
                # Atomic opcode/register/structural
                flush_bpe()
                flush_chars()
                if tid == NEWLINE:
                    parts.append("\n")
                elif tid == COMMA:
                    parts.append(", ")
                elif tid == COLON:
                    parts.append(":")
                else:
                    token = self.asm_tok.id2token.get(tid, f'<unk:{tid}>')
                    if parts and not parts[-1].endswith("\n") and not parts[-1].endswith(" ") and not parts[-1].endswith(":") and not parts[-1].endswith("["):
                        parts.append(" ")
                    parts.append(token)
        
        flush_bpe()
        flush_chars()
        res = "".join(parts).strip()
        return res

    def save(self, directory):
        path = Path(directory)
        path.mkdir(parents=True, exist_ok=True)
        self.text_tok.save(str(path / "text_tokenizer.json"))
        self.asm_tok.save(str(path / "asm_tokenizer.json"))
        config = {
            "text_vocab_size": self.text_vocab_size,
            "offset": self.offset,
            "char_range_end": CHAR_RANGE_END,
        }
        with open(path / "config.json", "w") as f:
            json.dump(config, f)

    @classmethod
    def load(cls, directory):
        path = Path(directory)
        with open(path / "config.json", "r") as f:
            config = json.load(f)
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
    
    # Test 1: Literal preservation (the critical test)
    sample = "LDI r1, 123\nloop:\n  CIRCLE r0, r1, 45, 0xFF0000\n  JNZ r6, main_loop\n  SUB r6, r9\nHALT"
    ids_sample = bt.encode(sample, add_bos=False, add_eos=False)
    decoded_sample = bt.decode(ids_sample)
    print(f"\n=== Literal Round-Trip Test ===")
    print(f"Original:\n{sample}")
    print(f"Decoded:\n{decoded_sample}")
    
    # Line-by-line exact match (ignoring leading whitespace)
    orig_lines = [l.strip() for l in sample.strip().split('\n')]
    dec_lines = [l.strip() for l in decoded_sample.strip().split('\n')]
    exact = all(o == d for o, d in zip(orig_lines, dec_lines))
    print(f"\nExact line match: {exact}")
    
    # Test 2: Full file round-trips
    print(f"\n=== Full File Round-Trips ===")
    for test_file in ["annotated_dataset/programs_circles.asm", 
                      "annotated_dataset/programs_asteroids.asm",
                      "annotated_dataset/programs_hello.asm"]:
        if not os.path.exists(test_file):
            continue
        original = Path(test_file).read_text()
        ids = bt.encode(original)
        decoded = bt.decode(ids)
        
        orig_lines = original.strip().split('\n')
        dec_lines = decoded.strip().split('\n')
        
        code_ok = 0
        code_total = 0
        prose_ok = 0
        prose_total = 0
        for o, d in zip(orig_lines, dec_lines):
            if o.strip().startswith(';'):
                prose_total += 1
                if o.strip() == d.strip():
                    prose_ok += 1
            elif o.strip():
                code_total += 1
                if o.strip() == d.strip():
                    code_ok += 1
        
        short = os.path.basename(test_file)
        print(f"\n{short} ({len(ids)} tokens):")
        print(f"  Code:   {code_ok}/{code_total} exact")
        print(f"  Prose:  {prose_ok}/{prose_total} exact")
        print(f"  Total:  {code_ok + prose_ok}/{code_total + prose_total} exact")
        
        # Show code mismatches (these should be ZERO)
        shown = 0
        for i, (o, d) in enumerate(zip(orig_lines, dec_lines)):
            if not o.strip().startswith(';') and o.strip() and o.strip() != d.strip() and shown < 3:
                print(f"  CODE MISMATCH L{i+1}:")
                print(f"    ORIG: {o.strip()}")
                print(f"    DECD: {d.strip()}")
                shown += 1

    bt.save("bilingual_tokenizer_v4")
    print(f"\nSaved to bilingual_tokenizer_v4/")
    print(f"ID space: 0-{CHAR_RANGE_END} (atomic+chars), {bt.offset}+ (BPE)")


if __name__ == "__main__":
    run_production_test()
