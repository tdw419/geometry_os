import torch
import torch.nn.functional as F
from opcode_tokenizer import OPCODES, REGISTERS, COMMA, NEWLINE, EOS, BOS, NUM, LABEL, STR, COMMENT

# Define operand counts for common GeOS opcodes
# (Opcode) -> (Number of Operands)
ISA_SIGNATURES = {
    "LDI": 2,    # LDI reg, imm
    "LD": 2,     # LD reg, reg
    "STORE": 2,  # STORE reg, reg
    "ADD": 2,    # ADD reg, reg
    "SUB": 2,    # SUB reg, reg
    "MUL": 2,    # MUL reg, reg
    "DIV": 2,    # DIV reg, reg
    "AND": 2,    # AND reg, reg
    "OR": 2,     # OR reg, reg
    "XOR": 2,    # XOR reg, reg
    "RECTF": 5,  # RECTF x, y, w, h, color
    "CIRCLE": 4, # CIRCLE x, y, r, color
    "LINE": 5,   # LINE x1, y1, x2, y2, color
    "PSET": 3,   # PSET x, y, color
    "FILL": 1,   # FILL color
    "JMP": 1,    # JMP label
    "JZ": 2,     # JZ reg, label
    "JNZ": 2,    # JNZ reg, label
    "BLT": 3,    # BLT r1, r2, label
    "HALT": 0,
    "FRAME": 0,
    "CALL": 1,
    "RET": 0,
    "PUSH": 1,
    "POP": 1,
}

class ISAConstraintEngine:
    def __init__(self, tokenizer):
        self.tokenizer = tokenizer
        # Map opcodes to their IDs
        self.opcodes_id = {}
        for op in ISA_SIGNATURES.keys():
            if op in tokenizer.asm_tok.token2id:
                self.opcodes_id[op] = tokenizer.asm_tok.token2id[op]
        
        self.id_to_op = {v: k for k, v in self.opcodes_id.items()}
        self.registers_id = {tokenizer.asm_tok.token2id[reg] for reg in REGISTERS if reg in tokenizer.asm_tok.token2id}
        
        # ID space info (from bilingual_tokenizer.py)
        # IDs 270-333 are characters. 334 is SPACE_TOKEN. 339+ is BPE.
        self.char_range = range(270, 334) 
        self.bpe_start = tokenizer.offset
        
        # State
        self.current_opcode = None
        self.operands_needed = 0
        self.operands_seen = 0
        self.expecting_comma = False
        self.in_comment = False
        self.in_literal = False
        self.literal_len = 0
        self.max_literal_len = 12

    def update_state(self, last_token_id):
        # NEWLINE or BOS resets the line state
        if last_token_id == NEWLINE or last_token_id == BOS:
            self.current_opcode = None
            self.operands_needed = 0
            self.operands_seen = 0
            self.expecting_comma = False
            self.in_comment = False
            self.in_literal = False
            self.literal_len = 0
            return

        # Check for start of comment
        if not self.in_comment:
            if last_token_id == COMMENT:
                self.in_comment = True
                return

        if self.in_comment:
            return

        # Opcode detection
        if last_token_id in self.id_to_op:
            self.current_opcode = self.id_to_op[last_token_id]
            self.operands_needed = ISA_SIGNATURES[self.current_opcode]
            self.operands_seen = 0
            self.expecting_comma = False
            self.in_literal = False
            self.literal_len = 0
            return

        # Comma detection
        if last_token_id == COMMA:
            self.expecting_comma = False
            self.in_literal = False
            self.literal_len = 0
            return

        # Operand detection
        if last_token_id in self.registers_id:
            self.operands_seen += 1
            if self.operands_seen < self.operands_needed:
                self.expecting_comma = True
            self.in_literal = False
            self.literal_len = 0
            return

        if last_token_id in self.char_range:
            if not self.in_literal:
                self.in_literal = True
                self.operands_seen += 1
                self.literal_len = 1
            else:
                self.literal_len += 1
            return
        else:
            if self.in_literal:
                self.in_literal = False
                self.literal_len = 0
                if self.operands_seen < self.operands_needed:
                    self.expecting_comma = True

    def apply_constraints(self, logits):
        """Mask logits based on current ISA state."""
        # 1. Start of line: Expect Opcode, Comment, or Label (Chars)
        if self.current_opcode is None and not self.in_comment:
            mask = torch.zeros_like(logits)
            # Allow Opcodes
            for op_id in self.opcodes_id.values(): mask[op_id] = 1.0
            # Allow Chars (for labels)
            for cid in self.char_range: mask[cid] = 1.0
            # Allow Comment/Newline/EOS
            mask[COMMENT] = 1.0
            mask[NEWLINE] = 1.0
            mask[EOS] = 1.0
            # Block BPE (must start with ;)
            logits[mask == 0] = float('-inf')
            return logits

        # 2. In Comment: Allow BPE, Newline, EOS
        if self.in_comment:
            mask = torch.zeros_like(logits)
            mask[self.bpe_start:] = 1.0
            mask[NEWLINE] = 1.0
            mask[EOS] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        # 3. Mid-literal: Allow more chars OR transition to comma/newline
        if self.in_literal:
            mask = torch.zeros_like(logits)
            
            # Only allow more chars if we haven't hit the limit
            if self.literal_len < self.max_literal_len:
                for cid in self.char_range: mask[cid] = 1.0
            
            # Allow transition out (comma if more operands, else newline)
            if self.operands_seen < self.operands_needed:
                mask[COMMA] = 1.0
            else:
                mask[NEWLINE] = 1.0
                mask[EOS] = 1.0
            
            logits[mask == 0] = float('-inf')
            return logits

        # 4. Expecting Comma
        if self.expecting_comma:
            mask = torch.zeros_like(logits)
            mask[COMMA] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        # 5. Expecting Operand (Reg or Char-start)
        if self.operands_seen < self.operands_needed:
            mask = torch.zeros_like(logits)
            for rid in self.registers_id: mask[rid] = 1.0
            for cid in self.char_range: mask[cid] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        # 6. Expecting End of Line
        mask = torch.zeros_like(logits)
        mask[NEWLINE] = 1.0
        mask[EOS] = 1.0
        mask[COMMENT] = 1.0
        logits[mask == 0] = float('-inf')
        return logits

def generate_isa_constrained(model, tokenizer, prompt, device, max_tokens=256, temperature=0.7, top_k=40):
    ids = tokenizer.encode(prompt, add_bos=True, add_eos=False)
    idx = torch.tensor([ids], dtype=torch.long, device=device)
    engine = ISAConstraintEngine(tokenizer)
    
    # Init engine state from prompt
    for tid in ids:
        engine.update_state(tid)

    for _ in range(max_tokens):
        idx_cond = idx if idx.size(1) <= model.block_size else idx[:, -model.block_size:]
        logits, _ = model(idx_cond)
        logits = logits[:, -1, :] / temperature
        
        # Apply constraints
        logits = engine.apply_constraints(logits[0]).unsqueeze(0)
        
        if top_k is not None:
            v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
            logits[logits < v[:, [-1]]] = float('-inf')
            
        probs = F.softmax(logits, dim=-1)
        idx_next = torch.multinomial(probs, num_samples=1)
        
        engine.update_state(idx_next.item())
        idx = torch.cat([idx, idx_next], dim=1)
        
        if idx_next.item() == EOS:
            break
            
    return tokenizer.decode(idx[0].tolist())
