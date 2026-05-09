; DESCRIPTION: Draws a blue rectangle at (233, 181) with width 29 and height 69.
; PLAN: r0=233(x), r1=181(y), r2=29(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 181
LDI r2, 29
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
