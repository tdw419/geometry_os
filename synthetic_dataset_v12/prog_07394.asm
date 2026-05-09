; DESCRIPTION: Draws a purple rectangle at (428, 55) with width 56 and height 118.
; PLAN: r0=428(x), r1=55(y), r2=56(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 55
LDI r2, 56
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
