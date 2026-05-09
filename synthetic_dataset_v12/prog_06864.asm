; DESCRIPTION: Draws a blue rectangle at (185, 53) with width 22 and height 104.
; PLAN: r0=185(x), r1=53(y), r2=22(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 53
LDI r2, 22
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
