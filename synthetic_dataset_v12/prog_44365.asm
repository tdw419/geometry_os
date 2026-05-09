; DESCRIPTION: Draws a purple rectangle at (138, 227) with width 51 and height 16.
; PLAN: r0=138(x), r1=227(y), r2=51(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 227
LDI r2, 51
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
