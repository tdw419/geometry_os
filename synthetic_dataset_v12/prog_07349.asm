; DESCRIPTION: Draws a blue rectangle at (251, 24) with width 35 and height 69.
; PLAN: r0=251(x), r1=24(y), r2=35(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 24
LDI r2, 35
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
