; DESCRIPTION: Places a cyan 42x64 rectangle at position (166, 112).
; PLAN: r0=166(x), r1=112(y), r2=42(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 112
LDI r2, 42
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
