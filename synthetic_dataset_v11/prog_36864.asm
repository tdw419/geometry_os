; DESCRIPTION: Draws a orange rectangle at (162, 20) with width 51 and height 118.
; PLAN: r0=162(x), r1=20(y), r2=51(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 20
LDI r2, 51
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
