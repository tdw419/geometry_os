; DESCRIPTION: Draws a black rectangle at (104, 36) with width 117 and height 74.
; PLAN: r0=104(x), r1=36(y), r2=117(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 36
LDI r2, 117
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
