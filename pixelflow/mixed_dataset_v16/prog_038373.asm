; DESCRIPTION: Draws a blue rectangle at (89, 185) with width 37 and height 48.
; PLAN: r0=89(x), r1=185(y), r2=37(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 185
LDI r2, 37
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
