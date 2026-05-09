; DESCRIPTION: Draws a blue rectangle at (104, 88) with width 10 and height 91.
; PLAN: r0=104(x), r1=88(y), r2=10(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 88
LDI r2, 10
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
