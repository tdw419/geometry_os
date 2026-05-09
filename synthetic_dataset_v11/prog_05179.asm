; DESCRIPTION: Draws a blue rectangle at (14, 45) with width 70 and height 69.
; PLAN: r0=14(x), r1=45(y), r2=70(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 45
LDI r2, 70
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
