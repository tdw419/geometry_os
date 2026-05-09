; DESCRIPTION: Draws a white rectangle at (44, 66) with width 114 and height 20.
; PLAN: r0=44(x), r1=66(y), r2=114(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 66
LDI r2, 114
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
