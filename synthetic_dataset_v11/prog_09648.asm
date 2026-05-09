; DESCRIPTION: Creates a white rectangular region at (89, 192) spanning 22 by 34 pixels.
; PLAN: r0=89(x), r1=192(y), r2=22(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 192
LDI r2, 22
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
