; DESCRIPTION: Draws a white rectangle at (130, 22) with width 114 and height 73.
; PLAN: r0=130(x), r1=22(y), r2=114(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 22
LDI r2, 114
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
