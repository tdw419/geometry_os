; DESCRIPTION: Draws a blue rectangle at (63, 123) with width 18 and height 88.
; PLAN: r0=63(x), r1=123(y), r2=18(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 123
LDI r2, 18
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
