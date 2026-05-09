; DESCRIPTION: Draws a blue rectangle at (145, 84) with width 28 and height 77.
; PLAN: r0=145(x), r1=84(y), r2=28(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 84
LDI r2, 28
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
