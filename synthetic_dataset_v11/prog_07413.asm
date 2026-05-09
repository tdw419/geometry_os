; DESCRIPTION: Draws a purple rectangle at (65, 51) with width 110 and height 75.
; PLAN: r0=65(x), r1=51(y), r2=110(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 51
LDI r2, 110
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
