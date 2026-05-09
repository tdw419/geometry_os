; DESCRIPTION: Draws a orange rectangle at (0, 91) with width 61 and height 88.
; PLAN: r0=0(x), r1=91(y), r2=61(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 91
LDI r2, 61
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
