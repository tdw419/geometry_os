; DESCRIPTION: Draws a orange rectangle at (111, 35) with width 31 and height 106.
; PLAN: r0=111(x), r1=35(y), r2=31(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 35
LDI r2, 31
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
