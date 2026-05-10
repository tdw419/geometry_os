; DESCRIPTION: Draws a orange rectangle at (36, 153) with width 114 and height 55.
; PLAN: r0=36(x), r1=153(y), r2=114(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 153
LDI r2, 114
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
