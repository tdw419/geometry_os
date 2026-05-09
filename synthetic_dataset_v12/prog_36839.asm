; DESCRIPTION: Creates a blue rectangular region at (31, 78) spanning 97 by 115 pixels.
; PLAN: r0=31(x), r1=78(y), r2=97(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 78
LDI r2, 97
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
