; DESCRIPTION: Draws a green rectangle at (145, 61) with width 110 and height 116.
; PLAN: r0=145(x), r1=61(y), r2=110(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 61
LDI r2, 110
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
