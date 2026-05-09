; DESCRIPTION: Draws a black rectangle at (105, 125) with width 58 and height 69.
; PLAN: r0=105(x), r1=125(y), r2=58(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 125
LDI r2, 58
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
