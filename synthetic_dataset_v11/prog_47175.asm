; DESCRIPTION: Draws a blue rectangle at (134, 7) with width 55 and height 110.
; PLAN: r0=134(x), r1=7(y), r2=55(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 7
LDI r2, 55
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
