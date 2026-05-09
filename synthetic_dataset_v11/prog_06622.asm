; DESCRIPTION: Draws a orange rectangle at (56, 43) with width 117 and height 89.
; PLAN: r0=56(x), r1=43(y), r2=117(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 43
LDI r2, 117
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
