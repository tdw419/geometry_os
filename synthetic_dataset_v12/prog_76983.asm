; DESCRIPTION: Draws a blue rectangle at (83, 118) with width 84 and height 80.
; PLAN: r0=83(x), r1=118(y), r2=84(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 118
LDI r2, 84
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
