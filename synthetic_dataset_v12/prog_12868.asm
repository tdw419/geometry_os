; DESCRIPTION: Creates a green rectangular region at (185, 62) spanning 97 by 72 pixels.
; PLAN: r0=185(x), r1=62(y), r2=97(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 62
LDI r2, 97
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
