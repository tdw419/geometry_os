; DESCRIPTION: Draws a purple rectangle at (99, 51) with width 111 and height 118.
; PLAN: r0=99(x), r1=51(y), r2=111(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 51
LDI r2, 111
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
