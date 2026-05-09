; DESCRIPTION: Creates a purple rectangular region at (20, 192) spanning 102 by 44 pixels.
; PLAN: r0=20(x), r1=192(y), r2=102(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 192
LDI r2, 102
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
