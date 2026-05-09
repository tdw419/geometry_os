; DESCRIPTION: Draws a black rectangle at (14, 72) with width 52 and height 104.
; PLAN: r0=14(x), r1=72(y), r2=52(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 72
LDI r2, 52
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
