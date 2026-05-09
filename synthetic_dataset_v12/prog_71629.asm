; DESCRIPTION: Creates a purple rectangular region at (451, 87) spanning 28 by 118 pixels.
; PLAN: r0=451(x), r1=87(y), r2=28(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 87
LDI r2, 28
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
