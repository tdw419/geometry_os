; DESCRIPTION: Draws a magenta rectangle at (110, 203) with width 20 and height 41.
; PLAN: r0=110(x), r1=203(y), r2=20(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 203
LDI r2, 20
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
