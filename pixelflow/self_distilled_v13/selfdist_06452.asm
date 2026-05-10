; DESCRIPTION: Draws a yellow rectangle at (350, 52) with width 105 and height 84.
; PLAN: r0=350(x), r1=52(y), r2=105(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 52
LDI r2, 105
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
