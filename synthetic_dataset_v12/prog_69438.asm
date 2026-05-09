; DESCRIPTION: Draws a blue rectangle at (147, 31) with width 20 and height 75.
; PLAN: r0=147(x), r1=31(y), r2=20(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 31
LDI r2, 20
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
