; DESCRIPTION: Draws a red rectangle at (47, 66) with width 116 and height 54.
; PLAN: r0=47(x), r1=66(y), r2=116(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 66
LDI r2, 116
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
