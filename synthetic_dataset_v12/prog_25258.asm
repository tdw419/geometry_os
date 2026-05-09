; DESCRIPTION: Draws a orange rectangle at (287, 87) with width 114 and height 112.
; PLAN: r0=287(x), r1=87(y), r2=114(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 87
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
