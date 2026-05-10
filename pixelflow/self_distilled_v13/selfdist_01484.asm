; DESCRIPTION: Draws a orange rectangle at (40, 199) with width 25 and height 53.
; PLAN: r0=40(x), r1=199(y), r2=25(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 199
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
