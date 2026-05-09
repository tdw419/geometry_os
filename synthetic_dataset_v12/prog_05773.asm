; DESCRIPTION: Creates a cyan rectangular region at (163, 94) spanning 31 by 34 pixels.
; PLAN: r0=163(x), r1=94(y), r2=31(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 94
LDI r2, 31
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
