; DESCRIPTION: Draws a green rectangle at (83, 89) with width 78 and height 114.
; PLAN: r0=83(x), r1=89(y), r2=78(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 89
LDI r2, 78
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
