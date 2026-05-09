; DESCRIPTION: Draws a blue rectangle at (115, 165) with width 89 and height 70.
; PLAN: r0=115(x), r1=165(y), r2=89(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 165
LDI r2, 89
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
