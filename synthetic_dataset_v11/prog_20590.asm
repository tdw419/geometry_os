; DESCRIPTION: Draws a orange rectangle at (115, 38) with width 102 and height 51.
; PLAN: r0=115(x), r1=38(y), r2=102(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 38
LDI r2, 102
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
