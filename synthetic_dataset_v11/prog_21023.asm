; DESCRIPTION: Draws a yellow rectangle at (77, 69) with width 106 and height 17.
; PLAN: r0=77(x), r1=69(y), r2=106(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 69
LDI r2, 106
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
