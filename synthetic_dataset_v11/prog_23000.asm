; DESCRIPTION: Draws a red rectangle at (116, 84) with width 19 and height 81.
; PLAN: r0=116(x), r1=84(y), r2=19(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 84
LDI r2, 19
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
