; DESCRIPTION: Draws a green rectangle at (427, 101) with width 24 and height 76.
; PLAN: r0=427(x), r1=101(y), r2=24(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 101
LDI r2, 24
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
