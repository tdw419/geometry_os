; DESCRIPTION: Draws a orange rectangle at (178, 1) with width 75 and height 25.
; PLAN: r0=178(x), r1=1(y), r2=75(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 1
LDI r2, 75
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
