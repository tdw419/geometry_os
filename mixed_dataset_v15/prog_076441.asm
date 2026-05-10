; DESCRIPTION: Draws a orange rectangle at (159, 122) with width 46 and height 79.
; PLAN: r0=159(x), r1=122(y), r2=46(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 122
LDI r2, 46
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
