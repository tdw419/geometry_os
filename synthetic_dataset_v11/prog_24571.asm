; DESCRIPTION: Draws a purple rectangle at (83, 142) with width 94 and height 11.
; PLAN: r0=83(x), r1=142(y), r2=94(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 142
LDI r2, 94
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
