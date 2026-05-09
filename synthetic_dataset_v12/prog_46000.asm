; DESCRIPTION: Draws a blue rectangle at (356, 85) with width 69 and height 78.
; PLAN: r0=356(x), r1=85(y), r2=69(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 85
LDI r2, 69
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
