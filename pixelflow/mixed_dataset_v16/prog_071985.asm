; DESCRIPTION: Draws a orange rectangle at (223, 185) with width 44 and height 84.
; PLAN: r0=223(x), r1=185(y), r2=44(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 185
LDI r2, 44
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
