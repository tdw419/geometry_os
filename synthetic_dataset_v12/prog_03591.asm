; DESCRIPTION: Draws a red rectangle at (88, 123) with width 67 and height 36.
; PLAN: r0=88(x), r1=123(y), r2=67(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 123
LDI r2, 67
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
