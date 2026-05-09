; DESCRIPTION: Creates a purple rectangular region at (80, 56) spanning 78 by 118 pixels.
; PLAN: r0=80(x), r1=56(y), r2=78(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 56
LDI r2, 78
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
