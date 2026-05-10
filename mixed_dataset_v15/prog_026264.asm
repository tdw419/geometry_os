; DESCRIPTION: Creates a white rectangular region at (335, 26) spanning 92 by 97 pixels.
; PLAN: r0=335(x), r1=26(y), r2=92(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 26
LDI r2, 92
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
