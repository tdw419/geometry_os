; DESCRIPTION: Draws a blue rectangle at (144, 148) with width 31 and height 26.
; PLAN: r0=144(x), r1=148(y), r2=31(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 148
LDI r2, 31
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
