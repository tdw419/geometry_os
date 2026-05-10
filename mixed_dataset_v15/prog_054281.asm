; DESCRIPTION: Draws a yellow rectangle at (375, 90) with width 67 and height 112.
; PLAN: r0=375(x), r1=90(y), r2=67(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 90
LDI r2, 67
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
