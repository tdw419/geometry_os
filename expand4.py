"""
Pixelpack Phase 4 - Boot Pixel Architecture

Introduces the compute/display split. Boot pixels configure decoder state
without producing output bytes. Display pixels expand using configured state.

Boot pixel bit layout (strategy 0xF when in boot mode):
  [TTTT] [OOOO] [OOOO] [PPPPPPPPPPPPPPPPPPPPPPPP]
  0xF     opcode sub    24-bit payload

Boot mode is indicated by PNG metadata flag t6mode=1.
Boot pixels execute sequentially until BOOT_END is encountered.
After BOOT_END, remaining pixels are display pixels.

Backward compatibility: PNGs without t6mode decode via V3 path.

Phase 6a opcodes:
  0x0F: BOOT_END      -- end boot section, begin display
  0x3F: SET_PROFILE   -- load preset encoding configuration

Phase 6b opcodes:
  0x5F: SET_BPE_TABLE -- PRNG seed generates custom 127-entry byte-pair table
"""

from dataclasses import dataclass, field
from expand import expand as expand_v1, seed_from_rgba, seed_to_rgba
from expand2 import expand_multi, expand_from_png, extract_seeds_from_png
from expand3 import (
    ExpandContext, expand_with_context, expand_multi_v3, expand_from_png_v3,
    _read_text_chunk,
)


# ============================================================
# Boot Context
# ============================================================

# Preset profiles -- configurations that tune decoder behavior
PROFILES = {
    0: {},  # Profile 0: default (no modifications)
    1: {'xor_mode': True},  # Profile 1: enable XOR channel
    # Future profiles can define custom BPE tables, strategy remaps, etc.
}


@dataclass
class BootContext:
    """Configuration state built by boot pixels."""
    profile_id: int = 0
    xor_mode: bool = False
    custom_bpe_table: list = None  # placeholder for phase 6b
    strategy_remap: dict = field(default_factory=dict)  # placeholder

    def apply_profile(self, profile_id: int):
        """Load a preset profile. Resets to defaults then applies profile."""
        self.profile_id = profile_id
        # Reset to defaults first
        self.xor_mode = False
        # Apply profile overrides
        profile = PROFILES.get(profile_id, {})
        if 'xor_mode' in profile:
            self.xor_mode = profile['xor_mode']


# ============================================================
# Boot Instruction Decoder
# ============================================================

BOOT_END = 0x0       # opcode 0
BOOT_SET_PROFILE = 0x3  # opcode 3
BOOT_SET_BPE_TABLE = 0x5  # opcode 5


# ============================================================
# PRNG-Based BPE Table Generator
# ============================================================

# The "vocabulary" -- byte values that appear in programs.
# Weighted toward common ASCII: space, newline, letters, digits, symbols.
# The PRNG selects pairs from this pool.
_BYTE_POOL = bytes(range(32, 127))  # printable ASCII (95 chars)


def generate_bpe_table(prng_seed: int) -> list:
    """
    Deterministically generate a 128-entry BPE pair table from a PRNG seed.
    
    Index 0 = empty (terminator, same as fixed table).
    Indices 1-127 = byte pairs generated from the seed.
    
    Uses an LCG (Linear Congruential Generator) to produce pairs.
    Each pair is two bytes selected from the printable ASCII pool.
    
    The seed space is 12 bits (0-4095), giving 4096 possible tables.
    """
    # LCG parameters (same as Numerical Recipes)
    a = 1664525
    c = 1013904223
    state = prng_seed & 0xFFF  # 12-bit seed
    
    table = [b'']  # index 0 = empty/terminator
    
    # Generate 127 unique byte pairs
    seen = set()
    for _ in range(127 * 3):  # try up to 3x to fill table
        if len(table) >= 128:
            break
        state = (a * state + c) & 0xFFFFFFFF
        b1 = _BYTE_POOL[state % len(_BYTE_POOL)]
        state = (a * state + c) & 0xFFFFFFFF
        b2 = _BYTE_POOL[state % len(_BYTE_POOL)]
        pair = bytes([b1, b2])
        if pair not in seen:
            seen.add(pair)
            table.append(pair)
    
    # Pad if needed (shouldn't happen with 95^2 possible pairs)
    while len(table) < 128:
        table.append(b'')
    
    return table


