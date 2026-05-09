; DESCRIPTION: Draws a white rectangle at (343, 67) with width 83 and height 106.
; PLAN: r0=343(x), r1=67(y), r2=83(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 67
LDI r2, 83
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
