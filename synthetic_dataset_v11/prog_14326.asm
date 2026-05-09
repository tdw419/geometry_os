; DESCRIPTION: Draws a orange rectangle at (81, 53) with width 11 and height 65.
; PLAN: r0=81(x), r1=53(y), r2=11(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 53
LDI r2, 11
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
