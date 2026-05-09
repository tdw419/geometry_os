; DESCRIPTION: Creates a green rectangular region at (272, 185) spanning 36 by 22 pixels.
; PLAN: r0=272(x), r1=185(y), r2=36(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 185
LDI r2, 36
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
