; DESCRIPTION: Draws a blue rectangle at (183, 84) with width 69 and height 81.
; PLAN: r0=183(x), r1=84(y), r2=69(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 84
LDI r2, 69
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
