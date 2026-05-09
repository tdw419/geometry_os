; DESCRIPTION: Draws a white rectangle at (248, 77) with width 109 and height 89.
; PLAN: r0=248(x), r1=77(y), r2=109(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 77
LDI r2, 109
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
