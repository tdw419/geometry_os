; DESCRIPTION: Draws a blue rectangle at (110, 16) with width 51 and height 38.
; PLAN: r0=110(x), r1=16(y), r2=51(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 16
LDI r2, 51
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
