; DESCRIPTION: Draws a white rectangle at (268, 139) with width 81 and height 114.
; PLAN: r0=268(x), r1=139(y), r2=81(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 139
LDI r2, 81
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
