; DESCRIPTION: Draws a blue rectangle at (177, 99) with width 119 and height 56.
; PLAN: r0=177(x), r1=99(y), r2=119(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 99
LDI r2, 119
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
