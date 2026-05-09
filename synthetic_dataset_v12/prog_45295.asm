; DESCRIPTION: Draws a white rectangle at (369, 119) with width 25 and height 77.
; PLAN: r0=369(x), r1=119(y), r2=25(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 119
LDI r2, 25
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
