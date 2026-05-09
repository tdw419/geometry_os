; DESCRIPTION: Draws a orange rectangle at (203, 99) with width 34 and height 105.
; PLAN: r0=203(x), r1=99(y), r2=34(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 99
LDI r2, 34
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
