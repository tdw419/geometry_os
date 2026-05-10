; DESCRIPTION: Draws a blue rectangle at (323, 145) with width 119 and height 16.
; PLAN: r0=323(x), r1=145(y), r2=119(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 145
LDI r2, 119
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
