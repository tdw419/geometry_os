; DESCRIPTION: Draws a orange rectangle at (76, 114) with width 58 and height 15.
; PLAN: r0=76(x), r1=114(y), r2=58(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 114
LDI r2, 58
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
