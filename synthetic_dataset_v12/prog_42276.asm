; DESCRIPTION: Draws a orange rectangle at (296, 43) with width 15 and height 76.
; PLAN: r0=296(x), r1=43(y), r2=15(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 43
LDI r2, 15
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
