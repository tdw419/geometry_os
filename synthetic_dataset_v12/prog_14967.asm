; DESCRIPTION: Creates a black rectangular region at (451, 163) spanning 57 by 89 pixels.
; PLAN: r0=451(x), r1=163(y), r2=57(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 163
LDI r2, 57
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
