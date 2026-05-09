; DESCRIPTION: Draws a purple rectangle at (183, 170) with width 65 and height 64.
; PLAN: r0=183(x), r1=170(y), r2=65(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 170
LDI r2, 65
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
