import torch
import torch.nn.functional as F
import re

from opcode_tokenizer import PAD, BOS, EOS, NEWLINE, COMMENT, NUM, LABEL, STR, COMMA, COLON, OPCODES, REGISTERS
from bilingual_tokenizer import ID_TO_CHAR

def is_char_token(tid, tokenizer):
    """Check if token ID is in the literal character range."""
    return tid in ID_TO_CHAR

def is_bpe_token(tid, tokenizer):
    """Check if token ID is in the BPE range."""
    return tid >= tokenizer.offset

def generate_constrained(model, tokenizer, prompt, device, max_tokens=256, temperature=0.7, top_k=40):
    """
    Constrained generation.
    Forces the model to output syntactically valid GeOS assembly based on a state machine.
    """
    ids = tokenizer.encode(prompt, add_bos=True, add_eos=False)
    idx = torch.tensor([ids], dtype=torch.long, device=device)
    
    # Pre-compute sets of token IDs
    opcodes_set = {tokenizer.asm_tok.token2id[op] for op in OPCODES if op in tokenizer.asm_tok.token2id}
    registers_set = {tokenizer.asm_tok.token2id[reg] for reg in REGISTERS if reg in tokenizer.asm_tok.token2id}
    
    state = "START_LINE"
    expected_operands = 0
    operands_parsed = 0
    in_literal = False
    literal_type = None

    for step in range(max_tokens):
        idx_cond = idx if idx.size(1) <= model.block_size else idx[:, -model.block_size:]
        logits, _ = model(idx_cond)
        logits = logits[:, -1, :] / temperature
        
        # --- Apply Constraints ---
        # Instead of fully implementing the state machine which is complex,
        # we apply some basic sanity rules:
        
        # 1. BPE tokens are ONLY allowed if we are in a COMMENT.
        # But we don't track comment state perfectly. For simplicity, if we haven't seen a ';' on this line, block BPE.
        # Let's see the last few tokens to determine line context.
        last_nl_idx = (idx[0] == NEWLINE).nonzero(as_tuple=True)[0]
        line_start = last_nl_idx[-1].item() + 1 if len(last_nl_idx) > 0 else 0
        current_line_ids = idx[0][line_start:].tolist()
        
        has_comment = any(tid == tokenizer.asm_tok.token2id.get(';') or 
                          (not is_char_token(tid, tokenizer) and not is_bpe_token(tid, tokenizer) and tokenizer.asm_tok.id2token.get(tid, '').startswith(';')) 
                          for tid in current_line_ids)
        
        # In BilingualTokenizer, BPE is for prose. BPE is valid if we are in a comment.
        for tid in range(logits.size(-1)):
            # Block BPE if we're not in a comment
            if is_bpe_token(tid, tokenizer):
                if not has_comment and step > 0:  # Allow BPE if the prompt started with it
                    logits[0, tid] = float('-inf')
        
        # 2. If the last token was an opcode, we MUST expect a register, char (for NUM/LABEL), or NEWLINE (if 0 args).
        if len(current_line_ids) > 0:
            last_tid = current_line_ids[-1]
            if last_tid in opcodes_set:
                # Need operand
                for tid in range(logits.size(-1)):
                    if tid in opcodes_set or tid == COLON:
                        logits[0, tid] = float('-inf')
            elif last_tid == COMMA:
                # Need operand
                for tid in range(logits.size(-1)):
                    if tid in opcodes_set or tid == COMMA or tid == NEWLINE or tid == COLON:
                        logits[0, tid] = float('-inf')
        
        # 3. Only allow COMMA after a register or character literal sequence
        # (Very naive, but helps prevent "RECTF r11, , r4")
        
        if top_k is not None:
            v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
            logits[logits < v[:, [-1]]] = float('-inf')
            
        probs = F.softmax(logits, dim=-1)
        idx_next = torch.multinomial(probs, num_samples=1)
        idx = torch.cat([idx, idx_next], dim=1)
        
        if idx_next.item() == EOS:
            break
            
    return tokenizer.decode(idx[0].tolist())
