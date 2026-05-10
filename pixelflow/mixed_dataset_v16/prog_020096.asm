; DESCRIPTION: Draws a yellow rectangle at (384, 170) with width 51 and height 75.
; PLAN: r0=384(x), r1=170(y), r2=51(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 170
LDI r2, 51
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
