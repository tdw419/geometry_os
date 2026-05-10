; DESCRIPTION: Draws a blue rectangle at (19, 76) with width 36 and height 75.
; PLAN: r0=19(x), r1=76(y), r2=36(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 76
LDI r2, 36
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
