; DESCRIPTION: Draws a black rectangle at (77, 124) with width 66 and height 119.
; PLAN: r0=77(x), r1=124(y), r2=66(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 124
LDI r2, 66
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
