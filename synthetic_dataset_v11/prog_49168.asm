; DESCRIPTION: Draws a yellow rectangle at (61, 114) with width 43 and height 15.
; PLAN: r0=61(x), r1=114(y), r2=43(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 114
LDI r2, 43
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
