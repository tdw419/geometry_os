; DESCRIPTION: Draws a black rectangle at (147, 184) with width 93 and height 39.
; PLAN: r0=147(x), r1=184(y), r2=93(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 184
LDI r2, 93
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
