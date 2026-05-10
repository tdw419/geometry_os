; DESCRIPTION: Draws a white rectangle at (347, 87) with width 114 and height 97.
; PLAN: r0=347(x), r1=87(y), r2=114(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 87
LDI r2, 114
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
