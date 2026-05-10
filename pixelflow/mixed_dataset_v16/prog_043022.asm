; DESCRIPTION: Draws a blue rectangle at (283, 97) with width 67 and height 58.
; PLAN: r0=283(x), r1=97(y), r2=67(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 97
LDI r2, 67
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
