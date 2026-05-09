; DESCRIPTION: Draws a white rectangle at (162, 4) with width 75 and height 99.
; PLAN: r0=162(x), r1=4(y), r2=75(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 4
LDI r2, 75
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
