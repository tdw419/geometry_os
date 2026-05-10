; DESCRIPTION: Creates a white rectangular region at (44, 15) spanning 75 by 89 pixels.
; PLAN: r0=44(x), r1=15(y), r2=75(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 15
LDI r2, 75
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
