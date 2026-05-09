; DESCRIPTION: Draws a yellow rectangle at (147, 49) with width 82 and height 114.
; PLAN: r0=147(x), r1=49(y), r2=82(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 49
LDI r2, 82
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
