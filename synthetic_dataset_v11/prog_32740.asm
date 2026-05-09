; DESCRIPTION: Draws a orange rectangle at (88, 176) with width 95 and height 56.
; PLAN: r0=88(x), r1=176(y), r2=95(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 176
LDI r2, 95
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
