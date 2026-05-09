; DESCRIPTION: Draws a orange rectangle at (34, 51) with width 19 and height 105.
; PLAN: r0=34(x), r1=51(y), r2=19(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 51
LDI r2, 19
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
