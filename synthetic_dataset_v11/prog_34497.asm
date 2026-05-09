; DESCRIPTION: Draws a yellow rectangle at (67, 90) with width 25 and height 106.
; PLAN: r0=67(x), r1=90(y), r2=25(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 90
LDI r2, 25
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
