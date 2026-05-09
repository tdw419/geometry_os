; DESCRIPTION: Creates a purple rectangular region at (314, 139) spanning 47 by 31 pixels.
; PLAN: r0=314(x), r1=139(y), r2=47(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 139
LDI r2, 47
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
