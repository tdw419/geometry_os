; DESCRIPTION: Draws a blue rectangle at (67, 76) with width 106 and height 11.
; PLAN: r0=67(x), r1=76(y), r2=106(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 76
LDI r2, 106
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
