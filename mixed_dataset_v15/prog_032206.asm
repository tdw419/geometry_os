; DESCRIPTION: Draws a orange rectangle at (74, 68) with width 102 and height 74.
; PLAN: r0=74(x), r1=68(y), r2=102(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 68
LDI r2, 102
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
