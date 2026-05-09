; DESCRIPTION: Creates a purple rectangular region at (451, 74) spanning 29 by 60 pixels.
; PLAN: r0=451(x), r1=74(y), r2=29(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 74
LDI r2, 29
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
