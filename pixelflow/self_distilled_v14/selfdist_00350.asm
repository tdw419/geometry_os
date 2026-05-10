; DESCRIPTION: Draws a blue rectangle at (39, 194) with width 78 and height 69.
; PLAN: r0=39(x), r1=194(y), r2=78(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 194
LDI r2, 78
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
