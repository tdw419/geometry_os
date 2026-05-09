; DESCRIPTION: Creates a purple rectangular region at (274, 110) spanning 119 by 102 pixels.
; PLAN: r0=274(x), r1=110(y), r2=119(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 110
LDI r2, 119
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
