; DESCRIPTION: Draws a blue rectangle at (87, 22) with width 51 and height 99.
; PLAN: r0=87(x), r1=22(y), r2=51(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 22
LDI r2, 51
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
