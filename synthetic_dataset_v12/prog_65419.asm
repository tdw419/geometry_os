; DESCRIPTION: Draws a purple rectangle at (227, 48) with width 100 and height 89.
; PLAN: r0=227(x), r1=48(y), r2=100(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 48
LDI r2, 100
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
