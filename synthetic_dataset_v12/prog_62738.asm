; DESCRIPTION: Draws a black rectangle at (158, 53) with width 119 and height 37.
; PLAN: r0=158(x), r1=53(y), r2=119(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 53
LDI r2, 119
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
