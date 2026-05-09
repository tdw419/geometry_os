; DESCRIPTION: Draws a orange rectangle at (62, 68) with width 39 and height 89.
; PLAN: r0=62(x), r1=68(y), r2=39(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 68
LDI r2, 39
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
