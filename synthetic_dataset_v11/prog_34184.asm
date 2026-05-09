; DESCRIPTION: Draws a black rectangle at (104, 179) with width 36 and height 17.
; PLAN: r0=104(x), r1=179(y), r2=36(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 179
LDI r2, 36
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
