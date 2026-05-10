; DESCRIPTION: Draws a orange rectangle at (39, 5) with width 35 and height 110.
; PLAN: r0=39(x), r1=5(y), r2=35(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 5
LDI r2, 35
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
