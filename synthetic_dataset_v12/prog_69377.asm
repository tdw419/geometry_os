; DESCRIPTION: Draws a orange rectangle at (11, 68) with width 35 and height 46.
; PLAN: r0=11(x), r1=68(y), r2=35(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 68
LDI r2, 35
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
