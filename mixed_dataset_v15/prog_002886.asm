; DESCRIPTION: Draws a black rectangle at (356, 78) with width 101 and height 104.
; PLAN: r0=356(x), r1=78(y), r2=101(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 78
LDI r2, 101
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
