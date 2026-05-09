; DESCRIPTION: Draws a black rectangle at (116, 14) with width 86 and height 104.
; PLAN: r0=116(x), r1=14(y), r2=86(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 14
LDI r2, 86
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
