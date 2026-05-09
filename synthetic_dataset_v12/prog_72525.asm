; DESCRIPTION: Creates a red rectangular region at (409, 145) spanning 102 by 78 pixels.
; PLAN: r0=409(x), r1=145(y), r2=102(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 145
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
