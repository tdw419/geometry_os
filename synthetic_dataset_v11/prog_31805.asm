; DESCRIPTION: Draws a purple rectangle at (105, 175) with width 78 and height 58.
; PLAN: r0=105(x), r1=175(y), r2=78(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 175
LDI r2, 78
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
