; DESCRIPTION: Draws a blue rectangle at (201, 136) with width 79 and height 23.
; PLAN: r0=201(x), r1=136(y), r2=79(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 136
LDI r2, 79
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
