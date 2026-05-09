; DESCRIPTION: Draws a yellow rectangle at (84, 76) with width 80 and height 18.
; PLAN: r0=84(x), r1=76(y), r2=80(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 76
LDI r2, 80
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
