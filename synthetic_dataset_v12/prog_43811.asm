; DESCRIPTION: Draws a purple rectangle at (216, 62) with width 91 and height 38.
; PLAN: r0=216(x), r1=62(y), r2=91(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 62
LDI r2, 91
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
