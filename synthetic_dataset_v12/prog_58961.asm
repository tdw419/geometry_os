; DESCRIPTION: Draws a orange rectangle at (225, 55) with width 106 and height 60.
; PLAN: r0=225(x), r1=55(y), r2=106(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 55
LDI r2, 106
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
