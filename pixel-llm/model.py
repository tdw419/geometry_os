"""
Pixel LLM -- a tiny GPT that speaks glyph assembly.

Token vocabulary:
  - 16 opcodes (NOP=0, LDI=1, MOV=2, LOAD=3, STORE=4, ADD=5, SUB=6,
    MUL=7, DIV=8, JMP=9, BNE=10, CALL=11, RET=12, HALT=13, DRAW=215, SPAWN=230)
  - 8 register names (r0-r7)
  - Integer literals (0-255)
  - Special tokens: PAD, BOS, EOS, NEWLINE

The model operates on text representation of assembly programs:
  "LDI r0 0\nLDI r1 100\nLOAD r5 r0\nSTORE r1 r5\nHALT\n"

This keeps it simple -- predict next token, output valid assembly.
"""

import math
import torch
import torch.nn as nn
import torch.nn.functional as F


# ── Vocabulary ──────────────────────────────────────────────

# Opcodes
OPCODES = [
    'NOP', 'LDI', 'MOV', 'LOAD', 'STORE', 'ADD', 'SUB',
    'MUL', 'DIV', 'JMP', 'BNE', 'CALL', 'RET', 'HALT',
    'DRAW', 'SPAWN',
]
# Registers
REGS = [f'r{i}' for i in range(8)]
# Small integers (we encode these as individual tokens)
INTS = [str(i) for i in range(256)]
# Branch conditions
BCONDS = ['BEQ', 'BNE', 'BLT', 'BGE', 'BLTU', 'BGEU']
# Special
SPECIAL = ['<PAD>', '<BOS>', '<EOS>', '\n']

ALL_TOKENS = SPECIAL + OPCODES + REGS + BCONDS + INTS
TOKEN_TO_ID = {t: i for i, t in enumerate(ALL_TOKENS)}
ID_TO_TOKEN = {i: t for t, i in TOKEN_TO_ID.items()}
VOCAB_SIZE = len(ALL_TOKENS)

PAD_ID = TOKEN_TO_ID['<PAD>']
BOS_ID = TOKEN_TO_ID['<BOS>']
EOS_ID = TOKEN_TO_ID['<EOS>']
NEWLINE_ID = TOKEN_TO_ID['\n']


def encode(text: str) -> list[int]:
    """Tokenize assembly text into token IDs."""
    tokens = [BOS_ID]
    for line in text.strip().split('\n'):
        line = line.strip()
        if not line or line.startswith('//'):
            continue
        parts = line.split()
        for part in parts:
            part = part.rstrip(',')
            if part in TOKEN_TO_ID:
                tokens.append(TOKEN_TO_ID[part])
            elif part.lstrip('-').isdigit():
                val = int(part)
                if -128 <= val < 256:
                    tokens.append(TOKEN_TO_ID[str(val & 0xFF)])
        tokens.append(NEWLINE_ID)
    tokens.append(EOS_ID)
    return tokens


def decode(token_ids: list[int]) -> str:
    """Decode token IDs back to assembly text."""
    lines = []
    current_line = []
    for tid in token_ids:
        tok = ID_TO_TOKEN.get(tid, '<UNK>')
        if tok in ('<PAD>', '<BOS>'):
            continue
        if tok == '<EOS>':
            break
        if tok == '\n':
            if current_line:
                lines.append(' '.join(current_line))
                current_line = []
        else:
            current_line.append(tok)
    if current_line:
        lines.append(' '.join(current_line))
    return '\n'.join(lines)


# ── Model ───────────────────────────────────────────────────

