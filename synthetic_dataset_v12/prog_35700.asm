; DESCRIPTION: Creates a white rectangular region at (78, 158) spanning 80 by 77 pixels.
; PLAN: r0=78(x), r1=158(y), r2=80(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 158
LDI r2, 80
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
