; DESCRIPTION: Draws a blue rectangle at (283, 104) with width 105 and height 101.
; PLAN: r0=283(x), r1=104(y), r2=105(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 104
LDI r2, 105
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
