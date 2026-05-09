; DESCRIPTION: Draws a white rectangle at (419, 137) with width 89 and height 104.
; PLAN: r0=419(x), r1=137(y), r2=89(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 137
LDI r2, 89
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
