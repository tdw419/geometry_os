"""
Boot Pixel Expander v4 - Dictionary-Dominant Encoding

A single 32-bit value (one RGBA pixel) encodes a generative recipe
that deterministically expands into a byte sequence.

Architecture:
  0x0-0x6: DICT_N   - N entries from 16-entry base dictionary (4-bit indices)
  0x7:      NIBBLE   - 7 nibbles indexing a byte table
  0x8:      DICTX5   - 5 entries from 32-entry extended dictionary (5-bit indices)
  0x9:      BPE      - 4 x 7-bit indices into 128-entry byte-pair lookup table
  0xA:      DICTX7   - 7 entries from extended dict entries 16-31 (4-bit indices)
  0xB:      RLE      - run-length encoded pattern
  0xC:      XOR_CHAIN - XOR chain from start byte
  0xD:      LINEAR   - linear byte sequence (start + step)
  0xE:      BYTEPACK - direct byte encoding (8 sub-modes)
  0xF:      TEMPLATE - template + XOR substitution

The dictionary IS the cellular machinery that gives meaning to the seed.
"""

import struct

# === DICTIONARIES ===
# The genome. Each entry is a fragment that composes into programs.

DICTIONARY = [
    b'print(',      # 0  - Python print call (6 bytes)
    b')',           # 1  - close paren (1 byte)
    b'"',           # 2  - double quote (1 byte)
    b'Hello',       # 3  - Hello (5 bytes)
    b'\n',          # 4  - newline (1 byte)
    b'echo ',       # 5  - shell echo (5 bytes)
    b'World',       # 6  - World (5 bytes)
    b'def ',        # 7  - Python def (4 bytes)
    b'42',          # 8  - common value (2 bytes)
    b'main',        # 9  - main function name (4 bytes)
    b'()',          # 10 - empty parens (2 bytes)
    b', ',          # 11 - comma space (2 bytes)
    b'!',           # 12 - exclamation (1 byte)
    b'void ',       # 13 - C keyword (5 bytes)
    b'{',           # 14 - open brace (1 byte)
    b'}',           # 15 - close brace (1 byte)
]

DICTIONARY_EXT = list(DICTIONARY) + [
    b'x',           # 16 - variable x (1 byte)
    b'=',           # 17 - assignment (1 byte)
    b'+',           # 18 - plus (1 byte)
    b'-',           # 19 - minus (1 byte)
    b'*',           # 20 - multiply (1 byte)
    b';',           # 21 - semicolon (1 byte)
    b'1',           # 22 - literal 1 (1 byte)
    b'0',           # 23 - literal 0 (1 byte)
    b'if ',         # 24 - if keyword (3 bytes)
    b'return ',     # 25 - return keyword (8 bytes)
    b'int ',        # 26 - int type (4 bytes)
    b'for ',        # 27 - for keyword (4 bytes)
    b'while ',      # 28 - while keyword (6 bytes)
    b'class ',      # 29 - class keyword (6 bytes)
    b' ',           # 30 - space (1 byte)
    b'fn ',         # 31 - fn keyword (3 bytes)
]

# DICTX6/7 sub-dictionary (entries 16-31 of DICTIONARY_EXT)
SUB_DICT = DICTIONARY_EXT[16:]  # 16 entries, indices 0-15

NIBBLE_TABLE = [
    0x00, 0x0A, 0x20, 0x21, 0x22, 0x28, 0x29, 0x2C,
    0x2F, 0x3A, 0x3B, 0x3D, 0x41, 0x61, 0x7B, 0x7D,
]

