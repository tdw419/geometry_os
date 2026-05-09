; DESCRIPTION: Draws a purple rectangle at (223, 23) with width 25 and height 101.
; PLAN: r0=223(x), r1=23(y), r2=25(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 23
LDI r2, 25
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
