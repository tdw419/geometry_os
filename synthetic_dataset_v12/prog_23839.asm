; DESCRIPTION: Draws a red rectangle at (229, 123) with width 67 and height 35.
; PLAN: r0=229(x), r1=123(y), r2=67(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 123
LDI r2, 67
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
