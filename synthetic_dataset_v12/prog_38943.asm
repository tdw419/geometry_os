; DESCRIPTION: Creates a white rectangular region at (193, 34) spanning 81 by 110 pixels.
; PLAN: r0=193(x), r1=34(y), r2=81(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 34
LDI r2, 81
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
