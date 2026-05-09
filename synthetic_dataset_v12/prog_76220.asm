; DESCRIPTION: Draws a yellow rectangle at (67, 153) with width 19 and height 20.
; PLAN: r0=67(x), r1=153(y), r2=19(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 153
LDI r2, 19
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
