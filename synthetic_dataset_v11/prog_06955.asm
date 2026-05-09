; DESCRIPTION: Places a cyan 42x12 rectangle at position (109, 176).
; PLAN: r0=109(x), r1=176(y), r2=42(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 176
LDI r2, 42
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
