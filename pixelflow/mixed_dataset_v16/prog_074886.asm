; DESCRIPTION: Draws a yellow rectangle at (222, 60) with width 52 and height 67.
; PLAN: r0=222(x), r1=60(y), r2=52(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 60
LDI r2, 52
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
