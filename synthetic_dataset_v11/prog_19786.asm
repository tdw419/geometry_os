; DESCRIPTION: Draws a orange rectangle at (30, 104) with width 90 and height 114.
; PLAN: r0=30(x), r1=104(y), r2=90(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 104
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
