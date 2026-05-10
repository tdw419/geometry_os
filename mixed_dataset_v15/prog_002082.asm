; DESCRIPTION: Draws a orange rectangle at (181, 141) with width 43 and height 102.
; PLAN: r0=181(x), r1=141(y), r2=43(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 141
LDI r2, 43
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
