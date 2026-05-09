; DESCRIPTION: Places a green 42x12 rectangle at position (28, 26).
; PLAN: r0=28(x), r1=26(y), r2=42(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 26
LDI r2, 42
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
