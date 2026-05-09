; DESCRIPTION: Creates a blue rectangular region at (115, 99) spanning 78 by 97 pixels.
; PLAN: r0=115(x), r1=99(y), r2=78(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 99
LDI r2, 78
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
