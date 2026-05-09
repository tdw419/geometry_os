; DESCRIPTION: Draws a green rectangle at (139, 106) with width 77 and height 92.
; PLAN: r0=139(x), r1=106(y), r2=77(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 106
LDI r2, 77
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
