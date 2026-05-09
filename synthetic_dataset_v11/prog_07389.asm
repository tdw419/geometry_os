; DESCRIPTION: Draws a blue rectangle at (30, 158) with width 94 and height 23.
; PLAN: r0=30(x), r1=158(y), r2=94(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 158
LDI r2, 94
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
