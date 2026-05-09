; DESCRIPTION: Creates a white rectangular region at (30, 90) spanning 89 by 110 pixels.
; PLAN: r0=30(x), r1=90(y), r2=89(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 90
LDI r2, 89
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
