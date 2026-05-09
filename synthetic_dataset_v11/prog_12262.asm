; DESCRIPTION: Draws a blue rectangle at (74, 105) with width 84 and height 52.
; PLAN: r0=74(x), r1=105(y), r2=84(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 105
LDI r2, 84
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
