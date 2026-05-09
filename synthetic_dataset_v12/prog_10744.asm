; DESCRIPTION: Creates a green rectangular region at (52, 106) spanning 118 by 24 pixels.
; PLAN: r0=52(x), r1=106(y), r2=118(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 106
LDI r2, 118
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
