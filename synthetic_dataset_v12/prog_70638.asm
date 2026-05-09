; DESCRIPTION: Draws a blue rectangle at (282, 139) with width 115 and height 114.
; PLAN: r0=282(x), r1=139(y), r2=115(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 139
LDI r2, 115
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
