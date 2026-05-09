; DESCRIPTION: Creates a green rectangular region at (272, 176) spanning 31 by 20 pixels.
; PLAN: r0=272(x), r1=176(y), r2=31(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 176
LDI r2, 31
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
