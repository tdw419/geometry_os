; DESCRIPTION: Draws a yellow rectangle at (388, 170) with width 10 and height 81.
; PLAN: r0=388(x), r1=170(y), r2=10(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 170
LDI r2, 10
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
