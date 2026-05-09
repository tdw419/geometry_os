; DESCRIPTION: Draws a white rectangle at (91, 77) with width 118 and height 98.
; PLAN: r0=91(x), r1=77(y), r2=118(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 77
LDI r2, 118
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
