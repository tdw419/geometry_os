; DESCRIPTION: Draws a orange rectangle at (316, 39) with width 88 and height 18.
; PLAN: r0=316(x), r1=39(y), r2=88(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 39
LDI r2, 88
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
