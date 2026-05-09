; DESCRIPTION: Draws a yellow rectangle at (29, 176) with width 117 and height 67.
; PLAN: r0=29(x), r1=176(y), r2=117(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 176
LDI r2, 117
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
