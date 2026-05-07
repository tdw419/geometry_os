#!/usr/bin/env python3
"""
Opcode-level tokenizer for GeOS assembly.

Each opcode, register, and structural element is a single discrete token.
No byte-packing, no BPE -- clean boundaries that the transformer can learn.

Vocabulary layout:
  0: PAD
  1: BOS
  2: EOS
  3: NEWLINE
  4: COMMENT  (everything after ; on a line, treated as a single token)
  5: <NUM>    (any numeric literal: 0x..., decimal)
  6: <LABEL>  (any identifier used as a jump target)
  7: <STR>    (quoted string literal)
  8: COMMA    (,)
  9: COLON    (:)
  10..235:    226 opcodes
  236..267:   r0-r31
"""

import re
import json
import os
from pathlib import Path
from typing import Optional

# ─── Special tokens ──────────────────────────────────────────────────────────

PAD = 0
BOS = 1
EOS = 2
NEWLINE = 3
COMMENT = 4
NUM = 5
LABEL = 6
STR = 7
COMMA = 8
COLON = 9

SPECIAL_NAMES = {
    PAD: "<PAD>",
    BOS: "<BOS>",
    EOS: "<EOS>",
    NEWLINE: "<NL>",
    COMMENT: "<COMMENT>",
    NUM: "<NUM>",
    LABEL: "<LABEL>",
    STR: "<STR>",
    COMMA: ",",
    COLON: ":",
}

# ─── ISA opcodes (extracted from assembler source) ───────────────────────────

OPCODES = sorted([
    "ABS", "ADD", "ADDI", "AI_AGENT", "AI_INJECT", "ALARM_CLR", "ALARM_SET",
    "AND", "ANDI", "ASM", "ASM_RAM", "ASMSELF", "AUDIO_PLAY", "AUDIO_STATUS",
    "AUDIO_STOP", "BCLR", "BEEP", "BFE", "BFI", "BGE", "BITCLR", "BITSET",
    "BITTEST", "BLEND", "BLENDR", "BLT", "BNOT", "BREAKPOINT", "BSET", "BTST",
    "CALL", "CHDIR", "CIRCLE", "CLAMP", "CLIPCLR", "CLIP_COPY", "CLIP_HISTORY",
    "CLIP_PASTE", "CLIPSET", "CLIP_TEXT", "CLOSE", "CMOV", "CMP", "CMPI",
    "CONNECT", "COPY", "CSEL", "DISCONNECT", "DIV", "DRAWTEXT", "EXEC", "EXECP",
    "EXIT", "FCOPY", "FILL", "FLOOD", "FMKDIR", "FONT_SELECT", "FORK",
    "FORMULA", "FORMULACLEAR", "FORMULAREM", "FRAME", "FSCLOSE", "FSLS",
    "FSOPEN", "FSREAD", "FSTAT", "FSWRITE", "FUNLINK", "GETCWD", "GETENV",
    "GETPID", "HALT", "HASHGET", "HASHINIT", "HASHSET", "HERMES", "HITCLR",
    "HITQ", "HITSET", "HTPARSE", "HTTPGET", "HYPERVISOR", "IKEY", "IMOUSE",
    "INV", "IOCTL", "JMP", "JNZ", "JZ", "KILL", "LDI", "LINE", "LLM",
    "LOAD", "LOADPNG", "LOADS", "LOADSRCIMG", "LS", "MATMUL", "MATVEC", "MAX",
    "MEDTEXT", "MEMCPY", "MEMSET", "MIN", "MOD", "MOUSEB", "MOUSECLICK",
    "MOUSEQ", "MOUSEX", "MOUSEY", "MOV", "MSGRCV", "MSGSND", "MUL", "NEG",
    "NET_RECV", "NET_SEND", "NOP", "NOT", "NOTE", "NPROC", "OPEN", "OR", "ORI",
    "PATCH", "PATCHW", "PEEK", "PIPE", "PIXEL_HISTORY", "POP", "PROCINFO",
    "PROCLS", "PROFILE", "PSET", "PSETI", "PTYCLOSE", "PTYOPEN", "PTYREAD",
    "PTYSIZE", "PTYWRITE", "PUSH", "RAND", "READ", "READLN", "RECT", "RECTF",
    "RELU", "REPLAY", "RET", "RETK", "ROTATE", "RUNNEXT", "SAR", "SARI",
    "SAVEPNG", "SCALE", "SCREENA", "SCREENP", "SCROLL", "SCRSHOT", "SEEK",
    "SETCAPS", "SETENV", "SETPRIORITY", "SHL", "SHLI", "SHR", "SHRI",
    "SHUTDOWN", "SIGNAL", "SIGSET", "SLEEP", "SMALLTEXT", "SNAP_TRACE",
    "SOCKRECV", "SOCKSEND", "SPAWN", "SPAWNC", "SPRANIM", "SPRBLT", "SPRFRAME",
    "SPRITE", "SPRITEANIM", "SPRITE_FRAME", "SPRITE_LOAD", "SPRLOAD", "STORE",
    "STORES", "STRCMP", "STRCPY", "STRLEN", "STRO", "SUB", "SUBI", "SYSCALL",
    "TEXT", "TEXTI", "TILEMAP", "TMR_GET", "TMR_WAIT", "TRACE_READ", "UNLINK",
    "VM_KILL", "VM_LIST", "VM_LIVE_KILL", "VM_LIVE_SPAWN", "VM_LIVE_STEP",
    "VM_PAUSE", "VM_RESUME", "VM_SET_BUDGET", "VM_SPAWN", "VM_STATUS", "VSTAT",
    "VWTXT", "WAITPID", "WINSYS", "WPIXEL", "WREAD", "WRITE", "WRITESTR",
    "XOR", "XORI", "YIELD",
])

