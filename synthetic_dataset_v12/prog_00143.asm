; DESCRIPTION: Draws a blue rectangle at (355, 119) with width 87 and height 11.
; PLAN: r0=355(x), r1=119(y), r2=87(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 119
LDI r2, 87
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
