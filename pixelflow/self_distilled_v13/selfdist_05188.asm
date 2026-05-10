; DESCRIPTION: Draws a green rectangle at (105, 52) with width 31 and height 87.
; PLAN: r0=105(x), r1=52(y), r2=31(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 52
LDI r2, 31
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
