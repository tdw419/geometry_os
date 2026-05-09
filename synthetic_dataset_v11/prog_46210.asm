; DESCRIPTION: Creates a green rectangular region at (155, 42) spanning 101 by 107 pixels.
; PLAN: r0=155(x), r1=42(y), r2=101(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 42
LDI r2, 101
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
