; DESCRIPTION: Draws a green rectangle at (122, 47) with width 105 and height 49.
; PLAN: r0=122(x), r1=47(y), r2=105(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 47
LDI r2, 105
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
