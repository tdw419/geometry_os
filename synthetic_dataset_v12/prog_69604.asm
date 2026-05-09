; DESCRIPTION: Creates a green rectangular region at (208, 96) spanning 110 by 89 pixels.
; PLAN: r0=208(x), r1=96(y), r2=110(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 96
LDI r2, 110
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
