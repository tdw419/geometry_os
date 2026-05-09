; DESCRIPTION: Draws a orange rectangle at (70, 99) with width 25 and height 51.
; PLAN: r0=70(x), r1=99(y), r2=25(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 99
LDI r2, 25
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
