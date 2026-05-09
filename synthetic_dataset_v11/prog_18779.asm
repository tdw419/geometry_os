; DESCRIPTION: Draws a green rectangle at (46, 69) with width 105 and height 73.
; PLAN: r0=46(x), r1=69(y), r2=105(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 69
LDI r2, 105
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
