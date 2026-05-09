; DESCRIPTION: Draws a blue rectangle at (278, 110) with width 71 and height 104.
; PLAN: r0=278(x), r1=110(y), r2=71(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 110
LDI r2, 71
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
