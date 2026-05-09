; DESCRIPTION: Draws a white rectangle at (185, 77) with width 52 and height 78.
; PLAN: r0=185(x), r1=77(y), r2=52(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 77
LDI r2, 52
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
