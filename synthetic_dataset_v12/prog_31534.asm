; DESCRIPTION: Creates a purple rectangular region at (79, 71) spanning 110 by 89 pixels.
; PLAN: r0=79(x), r1=71(y), r2=110(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 71
LDI r2, 110
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
