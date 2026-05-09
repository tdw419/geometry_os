; DESCRIPTION: Draws a green rectangle at (43, 151) with width 114 and height 69.
; PLAN: r0=43(x), r1=151(y), r2=114(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 151
LDI r2, 114
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
