; DESCRIPTION: Draws a white rectangle at (378, 15) with width 35 and height 77.
; PLAN: r0=378(x), r1=15(y), r2=35(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 15
LDI r2, 35
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
