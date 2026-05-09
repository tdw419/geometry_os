; DESCRIPTION: Draws a white rectangle at (119, 28) with width 110 and height 33.
; PLAN: r0=119(x), r1=28(y), r2=110(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 28
LDI r2, 110
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
