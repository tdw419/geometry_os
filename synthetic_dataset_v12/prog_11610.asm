; DESCRIPTION: Creates a purple rectangular region at (378, 34) spanning 110 by 90 pixels.
; PLAN: r0=378(x), r1=34(y), r2=110(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 34
LDI r2, 110
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
