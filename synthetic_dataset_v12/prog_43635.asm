; DESCRIPTION: Draws a green rectangle at (84, 110) with width 108 and height 80.
; PLAN: r0=84(x), r1=110(y), r2=108(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 110
LDI r2, 108
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
