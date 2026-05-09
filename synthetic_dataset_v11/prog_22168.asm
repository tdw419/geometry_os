; DESCRIPTION: Creates a green rectangular region at (97, 93) spanning 89 by 106 pixels.
; PLAN: r0=97(x), r1=93(y), r2=89(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 93
LDI r2, 89
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
