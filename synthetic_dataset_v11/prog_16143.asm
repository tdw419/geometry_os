; DESCRIPTION: Draws a white rectangle at (85, 101) with width 43 and height 100.
; PLAN: r0=85(x), r1=101(y), r2=43(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 101
LDI r2, 43
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
