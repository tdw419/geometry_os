; DESCRIPTION: Creates a purple rectangular region at (388, 2) spanning 31 by 45 pixels.
; PLAN: r0=388(x), r1=2(y), r2=31(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 2
LDI r2, 31
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
