; DESCRIPTION: Creates a green rectangular region at (406, 101) spanning 80 by 106 pixels.
; PLAN: r0=406(x), r1=101(y), r2=80(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 101
LDI r2, 80
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
