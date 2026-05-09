; DESCRIPTION: Draws a yellow rectangle at (76, 81) with width 77 and height 119.
; PLAN: r0=76(x), r1=81(y), r2=77(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 81
LDI r2, 77
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
