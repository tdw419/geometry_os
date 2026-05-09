; DESCRIPTION: Draws a red rectangle at (179, 143) with width 118 and height 47.
; PLAN: r0=179(x), r1=143(y), r2=118(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 143
LDI r2, 118
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
