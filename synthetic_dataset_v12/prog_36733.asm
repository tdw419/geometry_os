; DESCRIPTION: Draws a black rectangle at (76, 73) with width 26 and height 104.
; PLAN: r0=76(x), r1=73(y), r2=26(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 73
LDI r2, 26
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
