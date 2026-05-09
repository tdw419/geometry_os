; DESCRIPTION: Draws a yellow rectangle at (49, 138) with width 118 and height 103.
; PLAN: r0=49(x), r1=138(y), r2=118(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 138
LDI r2, 118
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
