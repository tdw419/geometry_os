; DESCRIPTION: Creates a green rectangular region at (140, 13) spanning 24 by 26 pixels.
; PLAN: r0=140(x), r1=13(y), r2=24(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 13
LDI r2, 24
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
