; DESCRIPTION: Draws a blue rectangle at (339, 64) with width 43 and height 75.
; PLAN: r0=339(x), r1=64(y), r2=43(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 64
LDI r2, 43
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
