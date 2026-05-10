import torch
import torch.nn.functional as F
import re
from opcode_tokenizer import OPCODES, REGISTERS, COMMA, NEWLINE, EOS, BOS, NUM, LABEL, STR, COMMENT
from bilingual_tokenizer import ID_TO_CHAR, CHAR_TO_ID

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
    "BLT": 2,    # BLT reg, label (reg ignored, checks r0)
    "BGE": 2,    # BGE reg, label (reg ignored, checks r0)
    "CMP": 2,    # CMP rd, rs (sets r0 = flag)
    "HALT": 0,
    "FRAME": 0,
    "CALL": 1,
    "RET": 0,
    "PUSH": 1,
    "POP": 1,
}

# Define operand types for opcodes
# R: register, I: immediate (literal), L: label (char sequence), *: any
# R_<meaning>: semantic register tag for StructuralConstraintEngine
ISA_GRAMMAR = {
    "LDI": ["R", "I"],
    "LD": ["R", "R"],
    "STORE": ["R", "R"],
    "ADD": ["R", "R"],
    "SUB": ["R", "R"],
    "MUL": ["R", "R"],
    "DIV": ["R", "R"],
    "AND": ["R", "R"],
    "OR": ["R", "R"],
    "XOR": ["R", "R"],
    "RECTF": ["R_X", "R_Y", "R_WIDTH", "R_HEIGHT", "R_COLOR"],
    "CIRCLE": ["R_X", "R_Y", "R_RADIUS", "R_COLOR"],
    "LINE": ["R_X1", "R_Y1", "R_X2", "R_Y2", "R_COLOR"],
    "PSET": ["R_X", "R_Y", "R_COLOR"],
    "FILL": ["R_COLOR"],
    "JMP": ["L"],
    "JZ": ["R", "L"],
    "JNZ": ["R", "L"],
    "BLT": ["R", "L"],
    "BGE": ["R", "L"],
    "CMP": ["R", "R"],
    "HALT": [],
    "FRAME": [],
    "CALL": ["L"],
    "RET": [],
    "PUSH": ["R"],
    "POP": ["R"],
}

