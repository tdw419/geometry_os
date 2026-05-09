; DESCRIPTION: Creates a green rectangular region at (13, 115) spanning 99 by 14 pixels.
; PLAN: r0=13(x), r1=115(y), r2=99(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 115
LDI r2, 99
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
