; DESCRIPTION: Draws a white rectangle at (77, 117) with width 89 and height 101.
; PLAN: r0=77(x), r1=117(y), r2=89(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 117
LDI r2, 89
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
