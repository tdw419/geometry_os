; DESCRIPTION: Draws a purple rectangle at (388, 142) with width 14 and height 49.
; PLAN: r0=388(x), r1=142(y), r2=14(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 142
LDI r2, 14
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
