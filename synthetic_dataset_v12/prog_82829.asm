; DESCRIPTION: Draws a yellow rectangle at (313, 153) with width 106 and height 86.
; PLAN: r0=313(x), r1=153(y), r2=106(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 153
LDI r2, 106
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
