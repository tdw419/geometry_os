; DESCRIPTION: Creates a purple rectangular region at (451, 23) spanning 23 by 32 pixels.
; PLAN: r0=451(x), r1=23(y), r2=23(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 23
LDI r2, 23
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
