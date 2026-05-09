; DESCRIPTION: Draws a blue rectangle at (184, 216) with width 52 and height 10.
; PLAN: r0=184(x), r1=216(y), r2=52(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 216
LDI r2, 52
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
