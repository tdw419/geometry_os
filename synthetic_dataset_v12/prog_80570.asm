; DESCRIPTION: Draws a green rectangle at (216, 156) with width 42 and height 95.
; PLAN: r0=216(x), r1=156(y), r2=42(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 156
LDI r2, 42
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
