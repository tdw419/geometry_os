; DESCRIPTION: Draws a orange rectangle at (56, 205) with width 100 and height 43.
; PLAN: r0=56(x), r1=205(y), r2=100(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 205
LDI r2, 100
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
