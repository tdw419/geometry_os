; DESCRIPTION: Draws a white rectangle at (89, 8) with width 75 and height 76.
; PLAN: r0=89(x), r1=8(y), r2=75(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 8
LDI r2, 75
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
