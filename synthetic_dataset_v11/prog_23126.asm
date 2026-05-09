; DESCRIPTION: Draws a white rectangle at (14, 137) with width 56 and height 118.
; PLAN: r0=14(x), r1=137(y), r2=56(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 137
LDI r2, 56
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