# BPE byte-pair lookup table: 128 entries (index 0 = unused/escape).
# Each entry is a 2-byte pair. Top pairs from Python source corpus,
# tuned for common programming patterns.
BPE_PAIR_TABLE = [
    b'',  # 0 = unused
    b'  ', b'\n ', b'se', b'e ', b'in', b', ', b' i', b're',  # 1-8
    b' s', b's ', b'er', b' t', b'on', b'or', b'el', b't ',  # 9-16
    b':\n', b'n ', b'th', b'at', b'= ', b' a', b'f ', b'en',  # 17-24
    b'me', b'et', b'te', b' =', b'es', b')\n', b'de', b'le',  # 25-32
    b'st', b' r', b'he', b' f', b'\n\n', b'al', b'is', b'ar',  # 33-40
    b'ne', b'lf', b'ti', b'an', b'nt', b' c', b' o', b' d',  # 41-48
    b'd ', b'r ', b'""', b'ta', b'co', b'if', b'ro', b'ra',  # 49-56
    b' e', b'ed', b'==', b'am', b'nd', b'as', b'it', b'li',  # 57-64
    b' b', b'f.', b' n', b'na', b'ur', b'ng', b'io', b'tr',  # 65-72
    b'ss', b'to', b'il', b'rn', b'# ', b'fi', b'tu', b'__',  # 73-80
    b'ex', b' m', b'):', b'ef', b'ge', b'ri', b'ce', b' p',  # 81-88
    b'la', b' "', b'pe', b'e:', b'0\n', b'1\n', b'b\n', b'(n',  # 89-96
    b'(i', b'i)', b'n)', b'b)', b'b,', b'a,', b'(1', b'(2',  # 97-104
    b'0)', b'1)', b'2,', b'0:', b'1:', b'<=', b'+ ', b' {',  # 105-112
    b'f"', b'"f', b'{i', b'{f', b'}"', b'})', b'ib', b'ci',  # 113-120
    b'bo', b'i(', b'cc', b'nf', b'0,', b'++', b'b ',  # 121-127
]


# === FILE-SPECIFIC BYTEPACK TABLE ===
# Module-global: when set, BYTEPACK mode 3 uses this instead of the
# hardcoded Python-source table. Set via set_file_specific_table()
# before expanding seeds that use it. Transported via PNG tEXt chunk.
_FILE_SPECIFIC_TABLE = None  # None = use default mode 3 table
_FILE_SPECIFIC_MODE6_TABLE = None  # None = use default mode 6 table

def set_file_specific_table(table: str):
    """Set the file-specific BYTEPACK table (16 chars)."""
    global _FILE_SPECIFIC_TABLE
    if table is not None and len(table) != 16:
        raise ValueError(f"Table must be 16 chars, got {len(table)}")
    _FILE_SPECIFIC_TABLE = table

def get_file_specific_table() -> str:
    """Get the current file-specific table, or default if not set."""
    return _FILE_SPECIFIC_TABLE if _FILE_SPECIFIC_TABLE is not None else ' \netnari=:s(,lfd'


def set_file_specific_mode6_table(table: str):
    """Set the file-specific BYTEPACK mode-6 table (32 chars)."""
    global _FILE_SPECIFIC_MODE6_TABLE
    if table is not None and len(table) != 32:
        raise ValueError(f"Mode-6 table must be 32 chars, got {len(table)}")
    _FILE_SPECIFIC_MODE6_TABLE = table

def get_file_specific_mode6_table() -> str:
    """Get the current file-specific mode-6 table, or default if not set."""
    return _FILE_SPECIFIC_MODE6_TABLE if _FILE_SPECIFIC_MODE6_TABLE is not None else ' etab\nr\'sni,d)(lxop=y0u_:Fc-fm1"'


# === EXPANDER ===

def expand(seed: int, max_output: int = 65536) -> bytes:
    """Expand a 32-bit seed into a byte sequence."""
    if seed < 0 or seed > 0xFFFFFFFF:
        raise ValueError(f"Seed must be 0-0xFFFFFFFF, got {seed}")

    strategy = (seed >> 28) & 0xF
    params = seed & 0x0FFFFFFF

    handlers = {
        0x0: lambda p: _expand_dict(p, 1),
        0x1: lambda p: _expand_dict(p, 2),
        0x2: lambda p: _expand_dict(p, 3),
        0x3: lambda p: _expand_dict(p, 4),
        0x4: lambda p: _expand_dict(p, 5),
        0x5: lambda p: _expand_dict(p, 6),
        0x6: lambda p: _expand_dict(p, 7),
        0x7: _expand_nibble,
        0x8: _expand_dictx5,
        0x9: _expand_bpe,
        0xA: _expand_dictx7,
        0xB: _expand_rle,
        0xC: _expand_xor_chain,
        0xD: _expand_linear,
        0xE: _expand_bytepack,
        0xF: _expand_template,
    }

    result = handlers[strategy](params)
    if isinstance(result, bytes):
        return result[:max_output]
    buf = bytearray()
    for b in result:
        if len(buf) >= max_output:
            break
        buf.append(b & 0xFF)
    return bytes(buf)


# --- Dictionary strategies ---

def _expand_dict(params, n_entries):
    """Concatenate n_entries from DICTIONARY using 4-bit indices."""
    result = bytearray()
    for i in range(n_entries):
        idx = (params >> (4 * i)) & 0xF
        result.extend(DICTIONARY[idx])
    return bytes(result)


