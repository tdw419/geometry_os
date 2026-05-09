; DESCRIPTION: Draws a yellow rectangle at (37, 138) with width 119 and height 84.
; PLAN: r0=37(x), r1=138(y), r2=119(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 138
LDI r2, 119
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
