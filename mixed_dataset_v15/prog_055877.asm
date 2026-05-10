; DESCRIPTION: Creates a green rectangular region at (165, 170) spanning 97 by 49 pixels.
; PLAN: r0=165(x), r1=170(y), r2=97(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 170
LDI r2, 97
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
