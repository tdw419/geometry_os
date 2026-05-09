; DESCRIPTION: Draws a purple rectangle at (62, 58) with width 23 and height 114.
; PLAN: r0=62(x), r1=58(y), r2=23(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 58
LDI r2, 23
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
