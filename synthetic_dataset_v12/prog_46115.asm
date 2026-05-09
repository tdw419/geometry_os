; DESCRIPTION: Draws a black rectangle at (85, 192) with width 81 and height 43.
; PLAN: r0=85(x), r1=192(y), r2=81(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 192
LDI r2, 81
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
