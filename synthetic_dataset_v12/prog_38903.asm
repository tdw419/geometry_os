; DESCRIPTION: Creates a green rectangular region at (272, 155) spanning 75 by 10 pixels.
; PLAN: r0=272(x), r1=155(y), r2=75(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 155
LDI r2, 75
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
