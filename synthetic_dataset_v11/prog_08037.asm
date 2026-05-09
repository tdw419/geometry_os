; DESCRIPTION: Draws a white rectangle at (110, 88) with width 80 and height 94.
; PLAN: r0=110(x), r1=88(y), r2=80(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 88
LDI r2, 80
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
