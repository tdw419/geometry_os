; DESCRIPTION: Draws a white rectangle at (40, 144) with width 44 and height 97.
; PLAN: r0=40(x), r1=144(y), r2=44(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 144
LDI r2, 44
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
