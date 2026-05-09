; DESCRIPTION: Draws a purple rectangle at (450, 121) with width 51 and height 97.
; PLAN: r0=450(x), r1=121(y), r2=51(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 121
LDI r2, 51
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
