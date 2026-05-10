; DESCRIPTION: Draws a red rectangle at (199, 75) with width 114 and height 116.
; PLAN: r0=199(x), r1=75(y), r2=114(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 75
LDI r2, 114
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
