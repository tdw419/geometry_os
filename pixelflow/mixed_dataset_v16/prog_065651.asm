; DESCRIPTION: Draws a green rectangle at (331, 97) with width 119 and height 67.
; PLAN: r0=331(x), r1=97(y), r2=119(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 97
LDI r2, 119
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
