; DESCRIPTION: Draws a black rectangle at (5, 135) with width 104 and height 13.
; PLAN: r0=5(x), r1=135(y), r2=104(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 135
LDI r2, 104
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
