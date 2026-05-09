; DESCRIPTION: Draws a orange rectangle at (82, 52) with width 100 and height 80.
; PLAN: r0=82(x), r1=52(y), r2=100(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 52
LDI r2, 100
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