def _expand_dictx5(params):
    """5 entries from DICTIONARY_EXT using 5-bit indices (25 bits)."""
    result = bytearray()
    for i in range(5):
        idx = (params >> (5 * i)) & 0x1F
        result.extend(DICTIONARY_EXT[idx])
    return bytes(result)


def _expand_bpe(params):
    """BPE: 4 x 7-bit indices into BPE_PAIR_TABLE. Up to 8 bytes per seed.

    Bit layout: [IIIIIII] [IIIIIII] [IIIIIII] [IIIIIII] (28 bits)
    Index 0 = terminator (shorter outputs). Indices 1-127 = byte pairs.
    """
    result = bytearray()
    for i in range(4):
        idx = (params >> (7 * i)) & 0x7F
        if idx == 0:
            break  # terminator
        if idx < len(BPE_PAIR_TABLE):
            pair = BPE_PAIR_TABLE[idx]
            if pair:
                result.extend(pair)
    return bytes(result)


def _expand_dictx7(params):
    """7 entries from SUB_DICT (entries 16-31) using 4-bit indices (28 bits)."""
    result = bytearray()
    for i in range(7):
        idx = (params >> (4 * i)) & 0xF
        result.extend(SUB_DICT[idx])
    return bytes(result)


def _expand_nibble(params):
    """7 nibbles each index NIBBLE_TABLE."""
    result = bytearray()
    for i in range(7):
        nibble = (params >> (4 * i)) & 0xF
        result.append(NIBBLE_TABLE[nibble])
    return bytes(result)


# --- Pattern strategies ---

def _expand_rle(params):
    """Run-length: [byte_a]*count_a + [byte_b]*count_b repeated."""
    byte_a = params & 0xFF
    byte_b = (params >> 8) & 0xFF
    count_a = ((params >> 16) & 0xF) + 1
    count_b = ((params >> 20) & 0xF) + 1
    repeats = ((params >> 24) & 0xF) + 1

    pattern = bytes([byte_a] * count_a + [byte_b] * count_b)
    result = bytearray()
    for _ in range(repeats):
        result.extend(pattern)
    return bytes(result)


def _expand_xor_chain(params):
    """XOR chain: start byte, each next = (prev ^ key) & mask."""
    start = params & 0xFF
    key = (params >> 8) & 0xFF
    mask = (params >> 16) & 0xFF
    if mask == 0:
        mask = 0xFF
    count = ((params >> 24) & 0xF) + 1

    result = bytearray()
    val = start
    for _ in range(count):
        result.append(val)
        val = ((val ^ key) & mask)
        if val == 0:
            val = key
    return bytes(result)


def _expand_linear(params):
    """Linear sequence: start, start+step, start+2*step, ..."""
    start = params & 0xFF
    step = (params >> 8) & 0xFF
    if step > 127:
        step -= 256
    count = ((params >> 16) & 0xF) + 1
    modifier = (params >> 20) & 0xFF

    result = bytearray()
    val = start
    for i in range(count):
        result.append(val & 0xFF)
        val += step
        if i % 2 == 1 and modifier:
            val ^= modifier
    return bytes(result)


# --- Direct encoding ---

