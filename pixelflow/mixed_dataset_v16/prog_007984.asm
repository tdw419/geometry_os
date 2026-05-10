; DESCRIPTION: Draws a blue rectangle at (313, 185) with width 66 and height 23.
; PLAN: r0=313(x), r1=185(y), r2=66(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 185
LDI r2, 66
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
