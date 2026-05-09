; DESCRIPTION: Draws a orange rectangle at (316, 96) with width 67 and height 104.
; PLAN: r0=316(x), r1=96(y), r2=67(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 96
LDI r2, 67
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
