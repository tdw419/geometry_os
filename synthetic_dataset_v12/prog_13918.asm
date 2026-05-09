; DESCRIPTION: Draws a blue rectangle at (185, 85) with width 23 and height 51.
; PLAN: r0=185(x), r1=85(y), r2=23(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 85
LDI r2, 23
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
