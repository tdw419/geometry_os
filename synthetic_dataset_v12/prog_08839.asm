; DESCRIPTION: Draws a yellow rectangle at (121, 52) with width 67 and height 109.
; PLAN: r0=121(x), r1=52(y), r2=67(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 52
LDI r2, 67
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