OPCODE_SET = set(OPCODES)

# ─── Registers ────────────────────────────────────────────────────────────────

REGISTERS = [f"r{i}" for i in range(32)]
REGISTER_SET = set(REGISTERS)

# ─── Tokenizer ────────────────────────────────────────────────────────────────

class OpcodeTokenizer:
    def __init__(self):
        # Build vocabulary
        self.token2id = {}
        self.id2token = {}

        # Special tokens
        for id_, name in SPECIAL_NAMES.items():
            self.token2id[name] = id_
            self.id2token[id_] = name

        # Opcodes
        base = 10
        for i, op in enumerate(OPCODES):
            self.token2id[op] = base + i
            self.id2token[base + i] = op

        # Registers
        reg_base = base + len(OPCODES)
        for i, reg in enumerate(REGISTERS):
            self.token2id[reg] = reg_base + i
            self.id2token[reg_base + i] = reg

        self.vocab_size = len(self.token2id)

        # Patterns
        self.re_register = re.compile(r'^r\d+$')
        self.re_number = re.compile(r'^(0[xX][0-9a-fA-F]+|-?\d+)$')
        self.re_quoted = re.compile(r'^["\'].*["\']$')

    def _classify_token(self, token: str) -> int:
        """Classify a raw string token into a vocabulary ID."""
        if token == ",": return COMMA
        if token == ":": return COLON
        if token in self.token2id:
            return self.token2id[token]
        if self.re_register.match(token):
            return NUM
        if self.re_number.match(token):
            return NUM
        if self.re_quoted.match(token):
            return STR
        return LABEL

    def encode(self, text: str, add_bos: bool = True, add_eos: bool = True) -> list[int]:
        """Encode GeOS assembly text into token IDs."""
        tokens = []
        if add_bos:
            tokens.append(BOS)

        for line in text.split('\n'):
            line = line.strip()
            if not line:
                continue

            comment_pos = line.find(';')
            code_part = line
            if comment_pos >= 0:
                code_part = line[:comment_pos].strip()
            
            if code_part:
                sub_tokens = self._tokenize_line(code_part)
                tokens.extend(sub_tokens)
            
            if comment_pos >= 0:
                tokens.append(COMMENT)

            tokens.append(NEWLINE)

        if add_eos:
            tokens.append(EOS)

        return tokens

    def _tokenize_line(self, line: str) -> list[int]:
        """Tokenize a single line of assembly (no comments)."""
        line = line.strip()
        if not line:
            return []

        # Split preserving structural tokens , and :
        parts = re.split(r'([\s,:]+)', line)
        
        token_ids = []
        for p in parts:
            p = p.strip()
            if not p: continue
            if p == ",":
                token_ids.append(COMMA)
            elif p == ":":
                token_ids.append(COLON)
            else:
                token_ids.append(self._classify_token(p))
        
        return token_ids

    def decode(self, ids: list[int]) -> str:
        """Decode token IDs back to GeOS assembly text."""
        parts = []
        prev_was_newline = True
        for tid in ids:
            if tid == BOS or tid == EOS or tid == PAD:
                continue
            if tid == NEWLINE:
                parts.append('\n')
                prev_was_newline = True
                continue
            if tid == COMMENT:
                if not prev_was_newline: parts.append(' ')
                parts.append('; ')
                continue
            
            token = self.id2token.get(tid, f'<unk:{tid}>')
            
            if tid == COMMA:
                parts.append(', ')
                continue
            if tid == COLON:
                parts.append(':')
                continue

            if not prev_was_newline and not (parts and (parts[-1].endswith(':') or parts[-1].endswith('\n'))):
                parts.append(' ')
            
            if tid == NUM:
                parts.append('42')
            elif tid == LABEL:
                parts.append('label')
            elif tid == STR:
                parts.append('"text"')
            else:
                parts.append(token)
            
            prev_was_newline = False

        return ''.join(parts).strip()

    def decode_with_placeholders(self, ids: list[int]) -> str:
        """Decode token IDs, showing NUM/LABEL/STR as-is for debugging."""
        parts = []
        for tid in ids:
            if tid == BOS: parts.append('<BOS>')
            elif tid == EOS: parts.append('<EOS>')
            elif tid == PAD: parts.append('<PAD>')
            elif tid == NEWLINE: parts.append('\n')
            elif tid == COMMENT: parts.append(';')
            elif tid == NUM: parts.append('<NUM>')
            elif tid == LABEL: parts.append('<LABEL>')
            elif tid == STR: parts.append('<STR>')
            elif tid == COMMA: parts.append(',')
            elif tid == COLON: parts.append(':')
            elif tid in self.id2token: parts.append(self.id2token[tid])
            else: parts.append(f'<unk:{tid}>')
        return ' '.join(parts)

    def save(self, path: str):
        """Save tokenizer state to JSON."""
        data = {
            "token2id": self.token2id,
            "id2token": {str(k): v for k, v in self.id2token.items()},
            "vocab_size": self.vocab_size,
        }
        with open(path, 'w') as f:
            json.dump(data, f, indent=2)

    @classmethod
    def load(cls, path: str) -> 'OpcodeTokenizer':
        """Load tokenizer from JSON."""
        with open(path) as f:
            data = json.load(f)
        tok = cls()
        tok.token2id = data["token2id"]
        tok.id2token = {int(k): v for k, v in data["id2token"].items()}
        tok.vocab_size = data["vocab_size"]
        return tok


