; DESCRIPTION: Draws a blue rectangle at (84, 45) with width 30 and height 37.
; PLAN: r0=84(x), r1=45(y), r2=30(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 45
LDI r2, 30
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
