; DESCRIPTION: Draws a blue rectangle at (377, 76) with width 30 and height 74.
; PLAN: r0=377(x), r1=76(y), r2=30(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 76
LDI r2, 30
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
