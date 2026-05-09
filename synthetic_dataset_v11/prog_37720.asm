; DESCRIPTION: Creates a green rectangular region at (93, 5) spanning 110 by 119 pixels.
; PLAN: r0=93(x), r1=5(y), r2=110(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 5
LDI r2, 110
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
