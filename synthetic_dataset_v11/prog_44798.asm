; DESCRIPTION: Creates a green rectangular region at (156, 134) spanning 99 by 110 pixels.
; PLAN: r0=156(x), r1=134(y), r2=99(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 134
LDI r2, 99
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
