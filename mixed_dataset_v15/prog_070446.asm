; DESCRIPTION: Draws a blue rectangle at (105, 44) with width 97 and height 67.
; PLAN: r0=105(x), r1=44(y), r2=97(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 44
LDI r2, 97
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
