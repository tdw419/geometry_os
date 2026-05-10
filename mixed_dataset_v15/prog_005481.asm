; DESCRIPTION: Draws a orange rectangle at (265, 104) with width 114 and height 118.
; PLAN: r0=265(x), r1=104(y), r2=114(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 104
LDI r2, 114
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
