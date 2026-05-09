; DESCRIPTION: Draws a orange rectangle at (12, 0) with width 88 and height 87.
; PLAN: r0=12(x), r1=0(y), r2=88(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 0
LDI r2, 88
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
