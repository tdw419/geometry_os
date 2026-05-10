; DESCRIPTION: Draws a blue rectangle at (185, 20) with width 78 and height 62.
; PLAN: r0=185(x), r1=20(y), r2=78(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 20
LDI r2, 78
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
