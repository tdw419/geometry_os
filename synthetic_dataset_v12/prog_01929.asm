; DESCRIPTION: Draws a green rectangle at (44, 69) with width 71 and height 46.
; PLAN: r0=44(x), r1=69(y), r2=71(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 69
LDI r2, 71
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
