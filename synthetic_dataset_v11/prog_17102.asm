; DESCRIPTION: Draws a black rectangle at (8, 76) with width 51 and height 106.
; PLAN: r0=8(x), r1=76(y), r2=51(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 76
LDI r2, 51
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
