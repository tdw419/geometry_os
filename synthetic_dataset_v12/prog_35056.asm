; DESCRIPTION: Draws a black rectangle at (359, 36) with width 106 and height 49.
; PLAN: r0=359(x), r1=36(y), r2=106(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 36
LDI r2, 106
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
