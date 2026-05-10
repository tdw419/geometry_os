; DESCRIPTION: Draws a black rectangle at (194, 77) with width 59 and height 89.
; PLAN: r0=194(x), r1=77(y), r2=59(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 77
LDI r2, 59
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
