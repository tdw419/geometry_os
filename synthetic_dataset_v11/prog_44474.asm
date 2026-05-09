; DESCRIPTION: Draws a purple rectangle at (172, 147) with width 43 and height 12.
; PLAN: r0=172(x), r1=147(y), r2=43(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 147
LDI r2, 43
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
