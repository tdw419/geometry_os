; DESCRIPTION: Draws a green rectangle at (223, 135) with width 69 and height 66.
; PLAN: r0=223(x), r1=135(y), r2=69(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 135
LDI r2, 69
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
