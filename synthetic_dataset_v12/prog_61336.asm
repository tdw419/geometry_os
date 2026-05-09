; DESCRIPTION: Creates a purple rectangular region at (233, 78) spanning 22 by 94 pixels.
; PLAN: r0=233(x), r1=78(y), r2=22(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 78
LDI r2, 22
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
