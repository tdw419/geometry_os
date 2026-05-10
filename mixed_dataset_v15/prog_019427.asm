; DESCRIPTION: Draws a black rectangle at (407, 183) with width 26 and height 15.
; PLAN: r0=407(x), r1=183(y), r2=26(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 183
LDI r2, 26
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
