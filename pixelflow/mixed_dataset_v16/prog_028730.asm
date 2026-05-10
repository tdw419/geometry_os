; DESCRIPTION: Draws a orange rectangle at (477, 43) with width 12 and height 88.
; PLAN: r0=477(x), r1=43(y), r2=12(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 43
LDI r2, 12
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
