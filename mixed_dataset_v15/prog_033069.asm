; DESCRIPTION: Creates a white rectangular region at (251, 49) spanning 97 by 110 pixels.
; PLAN: r0=251(x), r1=49(y), r2=97(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 49
LDI r2, 97
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
