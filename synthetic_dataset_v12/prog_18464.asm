; DESCRIPTION: Draws a orange rectangle at (122, 114) with width 15 and height 59.
; PLAN: r0=122(x), r1=114(y), r2=15(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 114
LDI r2, 15
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