def _expand_bytepack(params):
    """BYTEPACK: Direct byte encoding with 8 sub-modes.
    params: [2:0] mode, [27:3] data
    """
    mode = params & 0x7
    data = (params >> 3) & 0x7FFFFFF

    if mode == 0:
        # 3 raw bytes + optional repeat of first byte
        b0 = data & 0xFF
        b1 = (data >> 8) & 0xFF
        b2 = (data >> 16) & 0xFF
        extra = (data >> 24) & 0xF
        return bytes([b0, b1, b2]) if extra == 0 else bytes([b0, b1, b2] + [b0] * extra)

    elif mode == 1:
        # XOR delta: base + 2 deltas = 3 bytes + optional repeat
        base = data & 0xFF
        d1 = (data >> 8) & 0xFF
        d2 = (data >> 16) & 0xFF
        extra = (data >> 24) & 0xF
        result = bytearray([base, base ^ d1, (base ^ d1) ^ d2])
        if extra:
            result.extend([result[-1]] * extra)
        return bytes(result)

    elif mode == 2:
        # ADD delta: base + signed deltas (3-4 bytes)
        base = data & 0xFF
        d1 = (data >> 8) & 0xFF
        d2 = (data >> 16) & 0xFF
        d3 = (data >> 24) & 0xF
        result = bytearray([base, (base + d1) & 0xFF, (base + d1 + d2) & 0xFF])
        if d3:
            result.append((result[-1] + d3) & 0xFF)
        return bytes(result)

    elif mode == 3:
        # Compact: 6 chars via 4-bit indices into 16-char table
        # Uses file-specific table when set (via set_file_specific_table),
        # otherwise falls back to the default Python-source table.
        table = get_file_specific_table()
        result = bytearray()
        for i in range(6):
            idx = (data >> (4 * i)) & 0xF
            result.append(ord(table[idx]))
        return bytes(result)

    elif mode == 4:
        # 4 bytes, 7 bits each (28 bits = 4x7)
        b0 = data & 0x7F
        b1 = (data >> 7) & 0x7F
        b2 = (data >> 14) & 0x7F
        b3 = (data >> 21) & 0x7F
        return bytes([b0, b1, b2, b3])

    elif mode == 5:
        # Shared base + 4 nibble offsets
        base = data & 0xFF
        n0 = (data >> 8) & 0xF
        n1 = (data >> 12) & 0xF
        n2 = (data >> 16) & 0xF
        n3 = (data >> 20) & 0xF
        return bytes([base + n0, base + n1, base + n2, base + n3])

    elif mode == 6:
        # 5 bytes via 5-bit Python-source table (top 32 chars by frequency)
        # Uses file-specific table when set (via set_file_specific_mode6_table),
        # otherwise falls back to the default Python-source table.
        table = get_file_specific_mode6_table()
        result = bytearray()
        for i in range(5):
            idx = (data >> (5 * i)) & 0x1F
            result.append(ord(table[idx]))
        return bytes(result)

    elif mode == 7:
        # 5 bytes via 5-bit extended Python-source table (chars ranked 33-64)
        table = 'I>2#ETg&hAC.B43675[]DP8+NvLRk\\XS'
        result = bytearray()
        for i in range(5):
            idx = (data >> (5 * i)) & 0x1F
            result.append(ord(table[idx]))
        return bytes(result)

    return b''


# --- Template strategy ---

def _expand_template(params):
    """Template + XOR substitution + 2 extra bytes."""
    templates = [
        b'Hello, World!\n', b'print("hi")\n', b'echo hello\n',
        b'int main(){}\n', b'mov r0, #1\n', b'AAAA', b'BBBB', b'CCCC',
        b'ld a, 0\n', b'push 42\n', b'x = 1\n', b'a = b\n',
        b'fn f()\n', b'pub fn\n', b'val x\n', b'let x\n',
    ]

    idx = params & 0xF
    key = (params >> 4) & 0xFF
    extra1 = (params >> 12) & 0xFF
    extra2 = (params >> 20) & 0xFF

    template = templates[idx]
    result = bytes((b + key) & 0xFF for b in template)
    return result + bytes([extra1, extra2])


# === Utility ===

def seed_from_rgba(r: int, g: int, b: int, a: int = 0xFF) -> int:
    return (r << 24) | (g << 16) | (b << 8) | a


def seed_to_rgba(seed: int) -> tuple:
    return (
        (seed >> 24) & 0xFF,
        (seed >> 16) & 0xFF,
        (seed >> 8) & 0xFF,
        seed & 0xFF,
    )


def _STRATEGY_NAME(s):
    names = {
        0: 'DICT_1', 1: 'DICT_2', 2: 'DICT_3', 3: 'DICT_4',
        4: 'DICT_5', 5: 'DICT_6', 6: 'DICT_7', 7: 'NIBBLE',
        8: 'DICTX5', 9: 'BPE', 0xA: 'DICTX7', 0xB: 'RLE',
        0xC: 'XOR_CHAIN', 0xD: 'LINEAR', 0xE: 'BYTEPACK', 0xF: 'TEMPLATE',
    }
    return names.get(s, 'UNKNOWN')


if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Usage: python3 expand.py <seed_hex> [max_output]")
        sys.exit(1)

    seed = int(sys.argv[1], 16)
    max_out = int(sys.argv[2]) if len(sys.argv) > 2 else 65536
    result = expand(seed, max_out)
    strategy = (seed >> 28) & 0xF

    print(f"Seed:      0x{seed:08X}")
    r, g, b, a = seed_to_rgba(seed)
    print(f"RGBA:      ({r}, {g}, {b}, {a})")
    print(f"Strategy:  0x{strategy:X} ({_STRATEGY_NAME(strategy)})")
    print(f"Output:    {len(result)} bytes")
    print(f"Hex:       {result.hex()}")
    try:
        print(f"ASCII:     {result.decode('ascii')!r}")
    except UnicodeDecodeError:
        print(f"ASCII:     {repr(result)}")
