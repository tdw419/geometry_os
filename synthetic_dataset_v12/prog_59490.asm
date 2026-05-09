; DESCRIPTION: Draws a yellow rectangle at (7, 23) with width 80 and height 110.
; PLAN: r0=7(x), r1=23(y), r2=80(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 23
LDI r2, 80
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
