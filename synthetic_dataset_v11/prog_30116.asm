; DESCRIPTION: Draws a blue rectangle at (142, 66) with width 19 and height 76.
; PLAN: r0=142(x), r1=66(y), r2=19(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 66
LDI r2, 19
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
