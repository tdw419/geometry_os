; DESCRIPTION: Draws a orange rectangle at (62, 119) with width 54 and height 47.
; PLAN: r0=62(x), r1=119(y), r2=54(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 119
LDI r2, 54
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
