; DESCRIPTION: Draws a blue rectangle at (416, 45) with width 18 and height 69.
; PLAN: r0=416(x), r1=45(y), r2=18(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 45
LDI r2, 18
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
