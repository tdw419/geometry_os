; DESCRIPTION: Draws a blue rectangle at (264, 147) with width 35 and height 19.
; PLAN: r0=264(x), r1=147(y), r2=35(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 147
LDI r2, 35
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
