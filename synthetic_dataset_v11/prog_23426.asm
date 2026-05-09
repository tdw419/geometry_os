; DESCRIPTION: Draws a purple rectangle at (54, 62) with width 114 and height 33.
; PLAN: r0=54(x), r1=62(y), r2=114(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 114
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
