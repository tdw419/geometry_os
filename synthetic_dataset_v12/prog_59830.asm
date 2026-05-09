; DESCRIPTION: Draws a white rectangle at (132, 106) with width 75 and height 75.
; PLAN: r0=132(x), r1=106(y), r2=75(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 106
LDI r2, 75
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
