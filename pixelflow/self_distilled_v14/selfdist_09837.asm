; DESCRIPTION: Draws a purple rectangle at (55, 69) with width 37 and height 16.
; PLAN: r0=55(x), r1=69(y), r2=37(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 69
LDI r2, 37
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
