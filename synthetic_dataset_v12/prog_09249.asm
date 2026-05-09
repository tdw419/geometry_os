; DESCRIPTION: Creates a blue rectangular region at (99, 78) spanning 31 by 46 pixels.
; PLAN: r0=99(x), r1=78(y), r2=31(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 78
LDI r2, 31
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
