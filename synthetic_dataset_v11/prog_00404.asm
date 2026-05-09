; DESCRIPTION: Creates a white rectangular region at (89, 76) spanning 78 by 39 pixels.
; PLAN: r0=89(x), r1=76(y), r2=78(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 76
LDI r2, 78
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
