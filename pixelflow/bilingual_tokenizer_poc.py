#!/usr/bin/env python3
"""
Bilingual Tokenizer Proof-of-Concept for Geometry OS.

Combines Atomic Opcodes with a BPE Text Vocabulary.
This is the bridge required for "Geometric RAG".
"""

import json
from tokenizers import Tokenizer, models, trainers, pre_tokenizers
from opcode_tokenizer import OpcodeTokenizer, SPECIAL_NAMES, OPCODES, REGISTERS

class BilingualTokenizer:
    def __init__(self, text_vocab_size=2000):
        # 1. Initialize the Atomic Opcode part (Source of Truth)
        self.asm_tok = OpcodeTokenizer()
        self.opcode_count = self.asm_tok.vocab_size
        
        # 2. Setup the BPE Text part
        # We start the BPE indices AFTER the ASM tokens to avoid collisions
        self.text_tok = Tokenizer(models.BPE(unk_token="<UNK>"))
        self.text_tok.pre_tokenizer = pre_tokenizers.Whitespace()
        
        self.text_vocab_size = text_vocab_size
        self.offset = self.opcode_count + 10 # Buffer for future opcodes
        
    def train_text_only(self, files):
        """Train the BPE model on our research docs."""
        trainer = trainers.BpeTrainer(
            vocab_size=self.text_vocab_size,
            special_tokens=["<UNK>", "<PAD>", "<BOS>", "<EOS>"]
        )
        self.text_tok.train(files, trainer)
        
    def encode(self, text):
        """
        Bilingual Encoding:
        - If the line is code (starts with opcode/label), use ASM tokenizer.
        - If the line is a comment or prose, use BPE tokenizer + Offset.
        """
        lines = text.split('\n')
        encoded = []
        for line in lines:
            trimmed = line.strip()
            if not trimmed: continue
            
            # Simple heuristic: if it starts with ; it's text
            if trimmed.startswith(';'):
                # Extract text after ;
                comment_text = trimmed[1:].strip()
                # Encode with BPE and add offset
                bpe_ids = self.text_tok.encode(comment_text).ids
                # We use a special marker to indicate 'Text Mode' if needed, 
                # but for now just offset them.
                encoded.extend([id + self.offset for id in bpe_ids])
            else:
                # ASM Mode
                encoded.extend(self.asm_tok.encode(line, add_bos=False, add_eos=False))
        return encoded

    def save(self, path):
        # Save combined state
        pass

def demo():
    # Mock some research text
    docs = [
        "The RECTF opcode fills a rectangle in the framebuffer.",
        "It takes 5 arguments: x, y, width, height, and color.",
        "Use r0-r31 for register operations."
    ]
    with open("temp_docs.txt", "w") as f:
        f.write("\n".join(docs))
        
    bt = BilingualTokenizer()
    bt.train_text_only(["temp_docs.txt"])
    
    print(f"ASM Vocab Size: {bt.opcode_count}")
    print(f"Text Offset: {bt.offset}")
    
    # Encode a "Paired" snippet
    sample = """
    ; The RECTF opcode fills a rectangle
    RECTF 10, 10, 64, 64, 0xFF0000
    HALT
    """
    ids = bt.encode(sample)
    print(f"Encoded IDs: {ids}")
    
    # Cleanup
    import os
    os.remove("temp_docs.txt")

if __name__ == "__main__":
    demo()
