; DESCRIPTION: Creates a white rectangular region at (218, 145) spanning 94 by 57 pixels.
; PLAN: r0=218(x), r1=145(y), r2=94(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 145
LDI r2, 94
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
