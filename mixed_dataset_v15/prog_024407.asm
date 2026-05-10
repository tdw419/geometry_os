; DESCRIPTION: Draws a blue rectangle at (357, 110) with width 51 and height 96.
; PLAN: r0=357(x), r1=110(y), r2=51(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 110
LDI r2, 51
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
