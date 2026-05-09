; DESCRIPTION: Draws a orange rectangle at (122, 77) with width 113 and height 69.
; PLAN: r0=122(x), r1=77(y), r2=113(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 77
LDI r2, 113
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
