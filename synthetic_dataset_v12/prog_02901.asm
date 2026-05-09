; DESCRIPTION: Draws a black rectangle at (195, 169) with width 96 and height 53.
; PLAN: r0=195(x), r1=169(y), r2=96(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 169
LDI r2, 96
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
