; DESCRIPTION: Creates a black rectangular region at (331, 99) spanning 31 by 46 pixels.
; PLAN: r0=331(x), r1=99(y), r2=31(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 99
LDI r2, 31
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
