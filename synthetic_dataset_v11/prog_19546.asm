; DESCRIPTION: Draws a green rectangle at (155, 212) with width 67 and height 35.
; PLAN: r0=155(x), r1=212(y), r2=67(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 212
LDI r2, 67
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
