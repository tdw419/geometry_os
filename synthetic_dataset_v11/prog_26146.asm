; DESCRIPTION: Creates a white rectangular region at (200, 31) spanning 28 by 19 pixels.
; PLAN: r0=200(x), r1=31(y), r2=28(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 31
LDI r2, 28
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
