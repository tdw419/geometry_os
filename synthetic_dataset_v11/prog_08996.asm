; DESCRIPTION: Creates a black rectangular region at (129, 150) spanning 31 by 99 pixels.
; PLAN: r0=129(x), r1=150(y), r2=31(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 150
LDI r2, 31
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
