; DESCRIPTION: Draws a blue rectangle at (331, 10) with width 69 and height 62.
; PLAN: r0=331(x), r1=10(y), r2=69(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 10
LDI r2, 69
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
