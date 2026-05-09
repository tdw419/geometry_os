; DESCRIPTION: Draws a yellow rectangle at (62, 24) with width 10 and height 67.
; PLAN: r0=62(x), r1=24(y), r2=10(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 24
LDI r2, 10
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
