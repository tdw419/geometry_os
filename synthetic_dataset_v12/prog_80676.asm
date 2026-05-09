; DESCRIPTION: Creates a white rectangular region at (271, 89) spanning 78 by 102 pixels.
; PLAN: r0=271(x), r1=89(y), r2=78(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 89
LDI r2, 78
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
