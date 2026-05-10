; DESCRIPTION: Draws a purple rectangle at (77, 45) with width 114 and height 105.
; PLAN: r0=77(x), r1=45(y), r2=114(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 45
LDI r2, 114
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
