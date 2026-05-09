; DESCRIPTION: Draws a purple rectangle at (320, 122) with width 91 and height 69.
; PLAN: r0=320(x), r1=122(y), r2=91(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 122
LDI r2, 91
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
