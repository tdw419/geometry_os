; DESCRIPTION: Draws a yellow rectangle at (67, 163) with width 85 and height 90.
; PLAN: r0=67(x), r1=163(y), r2=85(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 163
LDI r2, 85
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
