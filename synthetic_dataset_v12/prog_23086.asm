; DESCRIPTION: Draws a orange rectangle at (51, 75) with width 102 and height 77.
; PLAN: r0=51(x), r1=75(y), r2=102(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 75
LDI r2, 102
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
