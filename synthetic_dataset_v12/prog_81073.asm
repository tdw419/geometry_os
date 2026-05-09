; DESCRIPTION: Draws a black rectangle at (316, 17) with width 55 and height 21.
; PLAN: r0=316(x), r1=17(y), r2=55(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 17
LDI r2, 55
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
