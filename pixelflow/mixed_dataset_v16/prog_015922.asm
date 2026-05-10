; DESCRIPTION: Draws a orange rectangle at (139, 63) with width 25 and height 102.
; PLAN: r0=139(x), r1=63(y), r2=25(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 63
LDI r2, 25
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
