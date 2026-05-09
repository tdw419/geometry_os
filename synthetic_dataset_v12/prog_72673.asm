; DESCRIPTION: Draws a blue rectangle at (463, 44) with width 44 and height 88.
; PLAN: r0=463(x), r1=44(y), r2=44(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 44
LDI r2, 44
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
