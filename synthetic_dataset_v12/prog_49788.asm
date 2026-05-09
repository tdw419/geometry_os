; DESCRIPTION: Draws a white rectangle at (36, 106) with width 77 and height 95.
; PLAN: r0=36(x), r1=106(y), r2=77(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 106
LDI r2, 77
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
