; DESCRIPTION: Draws a yellow rectangle at (201, 166) with width 67 and height 29.
; PLAN: r0=201(x), r1=166(y), r2=67(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 166
LDI r2, 67
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
