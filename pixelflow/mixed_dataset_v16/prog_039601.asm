; DESCRIPTION: Draws a white rectangle at (116, 31) with width 94 and height 35.
; PLAN: r0=116(x), r1=31(y), r2=94(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 31
LDI r2, 94
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
