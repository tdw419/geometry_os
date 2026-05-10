; DESCRIPTION: Draws a purple rectangle at (81, 170) with width 102 and height 29.
; PLAN: r0=81(x), r1=170(y), r2=102(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 170
LDI r2, 102
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
