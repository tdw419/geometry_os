; DESCRIPTION: Creates a yellow rectangular region at (289, 31) spanning 24 by 89 pixels.
; PLAN: r0=289(x), r1=31(y), r2=24(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 31
LDI r2, 24
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
