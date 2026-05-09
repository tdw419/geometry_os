; DESCRIPTION: Draws a purple rectangle at (51, 84) with width 83 and height 48.
; PLAN: r0=51(x), r1=84(y), r2=83(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 84
LDI r2, 83
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
