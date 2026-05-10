; DESCRIPTION: Draws a orange rectangle at (62, 193) with width 73 and height 117.
; PLAN: r0=62(x), r1=193(y), r2=73(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 193
LDI r2, 73
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
