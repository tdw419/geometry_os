; DESCRIPTION: Draws a blue rectangle at (318, 101) with width 90 and height 74.
; PLAN: r0=318(x), r1=101(y), r2=90(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 101
LDI r2, 90
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
