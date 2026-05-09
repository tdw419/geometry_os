; DESCRIPTION: Draws a red rectangle at (54, 143) with width 118 and height 52.
; PLAN: r0=54(x), r1=143(y), r2=118(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 143
LDI r2, 118
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
