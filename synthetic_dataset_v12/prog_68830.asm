; DESCRIPTION: Draws a orange rectangle at (102, 155) with width 29 and height 10.
; PLAN: r0=102(x), r1=155(y), r2=29(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 155
LDI r2, 29
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
