; DESCRIPTION: Draws a blue rectangle at (191, 139) with width 35 and height 47.
; PLAN: r0=191(x), r1=139(y), r2=35(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 139
LDI r2, 35
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
