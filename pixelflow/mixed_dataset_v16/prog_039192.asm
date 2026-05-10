; DESCRIPTION: Creates a black rectangular region at (357, 23) spanning 97 by 65 pixels.
; PLAN: r0=357(x), r1=23(y), r2=97(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 23
LDI r2, 97
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
