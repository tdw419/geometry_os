; DESCRIPTION: Draws a blue rectangle at (250, 96) with width 18 and height 43.
; PLAN: r0=250(x), r1=96(y), r2=18(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 96
LDI r2, 18
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
