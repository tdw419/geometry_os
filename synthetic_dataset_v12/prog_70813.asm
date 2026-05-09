; DESCRIPTION: Draws a orange rectangle at (55, 61) with width 67 and height 66.
; PLAN: r0=55(x), r1=61(y), r2=67(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 61
LDI r2, 67
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
