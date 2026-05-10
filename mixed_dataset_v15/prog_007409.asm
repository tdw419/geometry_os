; DESCRIPTION: Draws a purple rectangle at (70, 188) with width 38 and height 90.
; PLAN: r0=70(x), r1=188(y), r2=38(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 188
LDI r2, 38
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
