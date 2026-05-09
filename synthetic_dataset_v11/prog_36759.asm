; DESCRIPTION: Draws a black rectangle at (147, 53) with width 58 and height 12.
; PLAN: r0=147(x), r1=53(y), r2=58(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 53
LDI r2, 58
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
