; DESCRIPTION: Draws a red rectangle at (261, 123) with width 15 and height 91.
; PLAN: r0=261(x), r1=123(y), r2=15(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 123
LDI r2, 15
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
