; DESCRIPTION: Draws a white rectangle at (323, 5) with width 99 and height 89.
; PLAN: r0=323(x), r1=5(y), r2=99(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 5
LDI r2, 99
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
