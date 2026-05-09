; DESCRIPTION: Creates a white rectangular region at (35, 49) spanning 77 by 89 pixels.
; PLAN: r0=35(x), r1=49(y), r2=77(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 49
LDI r2, 77
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
