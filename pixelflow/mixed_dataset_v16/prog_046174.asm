; DESCRIPTION: Draws a yellow rectangle at (223, 55) with width 102 and height 112.
; PLAN: r0=223(x), r1=55(y), r2=102(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 55
LDI r2, 102
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
