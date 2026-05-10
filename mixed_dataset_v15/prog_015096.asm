; DESCRIPTION: Draws a blue rectangle at (140, 122) with width 75 and height 105.
; PLAN: r0=140(x), r1=122(y), r2=75(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 122
LDI r2, 75
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
