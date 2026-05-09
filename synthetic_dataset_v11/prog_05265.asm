; DESCRIPTION: Draws a orange rectangle at (88, 151) with width 43 and height 28.
; PLAN: r0=88(x), r1=151(y), r2=43(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 151
LDI r2, 43
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
