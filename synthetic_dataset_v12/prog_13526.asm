; DESCRIPTION: Creates a green rectangular region at (240, 201) spanning 80 by 46 pixels.
; PLAN: r0=240(x), r1=201(y), r2=80(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 201
LDI r2, 80
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
