; DESCRIPTION: Draws a purple rectangle at (15, 38) with width 22 and height 19.
; PLAN: r0=15(x), r1=38(y), r2=22(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 38
LDI r2, 22
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
