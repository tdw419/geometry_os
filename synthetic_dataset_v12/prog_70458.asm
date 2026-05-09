; DESCRIPTION: Creates a cyan rectangular region at (201, 110) spanning 97 by 108 pixels.
; PLAN: r0=201(x), r1=110(y), r2=97(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 110
LDI r2, 97
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
