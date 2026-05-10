; DESCRIPTION: Draws a blue rectangle at (5, 161) with width 93 and height 88.
; PLAN: r0=5(x), r1=161(y), r2=93(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 161
LDI r2, 93
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