class ISAConstraintEngine:
    def __init__(self, tokenizer):
        self.tokenizer = tokenizer
        self.opcodes_id = {}
        for op in ISA_GRAMMAR.keys():
            if op in tokenizer.asm_tok.token2id:
                self.opcodes_id[op] = tokenizer.asm_tok.token2id[op]
        
        self.id_to_op = {v: k for k, v in self.opcodes_id.items()}
        self.registers_id = {tokenizer.asm_tok.token2id[reg] for reg in REGISTERS if reg in tokenizer.asm_tok.token2id}
        
        self.char_range = range(270, 334) 
        self.bpe_start = tokenizer.offset
        
        # Hex/Decimal allowed chars
        self.hex_chars = set("0123456789ABCDEFabcdefx")
        self.id_to_char = ID_TO_CHAR
        
        # State
        self.current_opcode = None
        self.expected_types = []
        self.operands_seen = 0
        self.expecting_comma = False
        self.in_comment = False
        self.in_literal = False
        self.literal_text = ""
        self.max_literal_len = 12

    def update_state(self, last_token_id):
        if last_token_id == NEWLINE or last_token_id == BOS:
            self.current_opcode = None
            self.expected_types = []
            self.operands_seen = 0
            self.expecting_comma = False
            self.in_comment = False
            self.in_literal = False
            self.literal_text = ""
            return

        if not self.in_comment:
            if last_token_id == COMMENT or last_token_id >= self.bpe_start:
                self.in_comment = True
                return

        if self.in_comment:
            return

        # Opcode detection
        if last_token_id in self.id_to_op:
            self.current_opcode = self.id_to_op[last_token_id]
            self.expected_types = ISA_GRAMMAR[self.current_opcode]
            self.operands_seen = 0
            self.expecting_comma = False
            self.in_literal = False
            return

        # Comma detection
        if last_token_id == COMMA:
            self.expecting_comma = False
            self.in_literal = False
            self.literal_text = ""
            return

        # Operand detection
        if last_token_id in self.registers_id:
            self.operands_seen += 1
            if self.operands_seen < len(self.expected_types):
                self.expecting_comma = True
            self.in_literal = False
            return

        if last_token_id in self.char_range:
            if not self.in_literal:
                self.in_literal = True
                self.operands_seen += 1
                self.literal_text = self.id_to_char.get(last_token_id, "")
            else:
                self.literal_text += self.id_to_char.get(last_token_id, "")
            return
        else:
            if self.in_literal:
                self.in_literal = False
                if self.operands_seen < len(self.expected_types):
                    self.expecting_comma = True

    def apply_constraints(self, logits):
        """Mask logits based on current ISA grammar state."""
        if self.current_opcode is None and not self.in_comment:
            mask = torch.zeros_like(logits)
            for op_id in self.opcodes_id.values(): mask[op_id] = 1.0
            mask[COMMENT] = 1.0
            mask[NEWLINE] = 1.0
            mask[EOS] = 1.0
            # Allow BPE at start of line (for comments)
            mask[self.bpe_start:] = 1.0

            # Label chars: only allow lowercase start to prevent spelling fake opcodes
            # Once in a label (in_literal), allow continuation chars + force colon at max length
            if self.in_literal:
                label_len = len(self.literal_text)
                # Find colon ID
                colon_id = None
                for cid in self.char_range:
                    if self.id_to_char.get(cid, "") == ":":
                        colon_id = cid
                        break
                if label_len >= 8:
                    # Force colon to terminate long labels
                    for cid in self.char_range: pass  # skip
                    if colon_id is not None:
                        mask[colon_id] = 1.0
                    # Block BPE to prevent escaping without colon
                    mask[self.bpe_start:] = 0.0
                else:
                    # Allow lowercase, digits, underscore (label chars)
                    for cid in self.char_range:
                        ch = self.id_to_char.get(cid, "")
                        if ch.isupper():
                            mask[cid] = 0.0  # Block uppercase in labels
                    if colon_id is not None:
                        mask[colon_id] = 1.0
            else:
                # Start of line: allow lowercase chars to begin a label
                for cid in self.char_range:
                    ch = self.id_to_char.get(cid, "")
                    if ch.isupper():
                        mask[cid] = 0.0  # Don't start labels with uppercase

            logits[mask == 0] = float('-inf')
            return logits

        if self.in_comment:
            mask = torch.zeros_like(logits)
            mask[self.bpe_start:] = 1.0
            mask[NEWLINE] = 1.0
            mask[EOS] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        if self.in_literal:
            mask = torch.zeros_like(logits)
            # If current type is Immediate (I), restrict chars to hex/dec
            curr_type = self.expected_types[self.operands_seen-1] if self.operands_seen <= len(self.expected_types) else "*"
            
            if len(self.literal_text) < self.max_literal_len:
                for cid in self.char_range:
                    char = self.id_to_char.get(cid, "")
                    if curr_type == "I":
                        # Logic for hex literals (0x...)
                        if char == "x":
                            if self.literal_text == "0": mask[cid] = 1.0
                        elif char in "0123456789ABCDEFabcdef":
                            # Don't allow leading zeros unless followed by x
                            if self.literal_text == "0":
                                mask[cid] = 0.0 # Force 'x' or delimiter
                            else:
                                mask[cid] = 1.0
                    else:
                        mask[cid] = 1.0 # Labels can be anything
            
            if self.operands_seen < len(self.expected_types):
                mask[COMMA] = 1.0
            else:
                mask[NEWLINE] = 1.0
                mask[EOS] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        if self.expecting_comma:
            mask = torch.zeros_like(logits)
            mask[COMMA] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        if self.operands_seen < len(self.expected_types):
            target_type = self.expected_types[self.operands_seen]
            mask = torch.zeros_like(logits)
            if target_type.startswith("R"): # Matches R and R_<meaning>
                for rid in self.registers_id: mask[rid] = 1.0
            elif target_type in ["I", "L"]:
                for cid in self.char_range:
                    char = self.id_to_char.get(cid, "")
                    if target_type == "I":
                        if char in self.hex_chars: mask[cid] = 1.0
                    else:
                        mask[cid] = 1.0
            logits[mask == 0] = float('-inf')
            return logits

        mask = torch.zeros_like(logits)
        mask[NEWLINE] = 1.0
        mask[EOS] = 1.0
        mask[COMMENT] = 1.0
        logits[mask == 0] = float('-inf')
        return logits

