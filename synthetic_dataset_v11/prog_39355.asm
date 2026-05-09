; DESCRIPTION: Draws a green rectangle at (31, 145) with width 37 and height 75.
; PLAN: r0=31(x), r1=145(y), r2=37(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 145
LDI r2, 37
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
