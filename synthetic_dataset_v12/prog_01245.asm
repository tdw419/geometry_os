; DESCRIPTION: Places a cyan 42x64 rectangle at position (43, 136).
; PLAN: r0=43(x), r1=136(y), r2=42(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 136
LDI r2, 42
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
