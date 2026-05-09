; DESCRIPTION: Draws a purple rectangle at (147, 112) with width 61 and height 58.
; PLAN: r0=147(x), r1=112(y), r2=61(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 112
LDI r2, 61
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
