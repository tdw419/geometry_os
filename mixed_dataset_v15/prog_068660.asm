; DESCRIPTION: Draws a orange rectangle at (141, 34) with width 102 and height 96.
; PLAN: r0=141(x), r1=34(y), r2=102(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 34
LDI r2, 102
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
