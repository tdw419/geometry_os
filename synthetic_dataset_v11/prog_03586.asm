; DESCRIPTION: Draws a blue rectangle at (69, 203) with width 83 and height 35.
; PLAN: r0=69(x), r1=203(y), r2=83(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 203
LDI r2, 83
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
