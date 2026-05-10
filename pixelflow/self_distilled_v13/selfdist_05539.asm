; DESCRIPTION: Draws a purple rectangle at (0, 175) with width 54 and height 23.
; PLAN: r0=0(x), r1=175(y), r2=54(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 175
LDI r2, 54
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
