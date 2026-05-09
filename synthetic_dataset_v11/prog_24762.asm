; DESCRIPTION: Draws a green rectangle at (109, 118) with width 27 and height 106.
; PLAN: r0=109(x), r1=118(y), r2=27(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 118
LDI r2, 27
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
