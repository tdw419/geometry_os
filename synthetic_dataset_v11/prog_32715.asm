; DESCRIPTION: Draws a blue rectangle at (26, 203) with width 18 and height 38.
; PLAN: r0=26(x), r1=203(y), r2=18(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 203
LDI r2, 18
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
