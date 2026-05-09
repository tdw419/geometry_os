; DESCRIPTION: Draws a purple rectangle at (9, 22) with width 13 and height 83.
; PLAN: r0=9(x), r1=22(y), r2=13(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 22
LDI r2, 13
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
