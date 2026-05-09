; DESCRIPTION: Draws a white rectangle at (266, 74) with width 119 and height 31.
; PLAN: r0=266(x), r1=74(y), r2=119(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 74
LDI r2, 119
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
