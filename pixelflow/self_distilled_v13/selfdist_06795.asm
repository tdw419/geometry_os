; DESCRIPTION: Draws a red rectangle at (193, 118) with width 110 and height 52.
; PLAN: r0=193(x), r1=118(y), r2=110(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 118
LDI r2, 110
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
