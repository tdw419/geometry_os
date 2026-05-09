; DESCRIPTION: Draws a green rectangle at (332, 89) with width 67 and height 101.
; PLAN: r0=332(x), r1=89(y), r2=67(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 89
LDI r2, 67
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
