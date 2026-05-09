; DESCRIPTION: Creates a green rectangular region at (84, 106) spanning 100 by 21 pixels.
; PLAN: r0=84(x), r1=106(y), r2=100(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 106
LDI r2, 100
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
