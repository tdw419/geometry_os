; DESCRIPTION: Draws a yellow rectangle at (84, 225) with width 56 and height 15.
; PLAN: r0=84(x), r1=225(y), r2=56(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 225
LDI r2, 56
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
