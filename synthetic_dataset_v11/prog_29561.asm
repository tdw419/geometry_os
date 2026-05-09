; DESCRIPTION: Draws a white rectangle at (11, 89) with width 118 and height 56.
; PLAN: r0=11(x), r1=89(y), r2=118(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 89
LDI r2, 118
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
