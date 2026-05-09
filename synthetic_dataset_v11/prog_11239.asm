; DESCRIPTION: Draws a blue rectangle at (184, 115) with width 13 and height 38.
; PLAN: r0=184(x), r1=115(y), r2=13(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 115
LDI r2, 13
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
