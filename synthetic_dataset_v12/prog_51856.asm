; DESCRIPTION: Creates a green rectangular region at (169, 91) spanning 96 by 89 pixels.
; PLAN: r0=169(x), r1=91(y), r2=96(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 91
LDI r2, 96
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