class StructuralConstraintEngine(ISAConstraintEngine):
    """
    Advanced constraint engine that enforces consistency between the self-generated
    '; PLAN:' comment and the subsequent assembly instructions.
    """
    def __init__(self, tokenizer):
        super().__init__(tokenizer)
        self.plan_val_map = {}  # reg_id -> target_value_str
        self.plan_meaning_map = {} # meaning_str -> reg_id
        self.plan_opcode = None   # forced opcode from PLAN's Op: field
        self.last_reg_id = None
        self.is_plan_comment = False
        self.plan_buffer = ""
        self.offset = tokenizer.offset

    def update_state(self, last_token_id):
        # 1. Track PLAN in comments
        if last_token_id == NEWLINE:
            self.is_plan_comment = False
            self.plan_buffer = ""
        
        if last_token_id == COMMENT or last_token_id >= self.offset:
            if not self.in_comment:
                # Potential start of a new comment line
                self.is_plan_comment = True
                self.plan_buffer = ""
            
            if self.is_plan_comment and last_token_id >= self.offset:
                # Decode the BPE token to see if it contains PLAN info
                text = self.tokenizer.text_tok.decode([last_token_id - self.offset])
                self.plan_buffer += text
                if "; PLAN:" in self.plan_buffer:
                    self._parse_plan(self.plan_buffer)

        # 2. Track last register for LDI context
        if last_token_id in self.registers_id:
            self.last_reg_id = last_token_id
        
        super().update_state(last_token_id)

    def _parse_plan(self, text):
        """Extract r0=128(x) style assignments and Op: from the PLAN comment."""
        # Regex: r(digit)=(anything up to '(') then (meaning up to ')')
        matches = re.finditer(r'(r\d+)=(\S+?)\((\w+?)\)', text)
        for m in matches:
            reg_name, val, meaning = m.groups()
            reg_id = self.tokenizer.asm_tok.token2id.get(reg_name)
            if reg_id:
                # Normalize value: hex 0x... or decimal
                norm_val = val.lower().replace('#', '0x')
                self.plan_val_map[reg_id] = norm_val
                self.plan_meaning_map[meaning.lower()] = reg_id
        
        # Extract Op: field if present (e.g. "Op: RECTF r0, r1, r2, r3, r4")
        op_match = re.search(r'Op:\s*(\w+)', text)
        if op_match:
            self.plan_opcode = op_match.group(1).upper()
        else:
            self.plan_opcode = None

    def apply_constraints(self, logits):
        """Mask logits based on both ISA grammar AND structural PLAN consistency."""
        # Apply base ISA constraints first
        logits = super().apply_constraints(logits)
        
        # Phase -1: Opcode Enforcement (force the opcode the PLAN declared)
        if self.current_opcode is None and not self.in_comment and self.plan_opcode:
            if self.plan_opcode in self.opcodes_id:
                target_op_id = self.opcodes_id[self.plan_opcode]
                # Only force if the target opcode is still valid (not already -inf)
                if logits[target_op_id] > float('-inf'):
                    mask = torch.zeros_like(logits)
                    mask[target_op_id] = 1.0
                    # Also allow starting a new comment line (DESCRIPTION, PLAN, etc.)
                    mask[COMMENT] = 1.0
                    mask[NEWLINE] = 1.0
                    mask[EOS] = 1.0
                    mask[self.bpe_start:] = 1.0
                    logits[mask == 0] = float('-inf')

        # Phase 0: LDI Register Enforcement
        if self.current_opcode == "LDI" and self.operands_seen == 0:
            if self.plan_val_map:
                mask = torch.zeros_like(logits)
                for rid in self.plan_val_map.keys():
                    mask[rid] = 1.0
                combined_mask = (mask == 1.0) & (logits > float('-inf'))
                if combined_mask.any():
                    logits[combined_mask == 0] = float('-inf')

        # Phase 1: Immediate Value Enforcement (LDI)
        if self.current_opcode == "LDI" and self.operands_seen == 1 and not self.expecting_comma:
            if self.last_reg_id in self.plan_val_map:
                target_val = self.plan_val_map[self.last_reg_id]
                current_lit = self.literal_text.lower().replace('#', '0x')
                
                if len(current_lit) < len(target_val):
                    next_char = target_val[len(current_lit)]
                    char_ids = [CHAR_TO_ID.get(next_char.lower()), CHAR_TO_ID.get(next_char.upper())]
                    char_ids = [cid for cid in char_ids if cid is not None]
                    
                    if char_ids:
                        mask = torch.zeros_like(logits)
                        for cid in char_ids: mask[cid] = 1.0
                        
                        # Aggressive enforcement
                        logits[mask == 0] = float('-inf')
                        if torch.isinf(logits).all():
                            for cid in char_ids: logits[cid] = 0.0
                else:
                    # Target reached. Force delimiter.
                    mask = torch.zeros_like(logits)
                    mask[COMMA] = 1.0; mask[NEWLINE] = 1.0; mask[EOS] = 1.0; mask[COMMENT] = 1.0
                    logits[mask == 0] = float('-inf')
                    if torch.isinf(logits).all():
                        logits[NEWLINE] = 0.0

        # Phase 2: Drawing Register Enforcement (Semantic roles)
        if self.operands_seen < len(self.expected_types) and not self.expecting_comma:
            target_type = self.expected_types[self.operands_seen]
            if target_type.startswith("R_"):
                meaning = target_type[2:].lower()
                if meaning in self.plan_meaning_map:
                    target_reg_id = self.plan_meaning_map[meaning]
                    # Force the register that the PLAN assigned to this role
                    mask = torch.zeros_like(logits)
                    mask[target_reg_id] = 1.0
                    logits[mask == 0] = float('-inf')
                    if torch.isinf(logits).all():
                        for rid in self.registers_id: logits[rid] = 0.0
        
        return logits

