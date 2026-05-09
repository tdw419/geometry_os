; DESCRIPTION: Creates a white rectangular region at (31, 30) spanning 62 by 94 pixels.
; PLAN: r0=31(x), r1=30(y), r2=62(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 30
LDI r2, 62
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
