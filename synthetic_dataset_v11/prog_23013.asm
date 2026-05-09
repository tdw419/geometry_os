; DESCRIPTION: Draws a black rectangle at (58, 96) with width 94 and height 104.
; PLAN: r0=58(x), r1=96(y), r2=94(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 96
LDI r2, 94
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
