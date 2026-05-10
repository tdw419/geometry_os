; DESCRIPTION: Draws a black rectangle at (158, 194) with width 51 and height 43.
; PLAN: r0=158(x), r1=194(y), r2=51(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 194
LDI r2, 51
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
