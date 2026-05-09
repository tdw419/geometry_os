; DESCRIPTION: Creates a green rectangular region at (116, 119) spanning 23 by 89 pixels.
; PLAN: r0=116(x), r1=119(y), r2=23(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 119
LDI r2, 23
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
