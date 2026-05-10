; DESCRIPTION: Draws a green rectangle at (52, 97) with width 62 and height 115.
; PLAN: r0=52(x), r1=97(y), r2=62(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 97
LDI r2, 62
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
