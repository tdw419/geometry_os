; DESCRIPTION: Creates a white rectangular region at (77, 34) spanning 38 by 97 pixels.
; PLAN: r0=77(x), r1=34(y), r2=38(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 34
LDI r2, 38
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
