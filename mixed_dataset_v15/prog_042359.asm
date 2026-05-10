; DESCRIPTION: Creates a green rectangular region at (250, 52) spanning 22 by 45 pixels.
; PLAN: r0=250(x), r1=52(y), r2=22(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 52
LDI r2, 22
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
