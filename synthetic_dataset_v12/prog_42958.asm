; DESCRIPTION: Draws a purple rectangle at (457, 69) with width 26 and height 52.
; PLAN: r0=457(x), r1=69(y), r2=26(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 69
LDI r2, 26
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
