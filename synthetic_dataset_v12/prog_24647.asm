; DESCRIPTION: Draws a orange rectangle at (31, 78) with width 38 and height 78.
; PLAN: r0=31(x), r1=78(y), r2=38(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 78
LDI r2, 38
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
