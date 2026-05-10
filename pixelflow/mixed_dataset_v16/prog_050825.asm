; DESCRIPTION: Draws a white rectangle at (452, 77) with width 55 and height 110.
; PLAN: r0=452(x), r1=77(y), r2=55(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 77
LDI r2, 55
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
