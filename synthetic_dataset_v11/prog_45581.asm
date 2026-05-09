; DESCRIPTION: Draws a white rectangle at (116, 12) with width 98 and height 89.
; PLAN: r0=116(x), r1=12(y), r2=98(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 12
LDI r2, 98
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
