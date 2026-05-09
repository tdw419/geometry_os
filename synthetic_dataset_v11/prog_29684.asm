; DESCRIPTION: Draws a white rectangle at (89, 110) with width 58 and height 120.
; PLAN: r0=89(x), r1=110(y), r2=58(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 110
LDI r2, 58
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