def generate_isa_constrained(model, tokenizer, prompt, device, max_tokens=256, temperature=0.7, top_k=40):
    ids = tokenizer.encode(prompt, add_bos=True, add_eos=False)
    idx = torch.tensor([ids], dtype=torch.long, device=device)
    
    # Use the upgraded StructuralConstraintEngine
    engine = StructuralConstraintEngine(tokenizer)
    
    # Init engine state from prompt
    for tid in ids:
        engine.update_state(tid)

    for _ in range(max_tokens):
        idx_cond = idx if idx.size(1) <= model.block_size else idx[:, -model.block_size:]
        logits, _ = model(idx_cond)
        logits = logits[:, -1, :] / temperature
        
        # Apply structural constraints
        logits = engine.apply_constraints(logits[0]).unsqueeze(0)
        
        if top_k is not None:
            v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
            logits[logits < v[:, [-1]]] = float('-inf')
            
        probs = F.softmax(logits, dim=-1)
        
        # Handle all-inf case (dead end in constraints)
        if torch.isinf(logits).all():
             # Fallback: force NEWLINE or EOS to escape
             idx_next = torch.tensor([[EOS]], device=device)
        else:
            idx_next = torch.multinomial(probs, num_samples=1)
        
        engine.update_state(idx_next.item())
        idx = torch.cat([idx, idx_next], dim=1)
        
        if idx_next.item() == EOS:
            break
            
    return tokenizer.decode(idx[0].tolist())
