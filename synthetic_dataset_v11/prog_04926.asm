; DESCRIPTION: Creates a white rectangular region at (163, 33) spanning 31 by 36 pixels.
; PLAN: r0=163(x), r1=33(y), r2=31(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 33
LDI r2, 31
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
