#!/usr/bin/env python3
"""
RISC-V Morphological Encoder
Encodes RISC-V binaries into geometric glyph sequences for Geometry OS.

Maps RISC-V opcode categories to the Morphological Synthesizer's 95-character charset.
Resulting .rts.png files look like "Geometric Poetry" but are executable by visual_cpu_riscv.wgsl.
"""

import sys
import struct
import json
import argparse
from pathlib import Path
from typing import List, Dict, Tuple

# Add systems to path for core imports
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent / "systems/pixel_compiler"))
from pixelrts_v2_core import PixelRTSEncoder, calculate_grid_size

# Morphological Charset from V2
CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"

# RISC-V Opcode to Char Mapping
OPCODE_MAP = {
    0x37: 'U', # LUI
    0x17: 'A', # AUIPC
    0x6F: 'J', # JAL
    0x67: 'R', # JALR
    0x63: 'B', # BRANCH
    0x03: 'L', # LOAD
    0x23: 'S', # STORE
    0x13: 'i', # OP-IMM
    0x33: 'a', # OP
    0x0F: 'F', # FENCE
    0x73: '!', # SYSTEM
}

def get_instruction_category_char(instr_u32: int) -> str:
    """Map a 32-bit RISC-V instruction to a semantic character."""
    opcode = instr_u32 & 0x7F
    
    # Base category mapping
    char = OPCODE_MAP.get(opcode, '?')
    
    # Refine based on funct3 for some categories
    if opcode == 0x63: # Branch
        funct3 = (instr_u32 >> 12) & 0x7
        branch_chars = ['=', '!', '<', '>', '{', '}', '[', ']']
        char = branch_chars[funct3] if funct3 < len(branch_chars) else 'B'
    elif opcode == 0x13: # OP-IMM
        funct3 = (instr_u32 >> 12) & 0x7
        imm_chars = ['+', 's', '<', '?', '^', '>', '|', '&']
        char = imm_chars[funct3] if funct3 < len(imm_chars) else 'i'
    elif opcode == 0x33: # OP
        funct3 = (instr_u32 >> 12) & 0x7
        op_chars = ['+', 's', '<', '>', '^', '>', '|', '&']
        char = op_chars[funct3] if funct3 < len(op_chars) else 'a'
        
    return char

class RISCVMorphologicalEncoder:
    def __init__(self, use_unique_tokens=True):
        self.use_unique_tokens = use_unique_tokens
        self.dictionary: Dict[int, int] = {} # TokenID -> RISC-V u32
        self.reverse_dict: Dict[int, int] = {} # RISC-V u32 -> TokenID
        self.next_token_id = 1
        
    def encode_instruction(self, instr_u32: int) -> Tuple[int, str]:
        """Returns (TokenID, Char)."""
        char = get_instruction_category_char(instr_u32)
        
        if self.use_unique_tokens:
            if instr_u32 in self.reverse_dict:
                return self.reverse_dict[instr_u32], char
            
            token_id = self.next_token_id
            self.next_token_id += 1
            
            self.dictionary[token_id] = instr_u32
            self.reverse_dict[instr_u32] = token_id
            return token_id, char
        else:
            # Simple mode: TokenID is just the ASCII index of the category char
            token_id = CHARSET.find(char)
            if token_id == -1: token_id = 0
            return token_id, char

    def encode(self, input_path: str, output_path: str):
        input_path = Path(input_path)
        with open(input_path, 'rb') as f:
            data = f.read()
            
        print(f"Processing {input_path} ({len(data)} bytes)...")
        
        tokens = []
        chars = []
        for i in range(0, len(data), 4):
            chunk = data[i:i+4]
            if len(chunk) < 4: chunk = chunk.ljust(4, b'\x00')
            instr = struct.unpack("<I", chunk)[0]
            token_id, char = self.encode_instruction(instr)
            tokens.append(token_id)
            chars.append(char)
            
        # Create pixel data
        # We store TokenID in RGB. 
        # If we want the output to BE the morphological font, 
        # we actually need to store the CHARSET index in the R channel
        # so the JS side can use the MorphologicalSynthesizer.
        pixel_data = bytearray()
        for i in range(len(tokens)):
            token_id = tokens[i]
            char = chars[i]
            char_idx = CHARSET.find(char)
            if char_idx == -1: char_idx = 0
            
            # R = Char Index (for visual morphological rendering)
            # G, B = TokenID high/low (for execution lookup)
            r = char_idx
            g = (token_id >> 8) & 0xFF
            b = token_id & 0xFF
            a = 0xFF # Executable mask
            
            pixel_data.extend([r, g, b, a])
            
        # Use PixelRTSEncoder for Hilbert layout
        encoder = PixelRTSEncoder(mode="standard")
        grid_size = calculate_grid_size(len(pixel_data))
        png_bytes = encoder.encode(bytes(pixel_data), grid_size=grid_size)
        
        with open(output_path, 'wb') as f:
            f.write(png_bytes)
            
        # Export Metadata for WebGPUSemanticManager
        instruction_list = [0] * (self.next_token_id)
        for tid, instr in self.dictionary.items():
            instruction_list[tid] = instr
            
        metadata = {
            "format": "PixelRTS-2.0",
            "type": "riscv-morphological",
            "name": input_path.stem,
            "grid_size": grid_size,
            "data_size": len(data),
            "instruction_count": len(tokens),
            "dictionary": {
                "instructions": instruction_list,
                "format": "direct-lookup",
                "charset": CHARSET
            }
        }
        
        meta_path = output_path + ".meta.json"
        with open(meta_path, "w") as f:
            json.dump(metadata, f, indent=2)
            
        print(f"Successfully encoded to {output_path}")
        print(f"Visual Charset Mapping: {''.join(sorted(list(set(chars))))}")
        print(f"Unique Instructions: {len(self.dictionary)}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="RISC-V Morphological Encoder")
    parser.add_argument("input", help="Input RISC-V binary")
    parser.add_argument("output", help="Output .rts.png")
    args = parser.parse_args()
    
    encoder = RISCVMorphologicalEncoder()
    encoder.encode(args.input, args.output)
