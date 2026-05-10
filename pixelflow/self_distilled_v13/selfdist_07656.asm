; DESCRIPTION: Draws a purple rectangle at (181, 147) with width 104 and height 65.
; PLAN: r0=181(x), r1=147(y), r2=104(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 147
LDI r2, 104
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
