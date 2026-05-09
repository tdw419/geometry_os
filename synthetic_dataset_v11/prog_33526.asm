; DESCRIPTION: Draws a orange rectangle at (165, 51) with width 75 and height 40.
; PLAN: r0=165(x), r1=51(y), r2=75(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 51
LDI r2, 75
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
