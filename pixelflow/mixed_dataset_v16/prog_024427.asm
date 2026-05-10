; DESCRIPTION: Draws a white rectangle at (378, 106) with width 53 and height 86.
; PLAN: r0=378(x), r1=106(y), r2=53(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 106
LDI r2, 53
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