def _decode_boot_opcode(seed: int) -> tuple:
    """
    Decode a boot pixel's opcode and payload.
    Returns (opcode_byte, payload_24bit) or None if not a boot pixel.

    Boot pixel format:
      strategy = 0xF (top 4 bits)
      params[27:24] = opcode (4 bits)
      params[23:0]  = payload (24 bits)

    We encode opcode as (opcode_nibble << 4) | sub_nibble for compact IDs.
    Phase 6a only uses two opcodes:
      BOOT_END:      params[27:24] = 0x0, params[23:0] = reserved
      SET_PROFILE:   params[27:24] = 0x3, params[23:0] = [4:profile_id][20:config_bits]
    """
    strategy = (seed >> 28) & 0xF
    if strategy != 0xF:
        return None  # not a boot pixel candidate

    params = seed & 0x0FFFFFFF
    opcode = (params >> 24) & 0xF
    payload = params & 0x00FFFFFF
    return (opcode, payload)


def _execute_boot_pixel(seed: int, boot_ctx: BootContext) -> str:
    """
    Execute a boot pixel instruction.
    Returns: 'boot_end' if BOOT_END encountered, 'continue' otherwise.
    """
    decoded = _decode_boot_opcode(seed)
    if decoded is None:
        # Non-0xF pixel in boot section -- treat as BOOT_END (auto-transition)
        return 'boot_end'

    opcode, payload = decoded

    if opcode == 0x0:
        # BOOT_END -- payload is reserved (ignore)
        return 'boot_end'

    elif opcode == 0x3:
        # SET_PROFILE
        profile_id = (payload >> 20) & 0xF
        config_bits = payload & 0x0FFFFF
        boot_ctx.apply_profile(profile_id)
        # Config bits reserved for future use
        return 'continue'

    elif opcode == 0x5:
        # SET_BPE_TABLE -- payload is 12-bit PRNG seed
        prng_seed = payload & 0xFFF
        boot_ctx.custom_bpe_table = generate_bpe_table(prng_seed)
        return 'continue'

    else:
        # Unknown opcode -- ignore silently (forward compat)
        return 'continue'


# ============================================================
# V4 Expansion
# ============================================================

def _expand_bpe_with_table(seed: int, bpe_table: list) -> bytes:
    """
    Expand a BPE seed using a custom byte-pair table.
    Same logic as expand._expand_bpe but with a different table.
    """
    params = seed & 0x0FFFFFFF
    result = bytearray()
    for i in range(4):
        idx = (params >> (7 * i)) & 0x7F
        if idx == 0:
            break  # terminator
        if idx < len(bpe_table):
            pair = bpe_table[idx]
            if pair:
                result.extend(pair)
    return bytes(result)


def expand_multi_v4(seeds: list, max_output: int = 65536) -> bytes:
    """
    Expand seeds with boot pixel support.

    Scans for boot pixels (t6mode behavior without PNG). The first seed
    with strategy 0xF is treated as a potential boot pixel. Boot section
    ends at BOOT_END or first non-boot pixel.

    For non-boot seeds, delegates to V3 expansion with BootContext config.
    """
    boot_ctx = BootContext()
    expand_ctx = ExpandContext()
    result = bytearray()

    in_boot = True  # start in boot mode

    for seed in seeds:
        if len(result) >= max_output:
            break

        if in_boot:
            decoded = _decode_boot_opcode(seed)
            if decoded is not None:
                action = _execute_boot_pixel(seed, boot_ctx)
                if action == 'boot_end':
                    in_boot = False
                    # Apply boot context to expand context
                    expand_ctx.xor_mode = boot_ctx.xor_mode
                continue  # boot pixels never produce output
            else:
                # First non-0xF pixel = auto-transition to display
                in_boot = False
                expand_ctx.xor_mode = boot_ctx.xor_mode

        # Display pixel -- expand with context
        strategy = (seed >> 28) & 0xF
        if strategy == 0x9 and boot_ctx.custom_bpe_table is not None:
            # BPE with custom table
            expanded = _expand_bpe_with_table(seed, boot_ctx.custom_bpe_table)
            expand_ctx.output_buffer.extend(expanded)
        else:
            expanded = expand_with_context(seed, expand_ctx)
        result.extend(expanded)

    return bytes(result[:max_output])


