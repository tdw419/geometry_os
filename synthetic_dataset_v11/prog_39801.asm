; DESCRIPTION: Draws a purple rectangle at (14, 107) with width 105 and height 89.
; PLAN: r0=14(x), r1=107(y), r2=105(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 107
LDI r2, 105
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
