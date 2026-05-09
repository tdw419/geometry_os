; DESCRIPTION: Draws a red rectangle at (85, 81) with width 118 and height 77.
; PLAN: r0=85(x), r1=81(y), r2=118(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 81
LDI r2, 118
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
