; DESCRIPTION: Draws a orange rectangle at (56, 174) with width 38 and height 73.
; PLAN: r0=56(x), r1=174(y), r2=38(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 174
LDI r2, 38
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
