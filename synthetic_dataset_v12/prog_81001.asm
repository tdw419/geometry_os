; DESCRIPTION: Draws a black rectangle at (372, 9) with width 88 and height 116.
; PLAN: r0=372(x), r1=9(y), r2=88(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 9
LDI r2, 88
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
