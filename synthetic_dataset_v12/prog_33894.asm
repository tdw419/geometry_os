; DESCRIPTION: Draws a white rectangle at (33, 97) with width 48 and height 106.
; PLAN: r0=33(x), r1=97(y), r2=48(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 97
LDI r2, 48
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
