; DESCRIPTION: Creates a purple rectangular region at (458, 2) spanning 37 by 106 pixels.
; PLAN: r0=458(x), r1=2(y), r2=37(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 2
LDI r2, 37
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
