; DESCRIPTION: Draws a yellow rectangle at (33, 26) with width 105 and height 29.
; PLAN: r0=33(x), r1=26(y), r2=105(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 26
LDI r2, 105
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
