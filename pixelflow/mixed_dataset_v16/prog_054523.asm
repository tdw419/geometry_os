; DESCRIPTION: Draws a orange rectangle at (301, 153) with width 53 and height 88.
; PLAN: r0=301(x), r1=153(y), r2=53(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 153
LDI r2, 53
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
