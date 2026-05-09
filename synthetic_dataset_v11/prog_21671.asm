; DESCRIPTION: Draws a green rectangle at (56, 42) with width 49 and height 58.
; PLAN: r0=56(x), r1=42(y), r2=49(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 42
LDI r2, 49
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