def expand_from_png_v4(png_data: bytes) -> bytes:
    """
    Expand a PNG with V4 boot pixel support.

    Reads t6mode flag. If present and =1, uses V4 expansion.
    Otherwise falls back to V3 (which falls back to V2).
    """
    t6mode = _read_text_chunk(png_data, 't6mode')

    if t6mode != '1':
        # Not a phase 4 PNG -- use V3 expansion
        return expand_from_png_v3(png_data)

    seeds, real_count = extract_seeds_from_png(png_data)
    real_seeds = seeds[:real_count]

    boot_ctx = BootContext()
    expand_ctx = ExpandContext()
    result = bytearray()
    in_boot = True

    for seed in real_seeds:
        if in_boot:
            decoded = _decode_boot_opcode(seed)
            if decoded is not None:
                action = _execute_boot_pixel(seed, boot_ctx)
                if action == 'boot_end':
                    in_boot = False
                    expand_ctx.xor_mode = boot_ctx.xor_mode
                continue
            else:
                in_boot = False
                expand_ctx.xor_mode = boot_ctx.xor_mode

        strategy = (seed >> 28) & 0xF
        if strategy == 0x9 and boot_ctx.custom_bpe_table is not None:
            # BPE with custom table
            expanded = _expand_bpe_with_table(seed, boot_ctx.custom_bpe_table)
            expand_ctx.output_buffer.extend(expanded)
        else:
            expanded = expand_with_context(seed, expand_ctx)
        result.extend(expanded)

    return bytes(result)


# ============================================================
# Boot Pixel Seed Construction Helpers
# ============================================================

def make_boot_end_seed() -> int:
    """Construct a BOOT_END seed: strategy=0xF, opcode=0, payload=0."""
    return 0xF0000000  # 1111 0000 0000 0000 0000 0000 0000 0000


def make_set_profile_seed(profile_id: int, config_bits: int = 0) -> int:
    """
    Construct a SET_PROFILE seed.

    profile_id: 0-15 (4 bits)
    config_bits: 20 bits reserved for future use
    """
    if not (0 <= profile_id <= 15):
        raise ValueError(f"profile_id must be 0-15, got {profile_id}")
    payload = (profile_id << 20) | (config_bits & 0x0FFFFF)
    # strategy=0xF, opcode=0x3, payload
    return 0xF0000000 | (0x3 << 24) | payload


def make_set_bpe_table_seed(prng_seed: int) -> int:
    """
    Construct a SET_BPE_TABLE seed.

    prng_seed: 0-4095 (12 bits) -- seed for deterministic BPE table generation
    """
    if not (0 <= prng_seed <= 4095):
        raise ValueError(f"prng_seed must be 0-4095, got {prng_seed}")
    payload = prng_seed & 0xFFF
    return 0xF0000000 | (0x5 << 24) | payload


# ============================================================
# CLI
# ============================================================

if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Pixelpack Phase 4 - Boot Pixel Architecture")
        print()
        print("Usage:")
        print("  python3 expand4.py <seed_hex> [<seed_hex2> ...]")
        print("  python3 expand4.py --png <file.png>")
        sys.exit(1)

    if sys.argv[1] == '--png':
        with open(sys.argv[2], 'rb') as f:
            png_data = f.read()
        result = expand_from_png_v4(png_data)
        print(f"Output: {len(result)} bytes")
        try:
            print(f"ASCII: {result.decode('ascii')!r}")
        except UnicodeDecodeError:
            print(f"Hex: {result.hex()}")
    else:
        seeds = [int(s, 16) for s in sys.argv[1:]]
        result = expand_multi_v4(seeds)
        print(f"Output: {len(result)} bytes")
        try:
            print(f"ASCII: {result.decode('ascii')!r}")
        except UnicodeDecodeError:
            print(f"Hex: {result.hex()}")
