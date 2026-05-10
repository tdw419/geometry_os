; DESCRIPTION: Creates a green rectangular region at (195, 1) spanning 91 by 23 pixels.
; PLAN: r0=195(x), r1=1(y), r2=91(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 1
LDI r2, 91
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
