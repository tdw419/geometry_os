; DESCRIPTION: Draws a blue rectangle at (8, 115) with width 108 and height 80.
; PLAN: r0=8(x), r1=115(y), r2=108(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 115
LDI r2, 108
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
