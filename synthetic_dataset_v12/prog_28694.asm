; DESCRIPTION: Draws a black rectangle at (399, 158) with width 66 and height 84.
; PLAN: r0=399(x), r1=158(y), r2=66(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 158
LDI r2, 66
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
