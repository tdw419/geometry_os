; DESCRIPTION: Draws a blue rectangle at (33, 69) with width 49 and height 55.
; PLAN: r0=33(x), r1=69(y), r2=49(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 69
LDI r2, 49
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
