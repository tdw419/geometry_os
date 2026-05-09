; DESCRIPTION: Draws a purple rectangle at (227, 193) with width 47 and height 54.
; PLAN: r0=227(x), r1=193(y), r2=47(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 193
LDI r2, 47
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
