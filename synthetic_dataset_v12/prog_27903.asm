; DESCRIPTION: Draws a orange rectangle at (23, 0) with width 43 and height 10.
; PLAN: r0=23(x), r1=0(y), r2=43(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 0
LDI r2, 43
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
