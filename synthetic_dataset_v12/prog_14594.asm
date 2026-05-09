; DESCRIPTION: Draws a white rectangle at (369, 145) with width 89 and height 28.
; PLAN: r0=369(x), r1=145(y), r2=89(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 145
LDI r2, 89
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
