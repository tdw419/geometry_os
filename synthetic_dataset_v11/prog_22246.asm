; DESCRIPTION: Draws a blue rectangle at (9, 17) with width 36 and height 83.
; PLAN: r0=9(x), r1=17(y), r2=36(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 17
LDI r2, 36
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
