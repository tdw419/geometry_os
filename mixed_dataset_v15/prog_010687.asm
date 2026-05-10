; DESCRIPTION: Draws a purple rectangle at (337, 170) with width 26 and height 86.
; PLAN: r0=337(x), r1=170(y), r2=26(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 170
LDI r2, 26
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
