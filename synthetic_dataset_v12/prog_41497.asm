; DESCRIPTION: Draws a orange rectangle at (100, 52) with width 112 and height 51.
; PLAN: r0=100(x), r1=52(y), r2=112(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 52
LDI r2, 112
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
