; DESCRIPTION: Draws a yellow rectangle at (133, 67) with width 78 and height 100.
; PLAN: r0=133(x), r1=67(y), r2=78(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 67
LDI r2, 78
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
