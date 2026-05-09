; DESCRIPTION: Draws a red rectangle at (80, 93) with width 118 and height 78.
; PLAN: r0=80(x), r1=93(y), r2=118(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 93
LDI r2, 118
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
