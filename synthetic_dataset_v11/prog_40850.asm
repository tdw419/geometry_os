; DESCRIPTION: Draws a green rectangle at (112, 76) with width 102 and height 80.
; PLAN: r0=112(x), r1=76(y), r2=102(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 76
LDI r2, 102
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
