; DESCRIPTION: Draws a green rectangle at (124, 77) with width 72 and height 91.
; PLAN: r0=124(x), r1=77(y), r2=72(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 77
LDI r2, 72
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
