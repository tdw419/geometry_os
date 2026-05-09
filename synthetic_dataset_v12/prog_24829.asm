; DESCRIPTION: Draws a yellow rectangle at (207, 110) with width 99 and height 51.
; PLAN: r0=207(x), r1=110(y), r2=99(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 110
LDI r2, 99
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
