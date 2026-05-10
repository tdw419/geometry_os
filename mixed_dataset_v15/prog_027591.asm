; DESCRIPTION: Draws a white rectangle at (359, 219) with width 110 and height 14.
; PLAN: r0=359(x), r1=219(y), r2=110(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 219
LDI r2, 110
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
