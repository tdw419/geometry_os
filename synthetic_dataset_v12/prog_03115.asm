; DESCRIPTION: Draws a orange rectangle at (227, 23) with width 20 and height 82.
; PLAN: r0=227(x), r1=23(y), r2=20(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 23
LDI r2, 20
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
