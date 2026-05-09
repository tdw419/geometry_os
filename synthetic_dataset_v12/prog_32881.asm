; DESCRIPTION: Draws a orange rectangle at (10, 110) with width 67 and height 15.
; PLAN: r0=10(x), r1=110(y), r2=67(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 110
LDI r2, 67
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