def build_dataset(programs_dir: str, output_file: str, context_len: int = 512, stride: int = 256):
    """Build tokenized training dataset from .asm files."""
    import numpy as np

    tokenizer = OpcodeTokenizer()
    programs_path = Path(programs_dir)
    asm_files = sorted(programs_path.glob("*.asm"))

    print(f"Found {len(asm_files)} .asm files")
    print(f"Vocabulary size: {tokenizer.vocab_size}")

    all_sequences = []
    total_tokens = 0

    for f in asm_files:
        try:
            text = f.read_text(encoding='utf-8')
            ids = tokenizer.encode(text)
            all_sequences.append(ids)
            total_tokens += len(ids)
        except Exception as e:
            print(f"  Skipping {f.name}: {e}")

    print(f"Total tokens across all programs: {total_tokens}")

    samples = []
    for seq in all_sequences:
        for i in range(0, len(seq) - 1, stride):
            chunk = seq[i:i + context_len]
            if len(chunk) < 4: continue
            if len(chunk) < context_len:
                chunk = chunk + [PAD] * (context_len - len(chunk))
            samples.append(chunk)

    print(f"Training sequences: {len(samples)} (context_len={context_len}, stride={stride})")

    data = np.array(samples, dtype=np.int32)
    np.savez_compressed(output_file, tokens=data)
    print(f"Saved dataset to {output_file} ({data.nbytes / 1024 / 1024:.1f} MB)")

    tok_path = str(Path(output_file).with_suffix('.tokenizer.json'))
    tokenizer.save(tok_path)
    print(f"Saved tokenizer to {tok_path}")

    return tokenizer, len(samples)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--programs-dir", default="programs")
    parser.add_argument("--output", default="pixel_llm_opcode_dataset.npz")
    parser.add_argument("--context-len", type=int, default=512)
    parser.add_argument("--stride", type=int, default=256)
    parser.add_argument("--demo", action="store_true")
    args = parser.parse_args()

    if args.demo:
        tok = OpcodeTokenizer()
        demo = Path("programs/hello.asm").read_text()
        ids = tok.encode(demo)
        print(f"hello.asm -> {len(ids)} tokens")
        print("\nWith placeholders:")
        print(tok.decode_with_placeholders(ids[:40]))
        print("\nReadable decode:")
        print(tok.decode(ids[:40]))
    else:
        build_dataset(args.programs_dir, args.output, args.context_len, args.stride)
