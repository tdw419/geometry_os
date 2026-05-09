; DESCRIPTION: Draws a white rectangle at (104, 164) with width 73 and height 88.
; PLAN: r0=104(x), r1=164(y), r2=73(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 164
LDI r2, 73
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
