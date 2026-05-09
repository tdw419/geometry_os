; DESCRIPTION: Draws a blue rectangle at (110, 84) with width 117 and height 81.
; PLAN: r0=110(x), r1=84(y), r2=117(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 84
LDI r2, 117
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
