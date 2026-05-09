; DESCRIPTION: Draws a white rectangle at (148, 89) with width 81 and height 102.
; PLAN: r0=148(x), r1=89(y), r2=81(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 89
LDI r2, 81
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
