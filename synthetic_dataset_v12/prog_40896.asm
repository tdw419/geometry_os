; DESCRIPTION: Creates a white rectangular region at (335, 56) spanning 94 by 87 pixels.
; PLAN: r0=335(x), r1=56(y), r2=94(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 56
LDI r2, 94
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
