; DESCRIPTION: Draws a orange rectangle at (78, 116) with width 11 and height 10.
; PLAN: r0=78(x), r1=116(y), r2=11(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 116
LDI r2, 11
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
