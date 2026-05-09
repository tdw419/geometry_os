; DESCRIPTION: Draws a purple rectangle at (186, 32) with width 51 and height 17.
; PLAN: r0=186(x), r1=32(y), r2=51(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 32
LDI r2, 51
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
