; DESCRIPTION: Draws a orange rectangle at (214, 155) with width 119 and height 99.
; PLAN: r0=214(x), r1=155(y), r2=119(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 155
LDI r2, 119
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
