; DESCRIPTION: Draws a purple rectangle at (359, 68) with width 25 and height 70.
; PLAN: r0=359(x), r1=68(y), r2=25(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 68
LDI r2, 25
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
