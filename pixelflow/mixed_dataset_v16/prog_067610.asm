; DESCRIPTION: Draws a magenta rectangle at (316, 175) with width 104 and height 66.
; PLAN: r0=316(x), r1=175(y), r2=104(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 175
LDI r2, 104
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
