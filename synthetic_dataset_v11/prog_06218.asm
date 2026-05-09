; DESCRIPTION: Draws a orange rectangle at (84, 203) with width 97 and height 17.
; PLAN: r0=84(x), r1=203(y), r2=97(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 203
LDI r2, 97
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
