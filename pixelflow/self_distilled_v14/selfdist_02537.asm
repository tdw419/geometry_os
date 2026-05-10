; DESCRIPTION: Draws a green rectangle at (120, 118) with width 11 and height 73.
; PLAN: r0=120(x), r1=118(y), r2=11(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 118
LDI r2, 11
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
