; DESCRIPTION: Draws a yellow rectangle at (138, 69) with width 14 and height 33.
; PLAN: r0=138(x), r1=69(y), r2=14(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 69
LDI r2, 14
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
