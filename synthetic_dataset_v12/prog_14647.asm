; DESCRIPTION: Draws a red rectangle at (316, 144) with width 18 and height 90.
; PLAN: r0=316(x), r1=144(y), r2=18(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 144
LDI r2, 18
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
