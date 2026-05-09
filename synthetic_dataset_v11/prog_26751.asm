; DESCRIPTION: Draws a yellow rectangle at (225, 145) with width 25 and height 101.
; PLAN: r0=225(x), r1=145(y), r2=25(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 145
LDI r2, 25
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
