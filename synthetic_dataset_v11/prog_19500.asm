; DESCRIPTION: Draws a white rectangle at (37, 106) with width 10 and height 118.
; PLAN: r0=37(x), r1=106(y), r2=10(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 106
LDI r2, 10
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
