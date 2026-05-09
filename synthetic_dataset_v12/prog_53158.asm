; DESCRIPTION: Draws a green rectangle at (250, 137) with width 81 and height 81.
; PLAN: r0=250(x), r1=137(y), r2=81(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 137
LDI r2, 81
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
