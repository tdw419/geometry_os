; DESCRIPTION: Draws a white rectangle at (144, 97) with width 108 and height 56.
; PLAN: r0=144(x), r1=97(y), r2=108(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 97
LDI r2, 108
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
