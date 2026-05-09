; DESCRIPTION: Draws a blue rectangle at (79, 30) with width 20 and height 89.
; PLAN: r0=79(x), r1=30(y), r2=20(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 30
LDI r2, 20
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
