; DESCRIPTION: Creates a green rectangular region at (437, 22) spanning 15 by 97 pixels.
; PLAN: r0=437(x), r1=22(y), r2=15(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 22
LDI r2, 15
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
