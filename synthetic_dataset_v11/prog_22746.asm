; DESCRIPTION: Draws a white rectangle at (99, 80) with width 19 and height 89.
; PLAN: r0=99(x), r1=80(y), r2=19(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 80
LDI r2, 19
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
