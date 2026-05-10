; DESCRIPTION: Draws a orange rectangle at (91, 101) with width 21 and height 55.
; PLAN: r0=91(x), r1=101(y), r2=21(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 101
LDI r2, 21
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
