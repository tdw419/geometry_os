; DESCRIPTION: Draws a orange rectangle at (58, 52) with width 75 and height 53.
; PLAN: r0=58(x), r1=52(y), r2=75(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 52
LDI r2, 75
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
