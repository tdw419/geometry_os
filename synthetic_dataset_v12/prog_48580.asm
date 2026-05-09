; DESCRIPTION: Draws a black rectangle at (26, 112) with width 115 and height 36.
; PLAN: r0=26(x), r1=112(y), r2=115(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 112
LDI r2, 115
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
