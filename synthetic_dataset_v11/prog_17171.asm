; DESCRIPTION: Creates a green rectangular region at (140, 99) spanning 58 by 64 pixels.
; PLAN: r0=140(x), r1=99(y), r2=58(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 99
LDI r2, 58
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
