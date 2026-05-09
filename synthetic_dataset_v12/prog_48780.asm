; DESCRIPTION: Draws a white rectangle at (88, 97) with width 58 and height 33.
; PLAN: r0=88(x), r1=97(y), r2=58(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 97
LDI r2, 58
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
