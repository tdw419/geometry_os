; DESCRIPTION: Draws a orange rectangle at (2, 51) with width 79 and height 83.
; PLAN: r0=2(x), r1=51(y), r2=79(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 51
LDI r2, 79
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
