; DESCRIPTION: Draws a white rectangle at (201, 3) with width 86 and height 84.
; PLAN: r0=201(x), r1=3(y), r2=86(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 3
LDI r2, 86
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
