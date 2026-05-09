; DESCRIPTION: Draws a orange rectangle at (310, 62) with width 69 and height 117.
; PLAN: r0=310(x), r1=62(y), r2=69(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 62
LDI r2, 69
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
