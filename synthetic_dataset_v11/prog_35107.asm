; DESCRIPTION: Draws a orange rectangle at (5, 155) with width 43 and height 40.
; PLAN: r0=5(x), r1=155(y), r2=43(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 155
LDI r2, 43
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
