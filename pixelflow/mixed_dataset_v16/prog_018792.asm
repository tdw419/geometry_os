; DESCRIPTION: Draws a blue rectangle at (238, 147) with width 99 and height 107.
; PLAN: r0=238(x), r1=147(y), r2=99(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 147
LDI r2, 99
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
