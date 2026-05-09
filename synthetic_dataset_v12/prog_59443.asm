; DESCRIPTION: Draws a blue rectangle at (100, 96) with width 87 and height 119.
; PLAN: r0=100(x), r1=96(y), r2=87(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 96
LDI r2, 87
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
