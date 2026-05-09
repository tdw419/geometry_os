; DESCRIPTION: Draws a orange rectangle at (70, 25) with width 110 and height 118.
; PLAN: r0=70(x), r1=25(y), r2=110(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 25
LDI r2, 110
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
