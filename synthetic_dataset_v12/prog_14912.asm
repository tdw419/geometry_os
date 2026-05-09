; DESCRIPTION: Draws a purple rectangle at (229, 33) with width 62 and height 119.
; PLAN: r0=229(x), r1=33(y), r2=62(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 33
LDI r2, 62
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
