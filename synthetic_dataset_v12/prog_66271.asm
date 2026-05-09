; DESCRIPTION: Draws a purple rectangle at (494, 170) with width 16 and height 20.
; PLAN: r0=494(x), r1=170(y), r2=16(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 170
LDI r2, 16
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
