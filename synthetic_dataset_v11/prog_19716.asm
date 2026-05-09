; DESCRIPTION: Creates a red rectangular region at (134, 170) spanning 33 by 78 pixels.
; PLAN: r0=134(x), r1=170(y), r2=33(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 170
LDI r2, 33
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
