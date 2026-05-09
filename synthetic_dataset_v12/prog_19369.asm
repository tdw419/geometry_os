; DESCRIPTION: Creates a black rectangular region at (414, 31) spanning 11 by 84 pixels.
; PLAN: r0=414(x), r1=31(y), r2=11(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 31
LDI r2, 11
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
