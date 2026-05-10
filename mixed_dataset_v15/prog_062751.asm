; DESCRIPTION: Draws a purple rectangle at (457, 13) with width 38 and height 44.
; PLAN: r0=457(x), r1=13(y), r2=38(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 13
LDI r2, 38
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
