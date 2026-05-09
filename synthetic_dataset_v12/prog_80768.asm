; DESCRIPTION: Draws a orange rectangle at (222, 68) with width 88 and height 67.
; PLAN: r0=222(x), r1=68(y), r2=88(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 68
LDI r2, 88
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
