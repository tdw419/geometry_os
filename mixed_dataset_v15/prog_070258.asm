; DESCRIPTION: Draws a red rectangle at (177, 105) with width 91 and height 89.
; PLAN: r0=177(x), r1=105(y), r2=91(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 105
LDI r2, 91
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
