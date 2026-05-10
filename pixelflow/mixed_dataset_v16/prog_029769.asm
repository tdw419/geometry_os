; DESCRIPTION: Draws a orange rectangle at (296, 101) with width 101 and height 49.
; PLAN: r0=296(x), r1=101(y), r2=101(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 101
LDI r2, 101
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
