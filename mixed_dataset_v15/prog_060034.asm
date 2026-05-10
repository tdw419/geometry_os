; DESCRIPTION: Draws a yellow rectangle at (86, 170) with width 115 and height 86.
; PLAN: r0=86(x), r1=170(y), r2=115(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 170
LDI r2, 115
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