class CausalSelfAttention(nn.Module):
    def __init__(self, d_model: int, n_heads: int, max_len: int = 512):
        super().__init__()
        assert d_model % n_heads == 0
        self.n_heads = n_heads
        self.head_dim = d_model // n_heads
        self.qkv = nn.Linear(d_model, 3 * d_model)
        self.proj = nn.Linear(d_model, d_model)
        self.register_buffer(
            "mask",
            torch.tril(torch.ones(max_len, max_len)).view(1, 1, max_len, max_len)
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        B, T, C = x.shape
        qkv = self.qkv(x).reshape(B, T, 3, self.n_heads, self.head_dim)
        q, k, v = qkv.unbind(dim=2)
        q = q.transpose(1, 2)  # (B, H, T, D)
        k = k.transpose(1, 2)
        v = v.transpose(1, 2)

        # Scaled dot-product attention with causal mask
        scale = self.head_dim ** -0.5
        attn = (q @ k.transpose(-2, -1)) * scale
        attn = attn.masked_fill(self.mask[:, :, :T, :T] == 0, float('-inf'))
        attn = F.softmax(attn, dim=-1)

        out = (attn @ v).transpose(1, 2).reshape(B, T, C)
        return self.proj(out)


class TransformerBlock(nn.Module):
    def __init__(self, d_model: int, n_heads: int, max_len: int = 512):
        super().__init__()
        self.ln1 = nn.LayerNorm(d_model)
        self.attn = CausalSelfAttention(d_model, n_heads, max_len)
        self.ln2 = nn.LayerNorm(d_model)
        self.mlp = nn.Sequential(
            nn.Linear(d_model, 4 * d_model),
            nn.GELU(),
            nn.Linear(4 * d_model, d_model),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        x = x + self.attn(self.ln1(x))
        x = x + self.mlp(self.ln2(x))
        return x


class PixelGPT(nn.Module):
    """
    A tiny GPT for generating glyph assembly programs.

    Configurable size:
      - nano:   d=64,  h=2,  l=4   (~50K params)   -- trains in seconds
      - micro:  d=128, h=4,  l=4   (~300K params)   -- trains in minutes
      - small:  d=256, h=4,  l=6   (~2M params)     -- real capacity
    """

    CONFIGS = {
        'nano':  {'d_model': 64,  'n_heads': 2, 'n_layers': 4},
        'micro': {'d_model': 128, 'n_heads': 4, 'n_layers': 4},
        'small': {'d_model': 256, 'n_heads': 4, 'n_layers': 6},
    }

    def __init__(self, config: str = 'nano', max_len: int = 512):
        super().__init__()
        cfg = self.CONFIGS[config]
        self.d_model = cfg['d_model']
        self.max_len = max_len

        self.token_emb = nn.Embedding(VOCAB_SIZE, cfg['d_model'])
        self.pos_emb = nn.Embedding(max_len, cfg['d_model'])
        self.blocks = nn.Sequential(*[
            TransformerBlock(cfg['d_model'], cfg['n_heads'], max_len)
            for _ in range(cfg['n_layers'])
        ])
        self.ln_f = nn.LayerNorm(cfg['d_model'])
        self.head = nn.Linear(cfg['d_model'], VOCAB_SIZE, bias=False)

        # Weight tying
        self.head.weight = self.token_emb.weight

        self.apply(self._init_weights)
        n_params = sum(p.numel() for p in self.parameters())
        print(f"PixelGPT ({config}): {n_params:,} parameters")

    def _init_weights(self, module):
        if isinstance(module, nn.Linear):
            nn.init.normal_(module.weight, mean=0.0, std=0.02)
            if module.bias is not None:
                nn.init.zeros_(module.bias)
        elif isinstance(module, nn.Embedding):
            nn.init.normal_(module.weight, mean=0.0, std=0.02)

    def forward(self, idx: torch.Tensor, targets=None):
        """
        idx: (B, T) token IDs
        targets: (B, T) target token IDs for cross-entropy loss
        Returns: logits (B, T, V), loss (optional)
        """
        B, T = idx.shape
        assert T <= self.max_len

        pos = torch.arange(T, device=idx.device).unsqueeze(0)  # (1, T)
        x = self.token_emb(idx) + self.pos_emb(pos)
        x = self.blocks(x)
        x = self.ln_f(x)
        logits = self.head(x)  # (B, T, V)

        loss = None
        if targets is not None:
            loss = F.cross_entropy(
                logits.view(-1, VOCAB_SIZE),
                targets.view(-1),
                ignore_index=PAD_ID,
            )

        return logits, loss

    @torch.no_grad()
    def generate(self, idx: torch.Tensor, max_new: int = 64,
                 temperature: float = 0.8, top_k: int = 40) -> torch.Tensor:
        """Autoregressive generation with top-k sampling."""
        self.eval()
        for _ in range(max_new):
            # Crop to max_len
            idx_cond = idx[:, -self.max_len:]
            logits, _ = self(idx_cond)
            logits = logits[:, -1, :] / temperature

            # Top-k filtering
            if top_k > 0:
                v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
                logits[logits < v[:, [-1]]] = float('-inf')

            probs = F.softmax(logits, dim=-1)
            next_token = torch.multinomial(probs, num_samples=1)
            idx = torch.cat([idx, next_token], dim=1)

            # Stop on EOS
            if next_token.item() == EOS_ID:
                break

        return idx

    def count_parameters(self) -> int:
        return sum(p.numel() for p in self.parameters())
