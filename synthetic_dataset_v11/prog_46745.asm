; DESCRIPTION: Draws a black rectangle at (76, 75) with width 104 and height 46.
; PLAN: r0=76(x), r1=75(y), r2=104(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 75
LDI r2, 104
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
