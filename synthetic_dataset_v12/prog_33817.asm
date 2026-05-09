; DESCRIPTION: Creates a black rectangular region at (314, 62) spanning 89 by 32 pixels.
; PLAN: r0=314(x), r1=62(y), r2=89(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 62
LDI r2, 89
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
