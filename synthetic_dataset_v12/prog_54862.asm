; DESCRIPTION: Creates a purple rectangular region at (81, 89) spanning 110 by 112 pixels.
; PLAN: r0=81(x), r1=89(y), r2=110(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 89
LDI r2, 110
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
