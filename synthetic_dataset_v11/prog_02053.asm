; DESCRIPTION: Draws a purple rectangle at (44, 29) with width 52 and height 44.
; PLAN: r0=44(x), r1=29(y), r2=52(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 29
LDI r2, 52
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
